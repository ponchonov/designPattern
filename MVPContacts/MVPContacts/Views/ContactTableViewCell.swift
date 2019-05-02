//
//  ContactTableViewCell.swift
//  MVPContacts
//
//  Created by Hécto Cuevas on 4/24/19.
//  Copyright © 2019 Héctor Cuevas. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    var name:String? {
        didSet {
            nameLabel.text = "Nombre: \(name ?? "")"
        }
    }
    
    var phone:String? {
        didSet {
            phoneLabel.text = "Teléfono: \(phone ?? "")"
        }
    }
    
    lazy var nameLabel:UILabel = {
       let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var phoneLabel:UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    
    
    lazy var avatar:UIImageView = {
       let i = UIImageView(frame: .zero)
        i.image = UIImage(named: "avatar")
        i.translatesAutoresizingMaskIntoConstraints = false
        
        return i
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpView()  {
        
        [avatar, nameLabel, phoneLabel].forEach(contentView.addSubview)
        
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            avatar.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            avatar.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            
            phoneLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            ])
    }
}
