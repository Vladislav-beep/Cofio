//
//  Theme+CoreDataProperties.swift
//  Cofio
//
//  Created by Владислав Сизонов on 29.12.2022.
//
//

import Foundation
import CoreData


extension Theme {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Theme> {
        return NSFetchRequest<Theme>(entityName: "Theme")
    }

    @NSManaged public var name: String?
    @NSManaged public var repeats: Int64
    @NSManaged public var repeatDate: Date?
    @NSManaged public var isRepeatComplete: Bool
    @NSManaged public var collection: Collection?
    @NSManaged public var cards: NSSet?

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
