//
//  Font.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 08.01.2022.
//

import UIKit

struct Font {

    static var B16: UIFont { return UIFont.systemFont(ofSize: 16.0, weight: .bold) }
    static var B20: UIFont { return UIFont.systemFont(ofSize: 20.0, weight: .bold) }
    static var B30: UIFont { return UIFont.systemFont(ofSize: 30.0, weight: .bold) }

    static var SB16: UIFont { return UIFont.systemFont(ofSize: 16.0, weight: .semibold) }
    static var SB17: UIFont { return UIFont.systemFont(ofSize: 17.0, weight: .semibold) }

    static var R14: UIFont { return UIFont.systemFont(ofSize: 14.0, weight: .regular) }
    static var R16: UIFont { return UIFont.systemFont(ofSize: 16.0, weight: .regular) }
    static var R17: UIFont { return UIFont.systemFont(ofSize: 17.0, weight: .regular) }

    static var M12: UIFont { return UIFont.systemFont(ofSize: 12.0, weight: .medium) }
}
