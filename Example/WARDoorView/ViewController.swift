//
//  ViewController.swift
//  WARDoorView
//
//  Created by Warif Akhand Rishi on 12/05/2015.
//  Copyright (c) 2015 Warif Akhand Rishi. All rights reserved.
//

import UIKit
import WARDoorView

class ViewController: UIViewController {

    @IBOutlet weak var warDoorView: WARDoorView!
    
    @IBAction func closeDoorButtonAcition(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            warDoorView.open {
                print("Door did Open.")
            }
        } else {
            warDoorView.close {
                print("Door did Close.")
            }
        }
    }
    
    @IBAction func insideButtonAction(_ sender: UIButton) {
        print("Inside Button presed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

