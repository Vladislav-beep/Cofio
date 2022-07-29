//
//  UICollectionView+Extension.swift
//  Cofio
//
//  Created by Владислав Сизонов on 22.07.2022.
//

import UIKit

extension UICollectionView {
    static var languageCollectionView: UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .languageCollectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
}

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        String(describing: self)
    }

    var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }
}

extension UITableView {
        
    func register<T: UITableViewCell>(_ type: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func reuse<T: UITableViewCell>(_ type: T.Type, _ indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
