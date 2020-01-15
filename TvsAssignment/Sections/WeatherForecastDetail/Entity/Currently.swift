//
//	Currently.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation

struct Currently: Codable {
    let time: Int?
    let summary: String?
    let icon: String?
    let precipIntensity: Double?
    let precipProbability: Double?
    let precipType: String?
    let temperature: Double?
    let apparentTemperature: Double?
    let dewPoint: Double?
    let humidity: Double?
    let pressure: Double?
    let windSpeed: Double?
    let windGust: Double?
    let windBearing: Int?
    let cloudCover: Double?
    let uvIndex: Int?
    let visibility: Double?
    let ozone: Double?

    enum CodingKeys: String, CodingKey {
        case time
        case summary
        case icon
        case precipIntensity
        case precipProbability
        case precipType
        case temperature
        case apparentTemperature
        case dewPoint
        case humidity
        case pressure
        case windSpeed
        case windGust
        case windBearing
        case cloudCover
        case uvIndex
        case visibility
        case ozone
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        time = try values.decodeIfPresent(Int.self, forKey: .time)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        precipIntensity = try values.decodeIfPresent(Double.self, forKey: .precipIntensity)
        precipProbability = try values.decodeIfPresent(Double.self, forKey: .precipProbability)
        precipType = try values.decodeIfPresent(String.self, forKey: .precipType)
        temperature = try values.decodeIfPresent(Double.self, forKey: .temperature)
        apparentTemperature = try values.decodeIfPresent(Double.self, forKey: .apparentTemperature)
        dewPoint = try values.decodeIfPresent(Double.self, forKey: .dewPoint)
        humidity = try values.decodeIfPresent(Double.self, forKey: .humidity)
        pressure = try values.decodeIfPresent(Double.self, forKey: .pressure)
        windSpeed = try values.decodeIfPresent(Double.self, forKey: .windSpeed)
        windGust = try values.decodeIfPresent(Double.self, forKey: .windGust)
        windBearing = try values.decodeIfPresent(Int.self, forKey: .windBearing)
        cloudCover = try values.decodeIfPresent(Double.self, forKey: .cloudCover)
        uvIndex = try values.decodeIfPresent(Int.self, forKey: .uvIndex)
        visibility = try values.decodeIfPresent(Double.self, forKey: .visibility)
        ozone = try values.decodeIfPresent(Double.self, forKey: .ozone)
    }
}
