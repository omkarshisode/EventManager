//
//  ViewController.swift
//  tableView-example
//
//  Created by Omkar Shisode on 06/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private let dataList = ["Omkar", "Prachi", "Vishal", "Dista", "Akash", "Sonktake", "Hello", "Rupesh", "Basic thing", "I am don", "Who is the boss", "Take car of it", "Basic thing", "Chlo", "Bhai", "That done", "Remio"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier:TableViewCell.identifire)
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        DispatchQueue.main.async {
            // Delay scrolling to ensure all views are laid out
            self.scrollToSubview(inRow: 0, subViewIndex: 10)
        }
    }

    func scrollToSubview(inRow rowIndex: Int, subViewIndex: Int) {
        // Ensure row exists
        guard let cell = tableView.cellForRow(at: IndexPath(row: rowIndex, section: 0)) as? TableViewCell else { return }
        
        // Wait for the layout to finish
        cell.layoutIfNeeded()

        // Ensure the target view exists
        guard subViewIndex < cell.stackView.arrangedSubviews.count else { return }
        
        let targetView = cell.stackView.arrangedSubviews[subViewIndex]
        
        // Convert the target view's frame to the table view's coordinate space
        let rectInTableView = tableView.convert(targetView.frame, from: targetView.superview)
        
        // Scroll to the target view
        tableView.scrollRectToVisible(rectInTableView, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifire, for: indexPath) as! TableViewCell
        cell.configuredStackView(with: dataList)
        return cell
    }
}
