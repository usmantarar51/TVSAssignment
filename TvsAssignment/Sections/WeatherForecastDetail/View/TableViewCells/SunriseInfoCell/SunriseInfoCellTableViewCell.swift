//
//  SunriseInfoCellTableViewCell.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 14/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class SunriseInfoCellTableViewCell: BaseTableViewCell {
    // MARK: IBOutlets

    @IBOutlet var sunriseLabel: UILabel!
    @IBOutlet var sunriseValueLabel: UILabel!
    @IBOutlet var sunsetLabel: UILabel!
    @IBOutlet var sunsetValueLabel: UILabel!

    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Override UpdateCell

    override func updateCell(rowModel: BaseRowModel) {
        if let model = rowModel.rowValue as? Data {
            let sunrise = Date().getHourWithAmPm(date: Date(seconds: model.sunriseTime ?? 0))
            let sunset = Date().getHourWithAmPm(date: Date(seconds: model.sunriseTime ?? 0))

            sunriseValueLabel.text = sunrise.formatTime
            sunsetValueLabel.text = sunset.formatTime
        }
    }
}
