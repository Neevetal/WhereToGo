//
//  RedActivityIndicator.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 03.05.2022.
//

import UIKit

class RedActivityIndicator: UIView {

    // MARK: - Init
    private convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }

    // MARK: - Properties

    private var spinnerBehavior: UIDynamicItemBehavior?
    private var animator: UIDynamicAnimator?
    private var imageView: UIImageView?
    private var loaderImageName = ""

    // MARK: - Private methods

    private func setupView() {

        let theImage = UIImage(named: loaderImageName)
        imageView = UIImageView(image: theImage)

        if let imageView = imageView {
            self.spinnerBehavior = UIDynamicItemBehavior(items: [imageView])
        }

        animator = UIDynamicAnimator(referenceView: self)
    }

    private func showLoadingActivity() {
        if let imageView = imageView {
            addSubview(imageView)
            startAnimation()
            // UIApplication.shared.windows.first?.addSubview(self)
            isUserInteractionEnabled = true
        }
    }

    private func startAnimation() {
        guard let imageView = imageView,
              let spinnerBehavior = spinnerBehavior,
              let animator = animator else {
                  return
              }

        if !animator.behaviors.contains(spinnerBehavior) {
            spinnerBehavior.addAngularVelocity(5.0, for: imageView)
            animator.addBehavior(spinnerBehavior)
        }
    }

    private func stopAnimation() {
        //        animator?.removeAllBehaviors()
        //        imageView?.removeFromSuperview()
        //        imageView = nil
        removeFromSuperview()
    }

    // MARK: - Public methods

    public func show() {
        loaderImageName = Asset.Assets.loader.name
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {[weak self] in
            if self?.imageView == nil {
                self?.setupView()
                DispatchQueue.main.async {[weak self] in
                    self?.showLoadingActivity()
                }
            }
        }
    }

    public func hide() {
        stopAnimation()
    }
}
