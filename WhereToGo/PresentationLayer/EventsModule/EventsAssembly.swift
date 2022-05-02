//
//  EventsAssembly.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 02.05.2022.
//

import Foundation
import UIKit

class EventsAssembly: NSObject {

    @IBOutlet weak var viewController: UIViewController!

    override func awakeFromNib() {

        super.awakeFromNib()

        guard let view = viewController as? EventsViewController else { return }

        let presenter = EventsPresenter()
        let networkingService = NetworkingService()

        view.output = presenter

        presenter.view = view
        presenter.networkingService = networkingService
    }
}
