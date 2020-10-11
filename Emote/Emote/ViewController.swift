//
//  ViewController.swift
//  Emote
//
//  Created by Fallyn Logan on 10/6/20.
//

import UIKit

extension UIViewController {
    //source for this referenced in my Lab 4 ViewController.swift
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var whatsYourNameLabel: UILabel!
    @IBOutlet weak var emotionWordLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var faceImage: UIImageView!
    
    let happyWords = ["Happy", "Excited", "Confident", "Hopeful"]
    let mehWords = ["Ashamed", "Confused", "Anxious", "Fearful"]
    let sadWords = ["Sad", "Uncertain", "Lonely", "Doubtful"]
    let angryWords = ["Angry", "Jealous", "Frustrated", "Resentful"]
    var spinTimer = Timer()
    var checkOrientationTimer = Timer()
    var changeBackgroundTimer = Timer()
    var hasStoppedSpinning = false
    
    //Source: https://coderwall.com/p/6rfitq/ios-ui-colors-with-hex-values-in-swfit
    func updateBackgroundColor(rgbValue:UInt32)->UIColor {
        let alpha = 1.0
        let r = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let g = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let b = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:r, green:g, blue:b, alpha:CGFloat(alpha))
    }

    func spinWheel() {
       titleLabel.isHidden = false
       titleLabel.text = "Spin Your Device"
       faceImage.image = UIImage(named: "spin_icon")
       hiLabel.isHidden = true
       //sources referenced: class notes & https://codewithchris.com/swift-timer/
       spinTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(setSpinning), userInfo: nil, repeats: false)
       //sources referenced: class notes & apple docs https://developer.apple.com/documentation/uikit/uiview/1622418-animate
        UIView.animate(withDuration: 10, animations:  {
        self.changeBackgroundTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(self.changeBackgroundFunc), userInfo: nil, repeats: true)
        })
    }
    
    @objc func setSpinning() {
        titleLabel.isHidden = true
        hiLabel.isHidden = false
        checkOrientation()
        changeBackgroundTimer.invalidate()
        
    }
    
    @objc func changeBackgroundFunc() {
        let yellow = updateBackgroundColor(rgbValue: 0xDBD26D)
        let purple = updateBackgroundColor(rgbValue: 0x8A87E6)
        let pink = updateBackgroundColor(rgbValue: 0xF08FD3)
        let green = updateBackgroundColor(rgbValue: 0x5BB5A6)
        let background = [yellow, pink, green, purple]
        //source referenced: https://developer.apple.com/documentation/swift/array/2994747-randomelement
        let randomBackground = background.randomElement()
        self.view.backgroundColor = randomBackground
    }

    func runGame() {
        startButton.isHidden = true
        titleLabel.isHidden = true
        spinWheel()
    }
    
    func resetGame() {
        startButton.isHidden = false
        titleLabel.isHidden = false
        whatsYourNameLabel.isHidden = false
        nameTextField.isHidden = false
        hiLabel.text = "Hi there,"
        titleLabel.text = "Emote"
        self.view.backgroundColor =  updateBackgroundColor(rgbValue: 0x5BB5A6)
        emotionWordLabel.text = " "
        startButton.setTitle(" ",for: UIControl.State.normal)
        tryAgainButton.setTitle(" ",for: UIControl.State.normal)
        faceImage.image = UIImage(named: "smile_icon")
    }
    
    func checkOrientation(){
        let yellow = updateBackgroundColor(rgbValue: 0xDBD26D)
        let purple = updateBackgroundColor(rgbValue: 0x8A87E6)
        let pink = updateBackgroundColor(rgbValue: 0xF08FD3)
        let green = updateBackgroundColor(rgbValue: 0x5BB5A6)
        
        if UIDevice.current.orientation == UIDeviceOrientation.portrait {
            self.view.backgroundColor = yellow
            faceImage.image = UIImage(named: "smile_icon")
            emotionWordLabel.text = happyWords.randomElement()
        }
        else if UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown {
            self.view.backgroundColor = purple
            faceImage.image = UIImage(named: "meh_icon")
            emotionWordLabel.text = mehWords.randomElement()
        }
        else if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
            self.view.backgroundColor = pink
            faceImage.image = UIImage(named: "angry_icon")
            emotionWordLabel.text = angryWords.randomElement()
        }
        else if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            self.view.backgroundColor = green
            faceImage.image = UIImage(named: "frown_icon")
            emotionWordLabel.text = sadWords.randomElement()
        }
        else {
            let alert = UIAlertController(title: "Whoops!", message: "Looks like your device is not in the correct orientation, fix it and try again!", preferredStyle: UIAlertController.Style.alert)
            let addNameAction = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler:nil)
            alert.addAction(addNameAction)
            present(alert, animated: true, completion: nil)        }
    }
    
    @IBAction func startTryAgainButton(_ sender: UIButton) {
        if sender.tag == 1 {
            runGame()
        }
        if sender.tag == 2 {
           resetGame()
        }
    }
    
    func editLabels() {
        if nameTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Whoops!", message: "Looks like you forgot to add your name", preferredStyle: UIAlertController.Style.alert)
            let addNameAction = UIAlertAction(title: "Add name", style: UIAlertAction.Style.default, handler:nil)
            alert.addAction(addNameAction)
            present(alert, animated: true, completion: nil)
        }
        else {
            whatsYourNameLabel.isHidden = true
            nameTextField.isHidden = true
            hiLabel.text = "Hi, " + nameTextField.text!
            startButton.setTitle("start", for: UIControl.State.normal)
            tryAgainButton.setTitle("enter new name", for: UIControl.State.normal)
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        editLabels()
    }

    override func viewDidLoad() {
        nameTextField.delegate = self
        super.viewDidLoad()
        self.hideKeyboard()
    }


}

