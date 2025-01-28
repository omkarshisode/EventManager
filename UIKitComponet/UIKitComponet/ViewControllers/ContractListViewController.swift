//
//  ContractListViewController.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 21/12/24.
//

import UIKit

class ContractListViewController: UIViewController {
    
    private let contactTableView = UITableView()
    private var contactList = [Int: [Contact]]()
    
    private let errorLabel: UILabel = {
        let _label = UILabel()
        _label.textAlignment = .center
        _label.textColor = .black
        _label.font = AppFonts.shared.headLine
        _label.numberOfLines = 0
        _label.text = "Error occured please, Try again."
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        prepareContactList()
        configuredErrorLabel()
        configureTableView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.errorLabel.isHidden = true
        }
    }
    
    private func configuredErrorLabel() {
        view.addSubview(errorLabel)
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureTableView() {
        contactTableView.translatesAutoresizingMaskIntoConstraints = false
        contactTableView.register(ContractListTableViewCell.self, forCellReuseIdentifier: ContractListTableViewCell.identifier)
        contactTableView.delegate = self
        contactTableView.dataSource = self
        
        // Enable dynamic row height
        contactTableView.estimatedRowHeight = 80
        contactTableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(contactTableView)
        
        NSLayoutConstraint.activate([
            contactTableView.topAnchor.constraint(equalTo: errorLabel.bottomAnchor),
            contactTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contactTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func prepareContactList() {
        for i in 1...5 {
            var contacts: [Contact] = Array()
            for n in 1...15 {
                let contact = Contact(name: "Omkar \(n)", number: "90754811\(n)")
                contacts.append(contact)
            }
            contactList[i] = contacts
        }
    }
}

extension ContractListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList[section]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContractListTableViewCell.identifier, for: indexPath) as? ContractListTableViewCell else {
            fatalError("Unable to dequeue ContractListTableViewCell")
        }
        
        if let contactList = contactList[indexPath.section] {
            let contact = contactList[indexPath.row]
            cell.setUpContact(using: contact)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  "section \(section)"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let contact = contactList[indexPath.section]? [indexPath.row]
        let alert = UIAlertController(title: contact?.name, message: contact?.number, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
}
