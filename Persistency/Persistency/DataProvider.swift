//
//  DataProvider.swift
//  EditList
//
//  Created by Simon Meier on 12.10.20.
//

import Foundation

struct DataProvider{
    static let shared = DataProvider()
    var memberPersons : [Person]
    var memberNames : [String] = []
    
    private init() {

        memberPersons = [
            Person(firstName: "Peter", lastName: "Müller", postalCode: 8000),
            Person(firstName: "Martin", lastName: "Walser", postalCode: 2345),
            Person(firstName: "Quentin", lastName: "Trantino", postalCode: 3456),
            Person(firstName: "Hans", lastName: "Stone", postalCode: 4567),
            Person(firstName: "Otto", lastName: "Lotto", postalCode: 5678),
            Person(firstName: "Dave", lastName: "Grohl", postalCode: 6789),
            Person(firstName: "Johanna", lastName: "Obama", postalCode: 7890),
            Person(firstName: "Stefan", lastName: "Test", postalCode: 8901),
            Person(firstName: "Petra", lastName: "Müll", postalCode: 1234)
        ]
    
        for person in memberPersons {
            memberNames.append(person.firstName)
        }
    }
    
}
