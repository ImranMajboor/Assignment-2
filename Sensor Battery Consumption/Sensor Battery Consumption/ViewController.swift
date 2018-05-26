//
//  ViewController.swift
//  Sensor Battery Consumption
//
//  Created by Imran Majboor on 22/4/18.
//  Copyright © 2018 Imran Majboor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewContraint: NSLayoutConstraint!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var closeMenu: UILabel!
    @IBOutlet weak var welcomeText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurView.layer.cornerRadius = 15
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 0.8
        sideView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        viewContraint.constant = -175
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 { //swipe right
                
                if viewContraint.constant < 20 {
                    self.menuLabel.isHidden = true
                    self.welcomeText.isHidden = true
                    self.closeMenu.isHidden = false
                    UIView.animate(withDuration: 0.2, animations: {
                        
                        self.viewContraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
            }else {            //swipe left
                if viewContraint.constant > -175 {
                    self.menuLabel.isHidden = false
                    self.welcomeText.isHidden = false
                    self.closeMenu.isHidden = true
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewContraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
            }
        } else if sender.state == .ended {
            if viewContraint.constant < -100 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewContraint.constant = -175
                    self.view.layoutIfNeeded()
                })
            }
            else{
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewContraint.constant = 0
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

