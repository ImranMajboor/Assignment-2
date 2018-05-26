//
//  MagneotometerViewController.swift
//  Sensor Battery Consumption
//
//  Created by Imran Majboor on 24/5/18.
//  Copyright © 2018 Imran Majboor. All rights reserved.
//

import UIKit
import CoreMotion

class MagneotometerViewController: UIViewController {
    
    var motionManager = CMMotionManager()

    @IBOutlet weak var yaxis: UILabel!
    @IBOutlet weak var xAxis: UILabel!
    @IBOutlet weak var zAxis: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        motionManager.magnetometerUpdateInterval = 0.2
        
        motionManager.startMagnetometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            if let myData = data
            {
                let xaxis = myData.magneticField.x
                let yAxis = myData.magneticField.y
                let zaxis = myData.magneticField.z
                
                self.view.reloadInputViews()
                //self.xAxis.text = "x: \(myData.magneticField.x) m/s"
                //self.yaxis.text = "y: \(myData.magneticField.y) m/s"
                //self.zAxis.text = "z: \(myData.magneticField.z) m/s"
                
                self.xAxis.text = String(format: "%.03f", xaxis)
                self.yaxis.text = String(format: "%.03f", yAxis)
                self.zAxis.text = String(format: "%.03f", zaxis)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
