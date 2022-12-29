//
//  Collection+CoreDataProperties.swift
//  Cofio
//
//  Created by Владислав Сизонов on 29.12.2022.
//
//

import Foundation
import CoreData


extension Collection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Collection> {
        return NSFetchRequest<Collection>(entityName: "Collection")
    }

    @NSManaged public var name: String?
    @NSManaged public var icon: String?
    @NSManaged public var themes: NSSet?

}

// MARK: Generated accessors for themes
extension Collection {

    @objc(addThemesObject:)
    @NSManaged public func addToThemes(_ value: Theme)

    @objc(removeThemesObject:)
    @NSManaged public func removeFromThemes(_ value: Theme)

    @objc(addThemes:)
    @NSManaged public func addToThemes(_ values: NSSet)

    @objc(removeThemes:)
    @NSManaged public func removeFromThemes(_ values: NSSet)

}

extension Collection : Identifiable {

}
