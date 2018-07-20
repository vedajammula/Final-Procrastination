//
//  SliderCell.swift
//  Procrastination
//
//  Created by veda jammula on 7/17/18.
//  Copyright © 2018 Safia & Veda. All rights reserved.
//

import Foundation

import UIKit

class SliderCell: UITableViewCell {
    var minutes = 30

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var sliderTimer: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
        minutes = Int(sender.value)
        timerLabel.text = String(minutes) + " minutes"

    }
    
    
    
}
