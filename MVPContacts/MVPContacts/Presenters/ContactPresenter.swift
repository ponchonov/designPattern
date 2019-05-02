//
//  ContactPresenter.swift
//  MVPContacts
//
//  Created by Hécto Cuevas on 4/24/19.
//  Copyright © 2019 Héctor Cuevas. All rights reserved.
//

import Foundation

protocol ContactViewDelegate: NSObjectProtocol {
    func displayContacts()
}

class ContactPresenter {
    
    weak private var contactViewDelegate: ContactViewDelegate?
    private let contactService: ContactService?

    var numberOfContacts:Int {
        return contactService?.currentContacts().count ?? 0
    }
    
    init(contactService:ContactService) {
        self.contactService = contactService
    }
    
    func setViewDelegate(contactViewDelegate: ContactViewDelegate) {
        self.contactViewDelegate = contactViewDelegate
        self.contactViewDelegate?.displayContacts()
    }
    
    func getCellData(index:Int, callBack:(_ name:String, _ phone:String) -> Void) {
        guard let service = contactService else {return}
        let contact = service.contactForIndex(index: index)
        callBack(contact.name, contact.phoneNumber)
    }
}
