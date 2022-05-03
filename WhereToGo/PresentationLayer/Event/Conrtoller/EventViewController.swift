//
//  EventViewController.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 09.01.2022.
//

import UIKit
import Kingfisher

// добавить скроллвью
// сделать кастомную кнопку в навбаре
// настроить метод заполнения эвентом event
// реализовать просмотр всех картинок

class EventViewController: BaseViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var miniDescriptionLabel: UILabel!

    // MARK: - Properties

    var event: Event?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }

    private func setPhoto(url: URL?, photo: UIImageView?) {

        if let url = url, let photo = photo {
            photo.kf.setImage(with: url,
                              placeholder: nil,
                              options: [.transition(.fade(0.2)), .backgroundDecode])
            if photo.image == nil {
                photo.image = Asset.Assets.noImage.image.withAlpha(0)
            }
        }
    }

    private func configure() {
        titleLabel?.text = event?.title
        descriptionLabel?.text = event?.description
        miniDescriptionLabel?.text = event?.bodyText
        setPhoto(url: event?.photoUrl, photo: mainImageView)
    }
}
