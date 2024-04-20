//
//  RegionsDM.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 20/04/24.
//

import Foundation

struct RegionsDM: Codable {
    var id: String?
    var db_id: String?
    var created_at: String?
    var created_by: String?
    var is_deleted: Bool?
    var parent_id: String?
    var hierarchy_key: String?
    var type: String?
    var name_ru: String?
    var name_uz: String?
    var country_id: String?
    var order_index: Int?
    var names: RegionsnamesDM?
    var postal_id: Int?
    var name_uz_latn: String?
    var soato: String?
    var hidden: Bool?
}

struct RegionsnamesDM: Codable {
    var qq: String?
    var ru: String?
    var uz: String?
    var uz_cyr: String?
}


class DistrictsDM: Codable {
    var id: Int?
    var region_id: Int?
    var name_uz: String?
    var name_oz: String?
    var name_ru: String?
}
