//
//  ContractListTableViewCell.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 22/12/24.
//

import UIKit

class ContractListTableViewCell: UITableViewCell {
    
    static let identifier = "contractListTableViewCell"
    
    private let nameLabel: UILabel = {
        let _label = UILabel()
        _label.textColor = .black
        _label.textAlignment = .center
        _label.translatesAutoresizingMaskIntoConstraints = false
        _label.font = AppFonts.shared.headingRegular
        return _label
    }()
    
    private let numberLabel: UILabel = {
        let _label = UILabel()
        _label.textColor = .black
        _label.textAlignment = .center
        _label.translatesAutoresizingMaskIntoConstraints = false
        _label.font = AppFonts.shared.custom(16, .regular)
        return _label
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpContactLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpContactLabel()
    }
    
    private func setUpContactLabel() {
        // Add labels to the content view
        contentView.addSubview(nameLabel)
        contentView.addSubview(numberLabel)
        
        // Set up constraints for nameLabel and numberLabel
        NSLayoutConstraint.activate([
            // Constraints for nameLabel
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Constraints for numberLabel
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            numberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20) // Adjust bottom padding
        ])
    }
    
    func setUpContact(using contact: Contact) {
        nameLabel.text = contact.name
        numberLabel.text = contact.number
    }
}
