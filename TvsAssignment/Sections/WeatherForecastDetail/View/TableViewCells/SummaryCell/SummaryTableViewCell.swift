//
//  SummaryTableViewCell.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 14/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class SummaryTableViewCell: BaseTableViewCell {
    // MARK: - IBOutlets

    @IBOutlet var summaryLabel: UILabel!

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
        if let summary = rowModel.rowValue as? String {
            summaryLabel.text = summary
        }
    }

    // MARK: - Cell Provider

    // __________________________________________________________________________________
    //

    class func rowModel(data: Any?) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "SummaryTableViewCell"
        rowModel.rowValue = data
        rowModel.rowHeight = 70
        return rowModel
    }
}
