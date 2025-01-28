//
//  UIFont.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 19/12/24.
//

import Foundation
import UIKit

extension UIFont {
    
    private enum CustomFont: String {
        case bold = "Montserrat-Bold.ttf"
        case italic = "Montserrat-Italic.ttf"
        case medium = "Montserrat-Medium.ttf"
        case regular = "Montserrat-Regular.ttf"
        case thin = "Montserrat-Thin.ttf"
    }
    
    static func addFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        // Default font to load
        var font = UIFont(name: CustomFont.medium.rawValue, size: size)
        switch weight {
        case .ultraLight:
            font = UIFont(name: CustomFont.thin.rawValue, size: size)
        case .bold:
            font = UIFont(name: CustomFont.bold.rawValue, size: size)
        case .medium:
            font = UIFont(name: CustomFont.medium.rawValue, size: size)
        default:
            font = UIFont(name: CustomFont.regular.rawValue, size: size)
        }
        
        // Unwrap the optional value
        guard let retValue = font else {
            return .systemFont(ofSize: size, weight: .bold)
        }
        
        return retValue
    }
}
