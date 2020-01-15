//
//  HourlyForcastCollectionCell.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 14/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class HourlyForcastCollectionCell: BaseCollectionViewCell {
    // MARK: IBOutlets

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var weatherImageView: UIImageView!

    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Override UpdateCell

    override func updateCell(rowModel: BaseRowModel) {
        if let model = rowModel.rowValue as? Data {
            let time = Date().getHourWithAmPm(date: Date(seconds: model.time ?? 0))
            let temprature = model.temperature?.fahrToCelsius()

            let attributedText = NSMutableAttributedString(string: time.hour,
                                                           attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
            attributedText.append(NSMutableAttributedString(string: time.shift,
                                                            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 9)]))

            timeLabel.attributedText = attributedText
            tempLabel.text = "\(temprature ?? 0)\u{00B0}"
            if let image = UIImage(named: model.icon ?? "") {
                weatherImageView.image = image
            } else {
                weatherImageView.image = UIImage(named: "sunny")
            }
        }
    }
}
