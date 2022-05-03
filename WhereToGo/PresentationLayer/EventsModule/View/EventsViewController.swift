//
//  EventsViewController.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 08.01.2022.
//

import UIKit

// добавить в mvp configurator
// добавить индикатор загрузки и refresh tableview
// добавить кеширование данных

class EventsViewController: BaseViewController, EventsViewInput {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    public var output: EventsViewOutput!

    private let networkingService = NetworkingService()
    private var places: Places?
    private var events: Events?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startLoader()

        configureNavigationBarTitleFont()
        configureBaseNavigationBar()
        output.viewWillAppear()
    }

    // MARK: - EventsViewInput

    func showEvents(_ events: Events) {

        self.events = events
        stopLoader()
        tableView.reloadData()
    }

    // MARK: - Private methods

    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.refreshControl = refreshControl
        tableView.delegate = self
        tableView.dataSource = self
    }

    @objc func backAction() {
        // do the magic
    }

    @objc func btn_clicked(_ sender: UIBarButtonItem) {
        // Do something
    }

    // MARK: - Refresh Data

    override func refreshData(_ sender: UIRefreshControl) {
        super.refreshData(sender)

        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension EventsViewController: UITableViewDelegate {

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
        guard let event = events?.results?[indexPath.row] else { return }
        vc.event = event

        self.navigationController?.pushViewController(vc, animated: true)
        output.didPressedCell()
    }
}

// MARK: - UITableViewDataSource

extension EventsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events?.results?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EventTableViewCell.createForTableView(tableView) as! EventTableViewCell
        guard let event = events?.results?[indexPath.row] else { return UITableViewCell() }
        cell.configure(event: event)
        return cell
    }
}
