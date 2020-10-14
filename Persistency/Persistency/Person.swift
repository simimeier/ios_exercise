//
//  PersonData.swift
//  EditList
//
//  Created by Simon Meier on 12.10.20.
//

import Foundation

class Person{
    
    var firstName : String
    var lastName : String
    var postalCode : Int
    
    init(firstName: String, lastName : String, postalCode: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.postalCode = postalCode
    }
}
