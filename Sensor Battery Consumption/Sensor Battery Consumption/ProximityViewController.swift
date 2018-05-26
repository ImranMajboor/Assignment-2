//
//  ProximityViewController.swift
//  Sensor Battery Consumption
//
//  Created by Imran Majboor on 24/5/18.
//  Copyright © 2018 Imran Majboor. All rights reserved.
//

import UIKit

class ProximityViewController: UIViewController {
    
    var isCovered = 0
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var timeCovered: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDevice.current.isProximityMonitoringEnabled = true
        
        let proximity = UIDevice.current.proximityState
        if (proximity)
        {
            NSLog("true");
            statusLabel.text = " is on"
            isCovered += 1
            timeCovered.text = "\(isCovered)"
        }
        else
        {
            NSLog("false");
            statusLabel.text = " is not covered"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
}
