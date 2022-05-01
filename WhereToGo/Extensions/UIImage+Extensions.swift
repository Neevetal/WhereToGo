//
//  UIImage+Extensions.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 12.02.2022.
//

import UIKit

public extension UIImage {

    func withAlpha(_ a: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { (_) in
            draw(in: CGRect(origin: .zero, size: size), blendMode: .normal, alpha: a)
        }
    }
}
