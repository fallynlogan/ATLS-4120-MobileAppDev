//
//  Scene2ViewController.swift
//  la5_ExtraCredit
//
//  Created by Fallyn Logan on 10/17/20.
//

import UIKit

extension UIViewController
{
    func hideKeyboard()
    {
        let tap = UIGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var mountainNameTextField: UITextField!
    @IBOutlet weak var favoriteRunTextField: UITextField!
    var riding_Type: String = ""
    
    @IBAction func ridingTypeSegmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0
        {
            riding_Type = "Skiing"
        }
        else if sender.selectedSegmentIndex == 1
        {
            riding_Type = "Snowboarding"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goBackToFavorites"
        {
            let scene1ViewController = segue.destination as! ViewController
            if mountainNameTextField.text!.isEmpty == false
            {
                scene1ViewController.user.mountainName = mountainNameTextField.text
            }
            if riding_Type.isEmpty == false
            {
                scene1ViewController.user.ridingType = riding_Type
            }
            if favoriteRunTextField.text!.isEmpty == false
            {
                scene1ViewController.user.favTrail = favoriteRunTextField.text
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        mountainNameTextField.delegate = self
        favoriteRunTextField.delegate = self
        self.hideKeyboard();
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
