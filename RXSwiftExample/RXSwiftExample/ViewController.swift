//
//  ViewController.swift
//  RXSwiftExample
//
//  Created by Hécto Cuevas on 4/22/19.
//  Copyright © 2019 Héctor Cuevas. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import CoreMotion

class ViewController: UIViewController {

    let motion = CMMotionManager()
    var sensors = [String]()
    var showedColors =  [String]()
    
    let disposeBag = DisposeBag()
    
    lazy var tableView:UITableView = {
       let t = UITableView(frame: .zero)
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        return t
    }()
    
    lazy var searchBar: UISearchBar = {
       let s = UISearchBar(frame: .zero)
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        sensors = ["Accelerometer", "Compas", "GPS", "Proximity", "Light"]
        showedColors = sensors
        searchBar.rx.text.orEmpty.debounce(0.5, scheduler: MainScheduler.instance).distinctUntilChanged().subscribe { (event) in
            self.showedColors = self.sensors.filter({$0.uppercased().hasPrefix(event.element!.uppercased())})
            if event.element! == "" {
                self.showedColors = self.sensors
            }
            self.tableView.reloadData()
            
            }.disposed(by: disposeBag)
        //configureAndStartAccelerometer()
    }

    func setupView()  {
        
        [tableView, searchBar].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor)
            ])
        
    }
    
    func configureAndStartAccelerometer()  {
        
        let square = UIView(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2, width: 200, height: 200))
        square.backgroundColor = .red
        self.view.addSubview(square)
        
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 60.0
            self.motion.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
                if let data = data {
                    print(data.acceleration)
                    square.frame.origin = CGPoint(x: self.view.frame.width * CGFloat(data.acceleration.x), y: self.view.frame.height * CGFloat(data.acceleration.y))
                    square.frame.size = CGSize(width: -data.acceleration.z * 400, height: -data.acceleration.z * 400)
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GyroscopeViewController()
        
        self.show(vc, sender: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return showedColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.showedColors[indexPath.row]
        return cell
        
    }
}
