//
//  AccerlometerViewController.swift
//  Sensor Battery Consumption
//
//  Created by Imran Majboor on 24/5/18.
//  Copyright © 2018 Imran Majboor. All rights reserved.
//

import UIKit
import CoreMotion

class AccerlometerViewController: UIViewController {
    
    var motionManager = CMMotionManager()

    @IBOutlet weak var xAxis: UILabel!
    @IBOutlet weak var yAxis: UILabel!
    @IBOutlet weak var zAxis: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        motionManager.accelerometerUpdateInterval = 0.2
        
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            if let myData = data
            {
                let xaxis = myData.acceleration.x
                let yaxis = myData.acceleration.y
                let zaxis = myData.acceleration.z
                
                self.view.reloadInputViews()
                //self.xAxis.text = "x: \(myData.acceleration.x) m/s"
                //self.yAxis.text = "y: \(myData.acceleration.y) m/s"
                //self.zAxis.text = "z: \(myData.acceleration.z) m/s"
                self.xAxis.text = String(format: "%.03f", xaxis)
                self.yAxis.text = String(format: "%.03f", yaxis)
                self.zAxis.text = String(format: "%.03f", zaxis)
            }

        // Do any additional setup after loading the view.
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
