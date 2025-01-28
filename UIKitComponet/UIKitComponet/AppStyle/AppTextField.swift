//
//  AppTextField.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 19/12/24.
//

import UIKit

class AppTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        let borderWidth = CGFloat(2.0)
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.borderWidth = borderWidth
        self.textColor = UIColor.darkGray
        self.backgroundColor = UIColor.white
        self.font = AppFonts.shared.bodyMedium
        self.attributedPlaceholder = NSAttributedString(
            string: self.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        self.layer.masksToBounds = true
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 16, y: bounds.origin.y + 16, width: bounds.size.width - 20, height: bounds.size.height - 30 )
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds: bounds)
    }
}
