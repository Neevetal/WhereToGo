//
//  EventTableViewCell.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 08.01.2022.
//

import UIKit
import Kingfisher

// обработать дату проведения (превратить в строку )
// сделать закругление картинки

class EventTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var addressImageView: UIImageView!
    @IBOutlet private weak var dateImageView: UIImageView!
    @IBOutlet private weak var priceImageView: UIImageView!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        configureElements()
    }

    // MARK: - Private methods

    // переделать верстку ячейки
    
    private func configureElements() {
        selectionStyle = .none
        backView.backgroundColor = .white
        backView.layer.cornerRadius = Const.Radius.eventCell
        backView.layer.masksToBounds = true
        backView.addShadow(offset: CGSize.init(width: 0, height: 4),
                           color: Asset.Colors.shadow.color,
                           radius: 16,
                           opacity: 1)

        mainImageView.contentMode = .scaleAspectFill

        configureTextStyle()
    }

    private func configureTextStyle() {
        titleLabel.textStyle = .B16black
        descriptionLabel.textStyle = .R14black
        addressLabel.textStyle = .R14gray
        dateLabel.textStyle = .R14gray
        priceLabel.textStyle = .R14gray
    }

    private func setPhoto(url: URL?, photo: UIImageView?) {

        if let url = url, let photo = photo {
            photo.kf.setImage(with: url,
                              placeholder: nil,
                              options: [.transition(.fade(0.2)), .backgroundDecode])

            if photo.image == nil {
                photo.image = Asset.Assets.noImage.image.withAlpha(0.5)
            }
        }
    }

    private func showLabel(if condition: Bool,for label: UILabel,_ imageView: UIImageView) {

        if condition {
            label.isHidden = false
            imageView.isHidden = false
        } else {
            label.isHidden = true
            imageView.isHidden = true
        }
    }

    private func checkData(event: Event) {

        showLabel(if: event.place?.address != "", for: addressLabel, addressImageView)
        //showLabel(if: event.dates != "", for: descriptionLabel, dateImageView)
        showLabel(if: event.price != "", for: priceLabel, priceImageView)
    }

    // MARK: - Public methods

    public func configure(event: Event?) {
        guard let event = event else { return }
        titleLabel.text = event.title
        descriptionLabel.text = event.description
        addressLabel.text = event.place?.address

        checkData(event: event)
        setPhoto(url: event.photoUrl, photo: mainImageView)
    }
}
