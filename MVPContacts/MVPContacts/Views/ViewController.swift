//
//  ViewController.swift
//  MVPContacts
//
//  Created by Hécto Cuevas on 4/24/19.
//  Copyright © 2019 Héctor Cuevas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView:UITableView =  {
        let t = UITableView(frame: .zero)
        t.translatesAutoresizingMaskIntoConstraints = false
        t.dataSource = self
        t.register(ContactTableViewCell.self, forCellReuseIdentifier: "contact")
        
        return t
    }()
    
    private let contactPresenter = ContactPresenter(contactService: ContactService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        setUpView()
        contactPresenter.setViewDelegate(contactViewDelegate: self)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView()  {
        [self.tableView].forEach(view.addSubview)
        self.title = "Contacts"
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }
}

//table view delegates

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactPresenter.numberOfContacts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactTableViewCell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as! ContactTableViewCell
        contactPresenter.getCellData(index: indexPath.row) { (name, phone) in
            cell.name = name
            cell.phone = phone
        }
        return cell
    }
}

// presenter delegates
extension ViewController: ContactViewDelegate {

    func displayContacts() {
        tableView.reloadData()
    }
}

