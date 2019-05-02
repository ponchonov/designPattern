//
//  ContactService.swift
//  MVPContacts
//
//  Created by Hécto Cuevas on 4/24/19.
//  Copyright © 2019 Héctor Cuevas. All rights reserved.
//

import Foundation

class ContactService {
    private var arrayWithContacts = [Contact]()
    
    func currentContacts() -> [Contact] {
        return arrayWithContacts
    }
    
    func contactForIndex(index:Int) -> Contact {
        return arrayWithContacts[index]
    }
    
    init() {
        for index in 1...10 {
            let contact = Contact(name: "name \(index)", phoneNumber: "3123332342", age: 22, address: "Efraín Gonzalez Luna 2007 apt \(index)", employeeNumber: index)
            arrayWithContacts.append(contact)
        }
    }
    
}
