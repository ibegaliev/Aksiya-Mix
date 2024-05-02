//
//  SingleCompanyDM.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 02/05/24.
//

import Foundation

struct SingleCompanyDM: Codable {
    var region: Int?
    var main_phone_number: String?
    var categories: [Int]?
    var name: String?
    var latitude: Double?
    var delivery: Bool?
    var working_day_start: Int?
    var followers: String?
    var district_label: String?
    var logo: String?
    var district: Int?
    var rating3: Int?
    var rating2: Int?
    var working_time_end: String?
    var slogan: String?
    var likes: String?
    var working_day_end: Int?
    var phone_number2: String?
    var term_payment: Bool?
    var comments: String?
    var pk: Int?
    var shortname: String?
    var phone_number3: String?
    var working_time_start: String?
    var rating5: Int?
    var region_label: String?
    var created_at: String?
    var banner: String?
    var video_link: String??
    var desc: String?
    var is_verified: Bool?
    var rating1: Int?
    var longitude: Double?
    var user_follow: Bool?
    var address: String?
    var rating4: Int?
}

struct SingleCompanyError: Codable {
    let error: SingleCompanyErrorDetail?
}

struct SingleCompanyErrorDetail: Codable {
    let code: Int?
    let detail: String?
}

