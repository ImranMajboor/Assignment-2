//
//  GyroViewController.swift
//  Sensor Battery Consumption
//
//  Created by Imran Majboor on 24/5/18.
//  Copyright © 2018 Imran Majboor. All rights reserved.
//

import UIKit
import CoreMotion

class GyroViewController: UIViewController {
    
    @IBOutlet weak var yAxis: UILabel!
    @IBOutlet weak var xAxis: UILabel!
    @IBOutlet weak var zAxis: UILabel!
    
    var motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager.gyroUpdateInterval = 0.2
        
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let gyroData = data
            {
                let xaxis = gyroData.rotationRate.x
                let yaxis = gyroData.rotationRate.y
                let zaxis = gyroData.rotationRate.z
                
                self.view.reloadInputViews()
                //self.xAxis.text = "x: \(gyroData.rotationRate.x) m/s"
                //self.yAxis.text = "y: \(gyroData.rotationRate.y) m/s"
                //self.zAxis.text = "z: \(gyroData.rotationRate.z) m/s"
                
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
