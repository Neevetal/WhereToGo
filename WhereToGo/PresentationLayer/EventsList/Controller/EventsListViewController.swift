//
//  EventsListViewController.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 08.01.2022.
//

import UIKit

// начать заливать на битбакет! +
// добавить индикатор загрузки и refresh tableview
// добавить кеширование данных

class EventsListViewController: BaseViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    let networkDataFetcher = NetworkDataFetcher()
    private var places: Places?
    private var events: Events?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        configureNavigationBarTitleFont()
        configureBaseNavigationBar()
        fetchEvents()
    }

    // MARK: - Private methods

    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }

    // переделать на events получение с деталкой по id

    private func fetchEvents() {
        let urlString = "https://kudago.com/public-api/v1.2/events/?fields=title,dates,description,body_text,price,place,images&text_format=text&expand=place&page=2"
        self.networkDataFetcher.fetchEvents(urlString: urlString) { [weak self] (events) in
            guard let self = self else { return }
            guard let events = events else { return }
            self.events = events
            self.tableView.reloadData()
        }
    }

    @objc func backAction() {
        // do the magic
    }

    @objc func btn_clicked(_ sender: UIBarButtonItem) {
        // Do something
    }
}

// MARK: - UITableViewDelegate

extension EventsListViewController: UITableViewDelegate {

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
        guard let event = events?.results?[indexPath.row] else { return }
        vc.event = event

        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension EventsListViewController: UITableViewDataSource {

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

