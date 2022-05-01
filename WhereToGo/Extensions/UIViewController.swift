//
//  UIViewController.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 12.02.2022.
//

import UIKit

public extension UIViewController {

    class func instantiateFromStoryboard(storyboardName: String) -> Self {
        return instantiateFromStoryboardHelper(type: self, storyboardName: storyboardName)
    }

    class func instantiateFromStoryboardHelper<T>(type _: T.Type, storyboardName: String) -> T {
        let storyboardId = String(describing: T.self).components(separatedBy: ".").last

        let storyboad = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboad.instantiateViewController(withIdentifier: storyboardId!) as! T

        return controller
    }
}
