//
//  ViewController.swift
//  helloworld
//
//  Created by Fallyn Logan on 8/27/20.
//  Copyright © 2020 Fallyn Logan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageText: UILabel!
    @IBAction func buttonPress(_ sender: UIButton) {
        messageText.text = "Hello World!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

