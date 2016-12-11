//
//  PersonContext .swift
//  TestMVVM-Parttern
//
//  Created by sok channy on 12/11/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import Foundation

class PersonContext{
    var persons:[Person] = []
    
    init() {}
    
    func addPerson(_ person:Person) {
        persons.insert(person, at: 0)
    }
    
    class var shared:PersonContext {
        get{
            return personContext
        }
    }
}

fileprivate let personContext = PersonContext()
