//
//  Typography.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 12/08/2025.
//

import Foundation
import UIKit

enum Typography {
    static func heading1() -> UIFont {
        let baseFont = UIFont(name: FontName.bold, size: 24)!
        return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: baseFont)
    }
    
    static func heading2() -> UIFont {
        let baseFont = UIFont(name: FontName.bold, size: 20)!
        return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: baseFont)
    }
    
    static func bodyLargeRegular() -> UIFont {
        let baseFont = UIFont(name: FontName.regular, size: 16)!
        return UIFontMetrics(forTextStyle: .title1).scaledFont(for: baseFont)
    }
    
    static func bodyLargeSemiBold() -> UIFont {
        let baseFont = UIFont(name: FontName.bold, size: 16)!
        return UIFontMetrics(forTextStyle: .title1).scaledFont(for: baseFont)
    }
    
    static func bodyMediumRegular() -> UIFont {
        let baseFont = UIFont(name: FontName.regular, size: 14)!
        return UIFontMetrics(forTextStyle: .title2).scaledFont(for: baseFont)
    }
    
    static func bodyMediumSemiBold() -> UIFont {
        let baseFont = UIFont(name: FontName.bold, size: 14)!
        return UIFontMetrics(forTextStyle: .title2).scaledFont(for: baseFont)
    }
    
    static func bodySmallRegular() -> UIFont {
        let baseFont = UIFont(name: FontName.regular, size: 12)!
        return UIFontMetrics(forTextStyle: .title3).scaledFont(for: baseFont)
    }
    
    static func bodySmallSemiBold() -> UIFont {
        let baseFont = UIFont(name: FontName.bold, size: 12)!
        return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: baseFont)
    }
    
    static func button() -> UIFont {
        let baseFont = UIFont(name: FontName.medium, size: 16)!
        return UIFontMetrics(forTextStyle: .headline).scaledFont(for: baseFont)
    }
}
