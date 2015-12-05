//
//  ViewController.swift
//  WARDoorView
//
//  Created by Warif Akhand Rishi on 12/05/2015.
//  Copyright (c) 2015 Warif Akhand Rishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var warDoorView: WARDoorView!
    
    @IBAction func closeDoorButtonAcition(sender: AnyObject) {
        
        warDoorView.doorClose(completion: {() in
            print("Door did close.")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        warDoorView.doorOpen()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

