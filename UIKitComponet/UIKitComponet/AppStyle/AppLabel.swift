//
//  AppLabel.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 19/12/24.
//

import Foundation
import UIKit

class AppLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.stupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.stupUI()
    }
    
    private func stupUI() {
        self.font = AppFonts.shared.headingRegular
    }
    
}

