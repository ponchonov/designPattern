//
//  ContactsViewModel.swift
//  MVVMContacts
//
//  Created by Héctor Cuevas on 5/2/19.
//  Copyright © 2019 Héctor Cuevas. All rights reserved.
//

import Foundation


var contactsViewModel: [ContactViewModel] = [
    ContactViewModel(contact: Contact(name: "hector", phoneNumber: "3122223231", age: 22, address: "av chapu 333", employeeNumber: 38)),
    ContactViewModel(contact: Contact(name: "alfonso", phoneNumber: "3122223231", age: 22, address: "av chapu 333", employeeNumber: 38)),
    ContactViewModel(contact: Contact(name: "MArio", phoneNumber: "3122223231", age: 22, address: "av chapu 333", employeeNumber: 38)),
    ContactViewModel(contact: Contact(name: "Orlando", phoneNumber: "3122223231", age: 22, address: "av chapu 333", employeeNumber: 38)),]

class ContactViewModel {
    
    private var contact:Contact
    
    init(contact:Contact) {
        self.contact = contact
    }
    
    public var name: String {
        return "Nombre: \(contact.name)"
    }
    
    public var phone: String {
        return "Teléfono: \(contact.phoneNumber)"
    }
}
