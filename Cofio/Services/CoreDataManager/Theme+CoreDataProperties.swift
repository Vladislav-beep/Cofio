//
//  Theme+CoreDataProperties.swift
//  Cofio
//
//  Created by Владислав Сизонов on 14.01.2023.
//
//

import Foundation
import CoreData


extension Theme {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Theme> {
        return NSFetchRequest<Theme>(entityName: "Theme")
    }

    @NSManaged public var isRepeatComplete: Bool
    @NSManaged public var name: String?
    @NSManaged public var repeatDate: Date?
    @NSManaged public var repeats: Int64
    @NSManaged public var creationDate: Date?
    @NSManaged public var repetitionType: String?
    @NSManaged public var cards: NSSet?
    @NSManaged public var collection: Collection?

}

// MARK: Generated accessors for cards
extension Theme {

    @objc(addCardsObject:)
    @NSManaged public func addToCards(_ value: Card)

    @objc(removeCardsObject:)
    @NSManaged public func removeFromCards(_ value: Card)

    @objc(addCards:)
    @NSManaged public func addToCards(_ values: NSSet)

    @objc(removeCards:)
    @NSManaged public func removeFromCards(_ values: NSSet)

}

extension Theme : Identifiable {

}
