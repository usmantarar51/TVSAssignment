//
//	Daily.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation

struct Daily: Codable {
    let data: [Data]?
    let icon: String?
    let summary: String?

    enum CodingKeys: String, CodingKey {
        case summary
        case icon
        case data
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
    }
}
