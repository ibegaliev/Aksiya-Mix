//
//  SingleProductDM.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import Foundation

struct SingleProductDM: Codable {
    let created_at: String
    let title: String
    let product_counts: Int
    let likes: String
    let views: String
    let discount_type: Int
    let remainder: Int
    let user_like: String
    let start_date: String
    let images: [String]
    let video_link: String
    let store: SingleProductStore
    let store_branches: [String?]
    let currency: Int
    let discount_amount_is_percent: String
    let desc: String
    let end_date: String
    let user_dislike: String
    let price: String
    let is_advertised: String
    let categories: [SingleProductCategory]
    let features: [SingleProductFeature]
    let _id: Int
    let user_wishlist: String
    let discount_amount: String
    let pk: Int
}

struct SingleProductFeature: Codable {
    var type: String?
    var name: String?
    var values: [SingleProductFeatureValue]?
    var pk: Int?
    var is_custom: String?
}

struct SingleProductFeatureValue: Codable {
    var price: Int?
    var value: String?
    var pk: Int?
}

struct SingleProductStore: Codable {
    let rating3: Int
    let rating2: Int
    let rating1: Int
    let shortname: String
    let logo: String
    let name: String
    let desc: String
    let user_follow: String
    let working_day_end: Int
    let slogan: String
    let address: String
    let region: Int
    let pk: Int
    let term_payment: String
    let latitude: String
    let delivery: String
    let district: Int
    let likes: String
    let rating4: Int
    let main_phone_number: String
    let working_time_end: String
    let is_verified: String
    let rating5: Int
    let longitude: String
    let working_day_start: Int
    let followers: String
    let working_time_start: String
}

struct SingleProductCategory: Codable {
    var name: String?
    var pk: Int?
}

struct SingleProductStoreBranches: Codable {
    var name: String?
}
