//
//  TableViewCell.swift
//  tableView-example
//
//  Created by Omkar Shisode on 06/12/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifire = "tableViewCell"
    
    let stackView = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setUpView()
    }
    
    private func setUpView() {
        stackView.axis = .vertical
        stackView.spacing = 200
        stackView.alignment = .fill
        stackView.distribution = .fill
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configuredStackView(with stackData: [String]) {
        
        for title in stackData {
            let view = UIView()
            view.backgroundColor = .red
            view.layer.cornerRadius = 8
            view.clipsToBounds = false
            let label = UILabel()
            label.text = title
            label.textColor = .black
            label.textAlignment = .center
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            stackView.addArrangedSubview(view)
        }
    }
}


