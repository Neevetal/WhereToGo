//
//  BaseViewController.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 12.02.2022.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Constants

    private let backView = UIView()

    // MARK: - Properties

   //public var redActivityIndicator = RedActivityIndicator()

    private var redLoader: RedActivityIndicator = {
        $0.isUserInteractionEnabled = false
        $0.autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleRightMargin]
        $0.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        return $0
    }(RedActivityIndicator(frame: .zero))

//    public lazy var navigationBarAssistant: NavigationBarAssistant? = {
//        $0.create(self)
//        return $0
//    }(NavigationBarAssistant())

    public lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        //refresh.tintColor = .clear
        refresh.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        return refresh
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    // MARK: - Configure NavBar

    public func configureBaseNavigationBar() {
        if #available(iOS 13.0, *) {

            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .always
            self.navigationItem.title = "Куда сходить"

            let style = UINavigationBarAppearance()

            style.configureWithOpaqueBackground()
            style.backgroundColor = .white //Asset.Colors.navBarBackground.color

            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.layoutIfNeeded()

            self.navigationController?.navigationBar.standardAppearance = style
            self.navigationController?.navigationBar.scrollEdgeAppearance = style

            let logoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 107, height: 44))
            logoButton.setImage(Asset.Assets.logoWhite.image, for: .normal)
            logoButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoButton)

            let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 66, height: 44))
            rightButton.setTitle(" Москва", for: .normal)
            rightButton.setImage(Asset.Assets.vector.image, for: .normal)
            rightButton.setTitleColor(Asset.Colors.textRed.color, for: .normal)
            rightButton.semanticContentAttribute = .forceRightToLeft
            rightButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)

        } else {
            navigationController?.navigationBar.barTintColor = Asset.Colors.tableView.color
            navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        }
    }

    public func configureNavigationBarTitleFont() {
        let largeFontSize: CGFloat = 30
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            //appearance.titleTextAttributes = [NSAttributedString.Key.font: font]
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: largeFontSize)] //.withSize(largeFontSize)]
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
            //navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font]
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: largeFontSize)] //.withSize(largeFontSize)]
        }
    }

    // MARK: - Actions

    @objc public func backAction(_: Any) {}

    // MARK: - Activity notifications

    @objc public func appResignActive() {}

    @objc public func appBecomeActive() {}

    // MARK: - Loader

    func startLoader() {
        stopLoader()
        view.addSubview(redLoader)

        redLoader.show()

        redLoader.translatesAutoresizingMaskIntoConstraints = false
        redLoader.snp.makeConstraints { target in
            target.width.height.equalTo(32)
            target.center.equalTo(self.view)
        }
    }

    func stopLoader() {
        redLoader.hide()
    }

    // MARK: - Error

//    func showError(_ text: String) {
//        stopLoader()
//
//        errorView.text = text
//        errorView.textColor = Asset.Colors.red.color
//        errorView.isHidden = false
//        view.addSubview(errorView)
//
//        errorView.translatesAutoresizingMaskIntoConstraints = false
//        errorView.snp.makeConstraints { target in
//            target.left.equalTo(16)
//            target.right.equalTo(-16)
//            target.center.equalTo(self.view)
//        }
//    }

    // MARK: - UIGestureRecognizerDelegate

    func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
        return true
    }

    // MARK: - Refresh control

    @objc func refreshData(_: UIRefreshControl) {
        //redActivityIndicator.show()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refreshControl.endRefreshing()
        }
    }

    // MARK: - Create

    public class var storyboardName: String {
        fatalError("Storyboard not defined:\(String(describing: self))")
    }

    public class func instance() -> Self {
        return instantiateFromStoryboardHelper(type: self, storyboardName: storyboardName)
    }
}
