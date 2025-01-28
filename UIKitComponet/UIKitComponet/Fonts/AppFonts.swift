//
//  AppFonts.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 19/12/24.
//

import Foundation
import UIKit

class AppFonts {
    
    static let shared = AppFonts()
    
    public var headingSemiBold: UIFont {
        return UIFont.addFont(ofSize: 32, weight: .bold)
    }
    
    public var headingRegular: UIFont {
        return UIFont.addFont(ofSize: 32, weight: .regular)
    }
    
    public var headLine: UIFont {
        return UIFont.addFont(ofSize: 24, weight: .semibold)
    }
    
    public var bodyMedium: UIFont {
        return UIFont.addFont(ofSize: 16, weight: .regular)
    }
    
    public func custom(_ size: CGFloat, _ weight: UIFont.Weight) -> UIFont {
        return UIFont.addFont(ofSize: size, weight: weight)
    }
}
