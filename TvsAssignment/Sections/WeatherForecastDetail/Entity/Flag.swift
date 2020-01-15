//
//	Flag.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation

struct Flag: Codable {
    let neareststation: Float?
    let sources: [String]?
    let units: String?

    enum CodingKeys: String, CodingKey {
        case neareststation = "nearest-station"
        case sources
        case units
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        neareststation = try values.decodeIfPresent(Float.self, forKey: .neareststation)
        sources = try values.decodeIfPresent([String].self, forKey: .sources)
        units = try values.decodeIfPresent(String.self, forKey: .units)
    }
}
