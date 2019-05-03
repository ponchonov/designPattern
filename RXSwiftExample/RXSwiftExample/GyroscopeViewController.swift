//
//  GyroscopeViewController.swift
//  RXSwiftExample
//
//  Created by Héctor Cuevas on 5/3/19.
//  Copyright © 2019 Héctor Cuevas. All rights reserved.
//

import UIKit
import CoreMotion

class GyroscopeViewController: BaseViewController {

    let motion = CMMotionManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAndStartGyroscope()
        // Do any additional setup after loading the view.
    }
    
    
    func configureAndStartGyroscope() {
        let square = UIView(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 200, height: 200))
        square.backgroundColor = .red
        self.view.addSubview(square)
        var rotation = 0.0
        if self.motion.isGyroAvailable {
            self.motion.gyroUpdateInterval = 1.0 / 60.0
            self.motion.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
                if let data = data {
                    print(data.rotationRate)
                    let rate = data.rotationRate.z
                    if (fabs(rate) > 0.2) { // comprobamos si es un valor significativo
                        // Dirección de la rotación
                        let direction:Double = rate > 0 ? 1 : -1;
                        // La rotación lo sumamos al valor actual
                        rotation += direction * .pi/90.0;
                        // Rotamos la imagen
                        square.transform =
                            CGAffineTransform(rotationAngle: CGFloat(rotation));
                    }
                }
            }
        }
    }
}
