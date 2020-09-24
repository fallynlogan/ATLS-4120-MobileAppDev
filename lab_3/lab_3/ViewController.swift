//
//  ViewController.swift
//  lab_3
//
//  Created by Fallyn Logan on 9/22/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var day_nightImage: UIImageView!
    @IBOutlet weak var flowerImage: UIImageView!
    @IBOutlet weak var titleSizeLabel: UILabel!
    @IBOutlet weak var day_nightLabel: UILabel!
    @IBOutlet weak var sizeNumberLabel: UILabel!
    @IBOutlet weak var flowerNameLabel: UILabel!
    
    @IBAction func pickFlower(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            //Aster
            flowerImage.image = UIImage(named: "Aster")
            flowerNameLabel.text = "ASTER"
        }
        else if sender.selectedSegmentIndex == 1 {
            //Pansy
            flowerImage.image = UIImage(named: "Pansy")
            flowerNameLabel.text = "PANSY"
        }
        else if sender.selectedSegmentIndex == 2 {
            //snapdragon
            flowerImage.image = UIImage(named: "Snapdragon")
            flowerNameLabel.text = "SNAPDRAGON"
        }
        else if sender.selectedSegmentIndex == 3 {
            //Anemone
            flowerImage.image = UIImage(named: "Anemone")
            flowerNameLabel.text = "ANEMONE"
        }
    }
    
    @IBAction func day_nightSwitch(_ sender: UISwitch) {
        if sender.isOn {
            day_nightImage.image = UIImage(named: "Sun")
            day_nightLabel.text = "day"
            day_nightLabel.text = day_nightLabel.text?.uppercased()
            titleSizeLabel.text = titleSizeLabel.text?.uppercased()
            flowerNameLabel.text = flowerNameLabel.text?.uppercased()
            header.textColor = UIColor.black
            day_nightLabel.textColor = UIColor.black
            titleSizeLabel.textColor = UIColor.black
            sizeNumberLabel.textColor = UIColor.black
            flowerNameLabel.textColor = UIColor.black
            self.view.backgroundColor = #colorLiteral(red: 0.6842852831, green: 0.8219367862, blue: 1, alpha: 1)
            //self.view.backgroundColor = UIColor(red: 167.0, green: 232.0, blue: 255.0)
        } else {
            day_nightImage.image = UIImage(named: "Moon")
            day_nightLabel.text = "night"
            day_nightLabel.text = day_nightLabel.text?.lowercased()
            titleSizeLabel.text = titleSizeLabel.text?.lowercased()
            flowerNameLabel.text = flowerNameLabel.text?.lowercased()
            header.textColor = UIColor.white
            day_nightLabel.textColor = UIColor.white
            titleSizeLabel.textColor = UIColor.white
            sizeNumberLabel.textColor = UIColor.white
            flowerNameLabel.textColor = UIColor.white
            self.view.backgroundColor = UIColor.darkGray
        }
    }
    
    @IBAction func sizeSlider(_ sender: UISlider) {
        //get new value
        let fontSize = sender.value
        
        //change header text size
        let fontSizeCGFloat = CGFloat(fontSize)
        flowerNameLabel.font = UIFont(name: "Futura", size: fontSizeCGFloat)
        flowerNameLabel.font = UIFont.systemFont(ofSize: fontSizeCGFloat)
        //update text label
        sizeNumberLabel.text = String(format: "%.0f", fontSize)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
