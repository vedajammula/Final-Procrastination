//
//  CountdownViewController.swift
//  Procrastination
//
//  Created by veda jammula on 7/17/18.
//  Copyright © 2018 Safia & Veda. All rights reserved.
//

import Foundation

import UIKit

class CountdownViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    var multipleTimers: [Int]?
    var timer = Timer()
    var index = 0
    var multipleAssignments: [String]?
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var continueOutlet: UIButton!
    
    
    @IBAction func continueButton(_ sender: UIButton) {
        if index >= (multipleTimers?.count)! {
            return
        }

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        continueOutlet.isHidden = true
        
        titleLabel.text = multipleAssignments?[index]
        
        
    }
    
    @IBOutlet weak var finishButton: UIButton!
    
    @IBAction func finishAction(_ sender: UIButton) {

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        continueOutlet.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        finishButton.isHidden = true
        titleLabel.text = multipleAssignments?[0]
        
    }
    
    
    @objc func counter()
    {
        multipleTimers![index] -= 1
        timeLabel.text = String(multipleTimers![index]) + "seconds"
        
        if (multipleTimers![index] == 0) {
            timer.invalidate()
            
            if index < multipleTimers!.count - 1 {
            index += 1 
            continueOutlet.isHidden = false
            //     sliderOutlet.isHidden = false
            // startOutlet.isHidden = false
            } else {
                finishButton.isHidden = false
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        if identifier == "BackToVC" {
            
            let destination = segue.destination as! ViewController
            
        }
    }
    
    
}
    

