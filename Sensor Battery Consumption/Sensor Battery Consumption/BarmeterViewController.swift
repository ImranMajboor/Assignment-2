//
//  BarmeterViewController.swift
//  Sensor Battery Consumption
//
//  Created by Imran Majboor on 26/5/18.
//  Copyright © 2018 Imran Majboor. All rights reserved.
//

import UIKit
import CoreMotion

class BarmeterViewController: UIViewController {

    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var kPA: UILabel!
    
    var altimeter = CMAltimeter()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler: { (altitudeData:CMAltitudeData?, error:Error?) in
            
            let altitude = altitudeData!.relativeAltitude.floatValue
            let kPa = altitudeData!.pressure.floatValue
            
            // Update labels, truncate float to two decimal points
            self.altitude.text = String(format: "%.02f", altitude)
            self.kPA.text = String(format: "%.02f", kPa)
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
