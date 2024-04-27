//
//  CreateMarketDM.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 27/04/24.
//

import Foundation

struct CreateMarketDM: Codable {
    var name_uz: String?
    var name_ru: String?
    var main_phone_number: String?
    var delivery: Bool?
    var region: Int?
    var district: Int?
    var address: String?
    var longitude: Double?
    var latitude: Double?
    var working_time_start: String?
    var working_time_end: String?
    var working_day_start: Int?
    var working_day_end: Int?
    var categories: [Int]?
    var shortname: String?
    var desc_uz: String?
    var desc_ru: String?
    var slogan_uz: String?
    var slogan_ru: String?
    var owner_firstname: String?
    var owner_lastname: String?
    var owner_fathername: String?
    var phone_number2: String?
    var phone_number3: String?
    var term_payment: Bool?
    var video_link: String?
}
