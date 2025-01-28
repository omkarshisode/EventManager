//
//  ScrollViewController.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 22/12/24.
//

import UIKit

class ScrollViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "ScrollView Example"
        
        setupScrollView()
        setupContent()
    }
    
    private func setupScrollView() {
        // Add the scrollView to the main view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // Constrain the scrollView to the edges of the main view
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Add the contentView inside the scrollView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // Constrain the contentView to the scrollView
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            // Set the contentView width to match the scrollView's width
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupContent() {
        // Add some content (e.g., labels) to the contentView
        var lastLabel: UILabel? = nil
        for i in 1...20 {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Label \(i)"
            label.textAlignment = .center
            label.backgroundColor = .systemGray5
            contentView.addSubview(label)
            
            // Constrain each label
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                label.heightAnchor.constraint(equalToConstant: 50)
            ])
            
            // Position the labels one after the other
            if let last = lastLabel {
                label.topAnchor.constraint(equalTo: last.bottomAnchor, constant: 10).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
            }
            lastLabel = label
        }
        
        // Set the bottom of the last label to define the contentView's height
        if let last = lastLabel {
            last.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        }
    }
}

