//
//  Card+CoreDataProperties.swift
//  Cofio
//
//  Created by Владислав Сизонов on 14.01.2023.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var cardDefinition: String?
    @NSManaged public var cardDescription: String?
    @NSManaged public var creationDate: Date?
    @NSManaged public var theme: Theme?

}

extension Card : Identifiable {

}
