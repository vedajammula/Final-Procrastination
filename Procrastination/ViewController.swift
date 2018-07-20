//
//  ViewController.swift
//  Procrastination
//
//  Created by veda jammula on 7/16/18.
//  Copyright © 2018 Safia & Veda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var seconds = 30
    var timer = Timer()
    var multipleTimers: [Int] = []
    var numberOfCells = 0
    var multipleAssignments = [String]()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
//    @IBAction func titleAction(_ sender: UITextField) {
//        let tag = sender.tag
//        multipleAssignments[tag] = String(sender.text!)
//    }
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        // Create the alert controller
        let alertController = UIAlertController(title: "Add Task", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Task Name"
          
            
        }

        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.numberOfCells += 1
            self.multipleTimers.append(30)
            
            if let assignmentName = alertController.textFields![0].text {
                
                self.multipleAssignments.append(assignmentName)
                
            }
            self.tableView.reloadData()
            self.startOutlet.isHidden = false
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
            
            
        }
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
        
     

    }

    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
       
    }
    
    
    
    @IBAction func slider(_ sender: UISlider ) {
        let tag = sender.tag
        
        multipleTimers[tag] = Int(sender.value)
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
//
//        self.addChildViewController(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParentViewController: self)
        
        //  sliderOutlet.isHidden = true
          startOutlet.isHidden = false

    }
    
  //  func start() {
  //      return
   // }
    
    
    @objc func counter()
    {
        seconds -= 1
      //  label.text = String(seconds) + "minutes"
        
        if (seconds == 0) {
            timer.invalidate()
            
       //     sliderOutlet.isHidden = false
            startOutlet.isHidden = false
            
        }
    }

    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        seconds = 30
//        sliderOutlet.setValue(30, animated: true)
//        label.text = "30 minutes"
//
   //     sliderOutlet.isHidden = false
        //startOutlet.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOutlet.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SliderCell") as! SliderCell
        cell.sliderTimer.tag = indexPath.row
        cell.titleTextField.text = multipleAssignments[indexPath.row]
        
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        if identifier == "CountdownDisplay" {
            let destination = segue.destination as! CountdownViewController
            destination.multipleTimers = multipleTimers
            destination.multipleAssignments = multipleAssignments
            
            
            
            
        //    var countdownVC: CountdownViewController = segue.destinationViewController as CountdownViewController
            
          //  destination.recievedString = titleTextField.text
            
        }
    }
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
    }
    
}

