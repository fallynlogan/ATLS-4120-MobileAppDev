//
//  ViewController.swift
//  Lab_4
//
//  Created by Fallyn Logan on 10/5/20.
//

import UIKit

//resource: youtube video title - HIDE KEYBOARD (Swift-4,Xcode-9) (WHEN TAP ANYWHERE)
//didnt bring video url over to remote mac sorry I was lazy
extension UIViewController {
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
        
    @objc func dismissKeyboard(){
            view.endEditing(true)
    }
    
}

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var yourName: UITextField!
    @IBOutlet weak var teamName: UITextField!
    @IBOutlet weak var adjectiveWord: UITextField!
    @IBOutlet weak var friendStepper: UIStepper!
    @IBOutlet weak var friend1: UIImageView!
    @IBOutlet weak var friend2: UIImageView!
    @IBOutlet weak var friend3: UIImageView!
    @IBOutlet weak var friend4: UIImageView!
    @IBOutlet weak var friend5: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    

    @IBAction func createTeamButton(_ sender: UIButton) {
        if sender.tag == 1 {
            titleLable.text = yourName.text! + "'s" + " " + adjectiveWord.text! + " " + teamName.text!
        }
    }
    @IBAction func updatePicture(_ sender: UIStepper) {
        //set max value of stepper to 6
        //if stepper value is six send error saying too many team members
        
        if friendStepper.value == 1 {
            //assign friend 1 image to friend1 UIImage view & so on
            friend1.image = UIImage(named: "apple")
        }
        
        if friendStepper.value == 2 {
            friend2.image = UIImage(named: "banana")
            
        }
        
        if friendStepper.value == 3 {
            friend3.image = UIImage(named: "grapes")
            
        }
        
        if friendStepper.value == 4 {
            friend4.image = UIImage(named: "orange")
            
        }
        
        if friendStepper.value == 5 {
            friend5.image = UIImage(named: "pineapple")
            
        }
        
        if friendStepper.value >= 6 {
            let alert = UIAlertController(title: "Warning", message: "Sorry, you cannot have more than 5 products on your farm", preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {action in
                self.friendStepper.value = 5
            })
            alert.addAction(okAction)
         present(alert, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //dismiss keyboard
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        yourName.delegate = self
        teamName.delegate = self
        adjectiveWord.delegate = self
        
        super.viewDidLoad()
        
        self.hideKeyboard()
        // Do any additional setup after loading the view.
    }


}

