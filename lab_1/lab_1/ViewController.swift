//
//  ViewController.swift
//  lab_1
//
//  Created by Fallyn Logan on 9/8/20.
//  Copyright © 2020 Fallyn Logan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeMouth: UIButton!
    @IBOutlet weak var addText: UIButton!
    @IBOutlet weak var mouthImage: UIImageView!
    @IBOutlet weak var noseImage: UIImageView!
    @IBOutlet weak var eyesImage: UIImageView!
    
    var count = 0
    //sources used for changing button title:
    //https://stackoverflow.com/questions/26326296/changing-text-of-uibutton-programmatically-swift
    //https://developer.apple.com/documentation/uikit/uibutton/1624018-settitle
    @IBAction func addFeatures(_ sender: UIButton) {
        if sender.tag == 1 && count == 0 {
            eyesImage.image = UIImage(named: "Eyes")
            addText.setTitle("Add Nose", for: UIControl.State.normal)
            count = count + 1
        }
        else if sender.tag == 1 && count == 1 {
            noseImage.image = UIImage(named: "Nose")
            addText.setTitle("Add Mouth", for: UIControl.State.normal)
            count = count + 1
        }
        else if sender.tag == 1 && count == 2 {
            mouthImage.image = UIImage(named: "Mouth_Happy")
            addText.setTitle("All", for: UIControl.State.normal)
            changeMouth.setTitle("Happy", for: UIControl.State.normal)
            count = count + 1
        }
        else if sender.tag == 2 && count == 3 {
            mouthImage.image = UIImage(named: "Mouth_Nervous")
            changeMouth.setTitle("Nervous", for: UIControl.State.normal)
            count = count + 1
        } else if sender.tag == 2 && count == 4 {
            mouthImage.image = UIImage(named: "Mouth_Sad")
            changeMouth.setTitle("Sad", for: UIControl.State.normal)
            count = count + 1
        }
        else if count == 5 {
            changeMouth.setTitle("Done", for: UIControl.State.normal)
        }
        print(count)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
