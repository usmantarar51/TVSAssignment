//
//	RootClass.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation

struct ForecastModel: Codable {
    let latitude: Double?
    let longitude: Double?
    let timezone: String?
    let currently: Currently?
    let hourly: Daily?
    let daily: Daily?
    let flags: Daily?
    let offset: Int?

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case timezone
        case currently
        case hourly
        case daily
        case flags
        case offset
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
        currently = try values.decodeIfPresent(Currently.self, forKey: .currently)
        hourly = try values.decodeIfPresent(Daily.self, forKey: .hourly)
        daily = try values.decodeIfPresent(Daily.self, forKey: .daily)
        flags = try values.decodeIfPresent(Daily.self, forKey: .flags)
        offset = try values.decodeIfPresent(Int.self, forKey: .offset)
    }
}
