//
//  ViewController.swift
//  la5_ExtraCredit
//
//  Created by Fallyn Logan on 10/17/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mountainNameLabel: UILabel!
    @IBOutlet weak var ridingTypeLabel: UILabel!
    @IBOutlet weak var favoriteTrailLabel: UILabel!
    
    var user = Favorite()
    
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue)
    {
        mountainNameLabel.text = user.mountainName
        ridingTypeLabel.text = user.ridingType
        favoriteTrailLabel.text = user.favTrail
    }


}

