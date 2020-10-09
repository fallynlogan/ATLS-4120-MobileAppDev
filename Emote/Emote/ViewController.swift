//
//  ViewController.swift
//  Emote
//
//  Created by Fallyn Logan on 10/6/20.
//

import UIKit
import CoreMotion

extension UIViewController {
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
    var checkOrientationTimer = Timer()
    var changeBackgroundTimer = Timer()
    
    //site this source
    func updateBackgroundColor(rgbValue:UInt32)->UIColor {
        let alpha = 1.0
        let r = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let g = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let b = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:r, green:g, blue:b, alpha:CGFloat(alpha))
    }

    
    func spinWheel() {
        for _ in 1...10{
            changeBackgroundTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeBackgroundFunc), userInfo: nil, repeats: false)
        }
    }
    
    @objc func changeBackgroundFunc() {
        let yellow = updateBackgroundColor(rgbValue: 0xDBD26D)
        let purple = updateBackgroundColor(rgbValue: 0x8A87E6)
        let pink = updateBackgroundColor(rgbValue: 0xF08FD3)
        let green = updateBackgroundColor(rgbValue: 0x5BB5A6)
        let background = [yellow, pink, green, purple]
        
        var randomBackground = background.randomElement()
        self.view.backgroundColor = randomBackground
    }

    func runGame() {
        startButton.isHidden = true
        titleLabel.isHidden = true
        //check if acceleration is zero from accelorometor
        //spinWheel()
        checkOrientationTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(checkOrientation), userInfo: nil, repeats: false)
    }
    
    func resetGame() {
        startButton.isHidden = false
        titleLabel.isHidden = false
        whatsYourNameLabel.isHidden = false
        nameTextField.isHidden = false
        hiLabel.text = "Hi there,"
        self.view.backgroundColor =  updateBackgroundColor(rgbValue: 0x5BB5A6)
        emotionWordLabel.text = " "
        startButton.setTitle(" ",for: UIControl.State.normal)
        tryAgainButton.setTitle(" ",for: UIControl.State.normal)
    }
    
    @objc func checkOrientation(){
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

