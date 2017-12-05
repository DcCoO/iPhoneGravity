//
//  ViewController.swift
//  iPhoneAccelerometer
//
//  Created by Daniel on 12/4/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    
    let manager = CMMotionManager()
    var velocidade: CGFloat = 0
    var taxaDeUpdate: Double = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if manager.isDeviceMotionAvailable {
            manager.deviceMotionUpdateInterval = taxaDeUpdate
            manager.startDeviceMotionUpdates(to: OperationQueue.main) {
                (data, error) in
                if let data = data {
                    self.velocidade = CGFloat(data.gravity.y)
                    self.testView.transform = CGAffineTransform.identity.rotated(by: CGFloat(self.DegreesToRadians(value: Double(90 * self.velocidade))))
                }
            }
        }
    }
    
    func DegreesToRadians (value:Double) -> Double {
        return value * Double.pi / 180.0
    }



}

