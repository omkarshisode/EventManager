//
//  PickerViewController.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 22/12/24.
//

import UIKit

class PickerViewController: UIViewController {

    private var pickerView = UIPickerView()
    private var label = AppLabel()
    static var counterDelegate: CounterDelegate?
    
    private let names = ["Omkar", "Prachi", "Shrikant", "Prakash", "Renuka", "Parvati"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpPickerView()
    }
    
    private func setUpPickerView() {
        // Configured picker view
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pickerView)
        
        // Configured label view
        label.text = names[0]
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 20)
        ])
    }
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return names[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = names[row]
        PickerViewController.counterDelegate?.increaseCount(row)
    }
}

