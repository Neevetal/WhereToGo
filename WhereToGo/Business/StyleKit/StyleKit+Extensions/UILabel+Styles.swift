//
//  UILabel+Styles.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 08.01.2022.
//

import UIKit

extension UILabel {

    var textStyle: TextStyle {

        get {
            TextStyle.undefined
        }

        set(newValue) {
            self.font = newValue.font
            self.textColor = newValue.color
        }
    }
}
