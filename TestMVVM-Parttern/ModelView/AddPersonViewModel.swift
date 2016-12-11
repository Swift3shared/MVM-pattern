//
//  AddPersonViewModel.swift
//  TestMVVM-Parttern
//
//  Created by sok channy on 12/11/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import Foundation

protocol AddPersonViewModelDelegate:NSObjectProtocol {
    func sohwInvalidName()
    func showInvalidSex()
    func showInvalidAge()
    func dissmissAddPerson()
}

class AddPersonViewModel{
    fileprivate var personContext:PersonContext
    
    weak fileprivate var addPersonViewModelDelegate:AddPersonViewModelDelegate?
    
    init(_ personContext:PersonContext){
        self.personContext = personContext
    }
    
    func attachToDelegate(_ addPersonViewModelDelegate:AddPersonViewModelDelegate) {
        self.addPersonViewModelDelegate = addPersonViewModelDelegate
    }
    
    func handleDonePressed(){
        if !validateName {
            
            addPersonViewModelDelegate?.sohwInvalidName()
            
        }else if !validateSex{
            
            addPersonViewModelDelegate?.showInvalidSex()
            
        }else if !validateAge{
            
            addPersonViewModelDelegate?.showInvalidAge()
            
        }else {
            addPerson()
            addPersonViewModelDelegate?.dissmissAddPerson()
        }
    }
    
    var name = ""
    var age = ""
    var sex = ""
    
    var nameComponents : [String] {
        return name.components(separatedBy: " ").filter { !$0.isEmpty }
    }
    
    var validateSex : Bool {
        return sex=="male" || sex=="female"
    }
    
    
    var validateName : Bool {
        return nameComponents.count >= 2
    }
    
    var validateAge : Bool {
        let value = (age as NSString).intValue
        return value > 0 && value < 100
    }
    
    
    func addPerson() {
        let names = nameComponents
        
        let age = (self.age as NSString).intValue
        
        let person = Person(firstName: names[0],lastName: names[1],sex: sex, age: Int(age), createdAt: Date())
        
        personContext.addPerson(person)
    }
    
}
