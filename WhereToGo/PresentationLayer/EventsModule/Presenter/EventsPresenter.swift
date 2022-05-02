//
//  EventsPresenter.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 02.05.2022.
//

import Foundation

class EventsPresenter: EventsViewOutput {

    // MARK: - Properties

    public weak var view: EventsViewInput!
    public var networkingService: NetworkingService!

    // MARK: - EventsViewOutput

    func viewWillAppear() {
        fetchEvents()
    }

    func didPressedCell() {}

    // MARK: - Private methods

    private func fetchEvents() {
        let urlString = "https://kudago.com/public-api/v1.2/events/?fields=title,dates,description,body_text,price,place,images&text_format=text&expand=place&page=2"

        networkingService.fetchEvents(urlString: urlString) { [weak self] (events) in
            guard let self = self, let events = events else { return }

            self.view.showEvents(events)
        }
    }
}
