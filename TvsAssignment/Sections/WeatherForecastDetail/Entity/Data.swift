//
//	Data.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation

struct Data: Codable {
    let time: Int?
    let summary: String?
    let temperature: Double?
    let icon: String?
    let sunriseTime: Int?
    let sunsetTime: Int?
    let moonPhase: Double?
    let precipType: String?
    let precipIntensity: Double?
    let precipIntensityMax: Double?
    let precipIntensityMaxTime: Int?
    let precipProbability: Double?
    let temperatureHigh: Double?
    let temperatureHighTime: Int?
    let temperatureLow: Double?
    let temperatureLowTime: Int?
    let apparentTemperatureHigh: Double?
    let apparentTemperatureHighTime: Int?
    let apparentTemperatureLow: Double?
    let apparentTemperatureLowTime: Int?
    let dewPoint: Double?
    let humidity: Double?
    let pressure: Double?
    let windSpeed: Double?
    let windGust: Double?
    let windGustTime: Int?
    let windBearing: Int?
    let cloudCover: Double?
    let uvIndex: Int?
    let uvIndexTime: Int?
    let visibility: Double?
    let ozone: Double?
    let temperatureMin: Double?
    let temperatureMinTime: Int?
    let temperatureMax: Double?
    let temperatureMaxTime: Int?
    let apparentTemperatureMin: Double?
    let apparentTemperatureMinTime: Int?
    let apparentTemperatureMax: Double?
    let apparentTemperatureMaxTime: Int?

    enum CodingKeys: String, CodingKey {
        case time
        case summary
        case icon
        case sunriseTime
        case temperature
        case sunsetTime
        case moonPhase
        case precipType
        case precipIntensity
        case precipIntensityMax
        case precipIntensityMaxTime
        case precipProbability
        case temperatureHigh
        case temperatureHighTime
        case temperatureLow
        case temperatureLowTime
        case apparentTemperatureHigh
        case apparentTemperatureHighTime
        case apparentTemperatureLow
        case apparentTemperatureLowTime
        case dewPoint
        case humidity
        case pressure
        case windSpeed
        case windGust
        case windGustTime
        case windBearing
        case cloudCover
        case uvIndex
        case uvIndexTime
        case visibility
        case ozone
        case temperatureMin
        case temperatureMinTime
        case temperatureMax
        case temperatureMaxTime
        case apparentTemperatureMin
        case apparentTemperatureMinTime
        case apparentTemperatureMax
        case apparentTemperatureMaxTime
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        time = try values.decodeIfPresent(Int.self, forKey: .time)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        sunriseTime = try values.decodeIfPresent(Int.self, forKey: .sunriseTime)
        temperature = try values.decodeIfPresent(Double.self, forKey: .temperature)
        sunsetTime = try values.decodeIfPresent(Int.self, forKey: .sunsetTime)
        moonPhase = try values.decodeIfPresent(Double.self, forKey: .moonPhase)
        precipType = try values.decodeIfPresent(String.self, forKey: .precipType)
        precipIntensity = try values.decodeIfPresent(Double.self, forKey: .precipIntensity)
        precipIntensityMax = try values.decodeIfPresent(Double.self, forKey: .precipIntensityMax)
        precipIntensityMaxTime = try values.decodeIfPresent(Int.self, forKey: .precipIntensityMaxTime)
        precipProbability = try values.decodeIfPresent(Double.self, forKey: .precipProbability)
        temperatureHigh = try values.decodeIfPresent(Double.self, forKey: .temperatureHigh)
        temperatureHighTime = try values.decodeIfPresent(Int.self, forKey: .temperatureHighTime)
        temperatureLow = try values.decodeIfPresent(Double.self, forKey: .temperatureLow)
        temperatureLowTime = try values.decodeIfPresent(Int.self, forKey: .temperatureLowTime)
        apparentTemperatureHigh = try values.decodeIfPresent(Double.self, forKey: .apparentTemperatureHigh)
        apparentTemperatureHighTime = try values.decodeIfPresent(Int.self, forKey: .apparentTemperatureHighTime)
        apparentTemperatureLow = try values.decodeIfPresent(Double.self, forKey: .apparentTemperatureLow)
        apparentTemperatureLowTime = try values.decodeIfPresent(Int.self, forKey: .apparentTemperatureLowTime)
        dewPoint = try values.decodeIfPresent(Double.self, forKey: .dewPoint)
        humidity = try values.decodeIfPresent(Double.self, forKey: .humidity)
        pressure = try values.decodeIfPresent(Double.self, forKey: .pressure)
        windSpeed = try values.decodeIfPresent(Double.self, forKey: .windSpeed)
        windGust = try values.decodeIfPresent(Double.self, forKey: .windGust)
        windGustTime = try values.decodeIfPresent(Int.self, forKey: .windGustTime)
        windBearing = try values.decodeIfPresent(Int.self, forKey: .windBearing)
        cloudCover = try values.decodeIfPresent(Double.self, forKey: .cloudCover)
        uvIndex = try values.decodeIfPresent(Int.self, forKey: .uvIndex)
        uvIndexTime = try values.decodeIfPresent(Int.self, forKey: .uvIndexTime)
        visibility = try values.decodeIfPresent(Double.self, forKey: .visibility)
        ozone = try values.decodeIfPresent(Double.self, forKey: .ozone)
        temperatureMin = try values.decodeIfPresent(Double.self, forKey: .temperatureMin)
        temperatureMinTime = try values.decodeIfPresent(Int.self, forKey: .temperatureMinTime)
        temperatureMax = try values.decodeIfPresent(Double.self, forKey: .temperatureMax)
        temperatureMaxTime = try values.decodeIfPresent(Int.self, forKey: .temperatureMaxTime)
        apparentTemperatureMin = try values.decodeIfPresent(Double.self, forKey: .apparentTemperatureMin)
        apparentTemperatureMinTime = try values.decodeIfPresent(Int.self, forKey: .apparentTemperatureMinTime)
        apparentTemperatureMax = try values.decodeIfPresent(Double.self, forKey: .apparentTemperatureMax)
        apparentTemperatureMaxTime = try values.decodeIfPresent(Int.self, forKey: .apparentTemperatureMaxTime)
    }
}
