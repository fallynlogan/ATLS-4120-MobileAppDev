//
//  ViewController.swift
//  Emote
//
//  Created by Fallyn Logan on 10/6/20.
//

import UIKit

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
    
    var didStartSpinning = false
    var didStopSpinning = true
    
    //site this source
    func UIColorFromHex(rgbValue:UInt32)->UIColor {
        let alpha = 1.0
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }

    func runGame() {
        startButton.removeFromSuperview()
        titleLabel.removeFromSuperview()
        //check if acceleration is zero from accelorometor
        if didStopSpinning == true {
            if UIDevice.current.orientation == UIDeviceOrientation.portrait {
                self.view.backgroundColor = UIColorFromHex(rgbValue: 0xDBD26D)
                faceImage.image = UIImage(named: "smile_icon")
                emotionWordLabel.text = happyWords.randomElement()
            }
            else if UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown {
                self.view.backgroundColor = UIColorFromHex(rgbValue: 0x8A87E6)
                faceImage.image = UIImage(named: "meh_icon")
                emotionWordLabel.text = mehWords.randomElement()
            }
            else if UIDevice.current.orientation ==     UIDeviceOrientation.landscapeLeft {
                self.view.backgroundColor = UIColorFromHex(rgbValue: 0xF08FD3)
                faceImage.image = UIImage(named: "angry_icon")
                emotionWordLabel.text = angryWords.randomElement()
            
            }
            else if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
                self.view.backgroundColor = UIColorFromHex(rgbValue: 0x5BB5A6)
                faceImage.image = UIImage(named: "frown_icon")
                emotionWordLabel.text = sadWords.randomElement()
            }
        }
    }
    
    @IBAction func startTryAgainButton(_ sender: UIButton) {
        if sender.tag == 1 {
            runGame()
        }
        if sender.tag == 2 {
           //restart back to initial view
        }
    }
    
    func editLabels() {
        if nameTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Whoops!", message: "Looks like you forgot to add your name", preferredStyle: UIAlertController.Style.alert)
            //change this so that keyboard pops back up
            let addNameAction = UIAlertAction(title: "Add name", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(addNameAction)
            present(alert, animated: true, completion: nil)
        } else {
            whatsYourNameLabel.removeFromSuperview()
            nameTextField.removeFromSuperview()
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
        // Do any additional setup after loading the view.
    }


}

