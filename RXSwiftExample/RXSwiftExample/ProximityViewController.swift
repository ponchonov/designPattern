//
//  ProximityViewController.swift
//  RXSwiftExample
//
//  Created by Héctor Cuevas on 5/3/19.
//  Copyright © 2019 Héctor Cuevas. All rights reserved.
//

import UIKit
import RxSwift

class ProximityViewController: BaseViewController {
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let device = UIDevice.current
        
        device.isProximityMonitoringEnabled = true
        
        
        
        let proximityState = Observable.just(device.proximityState)

        let observable = Observable.just(device.proximityState).subscribe { (event) in
            print(event)
        }
        
//        searchBar.rx.text.orEmpty.debounce(0.5, scheduler: MainScheduler.instance).distinctUntilChanged().subscribe { (event) in
//            self.showedColors = self.sensors.filter({$0.uppercased().hasPrefix(event.element!.uppercased())})
//            if event.element! == "" {
//                self.showedColors = self.sensors
//            }
//            self.tableView.reloadData()
//
//            }.disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }
    

}
