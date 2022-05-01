//
//  TextStyle.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 08.01.2022.
//

import Foundation
import UIKit

enum TextStyle {

    // MARK: - Bold

    case B16black
    case B20black
    case B30black

    // MARK: - Semibold

    case SB16black
    case SB17red

    // MARK: - Medium

    case M12red

    // MARK: - Regular

    case R14black
    case R14gray
    case R16black
    case R16gray
    case R16white
    case R17red

    case undefined

    var style: (font: UIFont, color: UIColor) {
        switch self {

            // MARK: - Bold

        case .B16black:                               return (Font.B16, Asset.Colors.textBlack85.color)
        case .B20black:                               return (Font.B20, Asset.Colors.textBlack85.color)
        case .B30black:                               return (Font.B30, Asset.Colors.textBlack85.color)

            // MARK: - Semibold

        case .SB16black:                              return (Font.SB16, Asset.Colors.textBlack85.color)
        case .SB17red:                                return (Font.SB17, Asset.Colors.textRed.color)

            // MARK: - Medium

        case .M12red:                                 return (Font.M12, Asset.Colors.textRed.color)

            // MARK: - Regular

        case .R14black:                               return (Font.R14, Asset.Colors.textBlack85.color)
        case .R14gray:                                return (Font.R14, Asset.Colors.textBlack65.color)
        case .R16black:                               return (Font.R16, Asset.Colors.textBlack85.color)
        case .R16gray:                                return (Font.R16, Asset.Colors.textBlack65.color)
        case .R16white:                               return (Font.R16, .white)
        case .R17red:                                 return (Font.R17, Asset.Colors.textRed.color)

        case .undefined:                              return (UIFont(), UIColor.clear)

        }
    }

    var font: UIFont {
        return self.style.font
    }

    var color: UIColor {
        return self.style.color
    }
}
