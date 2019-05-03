//
//  ContactsListViewController.swift
//  MVVMContacts
//
//  Created by Héctor Cuevas on 5/2/19.
//  Copyright © 2019 Héctor Cuevas. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController {

    lazy var tableView:UITableView = {
        let t = UITableView(frame: .zero)
        t.translatesAutoresizingMaskIntoConstraints = false
        t.dataSource = self
        t.register(ContactTableViewCell.self, forCellReuseIdentifier: "cell")
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView()  {
        [tableView].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
}

extension ContactsListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ContactTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ContactTableViewCell
        cell.name = contactsViewModel[indexPath.row].name
        cell.phone = contactsViewModel[indexPath.row].phone
        return cell
    }
}
