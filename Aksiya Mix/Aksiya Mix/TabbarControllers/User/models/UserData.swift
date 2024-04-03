//
//  UserData.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import Foundation

struct UserData: Codable {
    var fullname: String?
    var email: String?
    var photo: String?
    var store_id: Int?
    var store_is_active: Bool?
    var phone_number: String?
    var region_label: String?
    var district_label: String?
    var gender: Int?
    var district: Int?
    var region: Int?
    var birthday: String?
}
