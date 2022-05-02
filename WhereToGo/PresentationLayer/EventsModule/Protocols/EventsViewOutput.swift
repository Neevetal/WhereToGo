//
//  EventsViewOutput.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 02.05.2022.
//

import Foundation

protocol EventsViewOutput: AnyObject {

    func viewWillAppear()
    func didPressedCell()
}
