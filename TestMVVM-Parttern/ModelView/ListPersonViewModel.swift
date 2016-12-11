//
//  ListPersonViewModel.swift
//  TestMVVM-Parttern
//
//  Created by sok channy on 12/11/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import Foundation

class ListPersonViewModel{
    
    open let personContext: PersonContext
    
    public init(_ personContext: PersonContext) {
        self.personContext = personContext
    }
    
    weak fileprivate var delegate: ListPersonViewModelDelegate?
    
    open func handleAddPressed() {
        delegate?.showAddPersonView()
    }
    
    
    open var items = [Item]()
    
    open func refresh() {
        items = personContext.persons.map { self.itemForPerson($0) }
    }
    
    
    func itemForPerson(_ person:Person) -> Item {
        let singleLetter = person.lastName.substring(to: person.lastName.characters.index(after: person.lastName.startIndex))
        
        let title = "\(person.firstName) \(singleLetter)."
        let subtitle = DateFormatter.localizedString(from: person.createdAt as Date, dateStyle: DateFormatter.Style.long, timeStyle: DateFormatter.Style.none)
        
        
        let item = Item(title: title, subtitle: subtitle)
        
        return item
    }
    
    
    public struct Item {
        
        public let title: String
        
        public let subtitle: String
        
    }
    
}

public protocol ListPersonViewModelDelegate: class{
    
    func showAddPersonView()
    
}
