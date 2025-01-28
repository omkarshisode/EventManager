//
//  CollectionViewCell.swift
//  collectionView-example
//
//  Created by Omkar Shisode on 05/12/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "collectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("inti() coder has not been implemented.")
    }
    
    func configure(with color: UIColor) {
        contentView.backgroundColor = color
    }
}
