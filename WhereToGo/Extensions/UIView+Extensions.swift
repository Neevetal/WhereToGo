//
//  UIView+Extensions.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 30.01.2022.
//

import UIKit

public extension UIView {

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }
}
