//
//  RepetitionCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

final class RepetitionCell: UITableViewCell {
    
    // MARK: Data structures
    
    struct DisplayData: Hashable {
        let title: String
        let repeats: Int
        let nextRepeat: String
    }

    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
    }
}
