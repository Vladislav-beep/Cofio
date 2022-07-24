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
