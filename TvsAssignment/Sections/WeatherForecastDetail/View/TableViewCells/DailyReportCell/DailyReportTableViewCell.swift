//
//  DailyReportTableViewCell.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 14/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class DailyReportTableViewCell: BaseTableViewCell {
    // MARK: - IBOutlets

    @IBOutlet var lowTempLabel: UILabel!
    @IBOutlet var highTempLabel: UILabel!
    @IBOutlet var dayNameLabel: UILabel!
    @IBOutlet var weatherImageView: UIImageView!

    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Override UpdateCell

    override func updateCell(rowModel: BaseRowModel) {
        selectionStyle = .none
        if let model = rowModel.rowValue as? Data {
            let tempHigh = model.temperatureHigh?.fahrToCelsius()
            let tempLow = model.temperatureLow?.fahrToCelsius()
            let day = Date().getDayName(date: Date(seconds: model.time ?? 0))

            highTempLabel.text = "\(tempHigh ?? 0)"
            lowTempLabel.text = "\(tempLow ?? 0)"
            dayNameLabel.text = day

            if let image = UIImage(named: model.icon ?? "") {
                weatherImageView.image = image
            } else {
                weatherImageView.image = #imageLiteral(resourceName: "sunny")
            }
        }
    }
}
