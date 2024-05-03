//
//  SingleProductDM.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import Foundation
import SwiftyJSON

struct SingleProductDM {
    let startDate: String
    let images: [String]
    let desc: String
    let videoLink: String
    let price: String
    let pk: Int
    let currency: Int
    let discountType: Int
    let remainder: Int
    let isAdvertised: Bool
    let createdAt: String
    let discountAmountIsPercent: Bool
    let userDislike: Bool
    let features: [SingleProductFeature]
    let store: SingleProductStore
    let categories: [SingleProductCategory]
    let userLike: Bool
    let endDate: String
    let discountAmount: String
    let likes: String
    let views: String
    let storeBranches: [Any] // Assuming it's an array of any type
    let productCounts: Int
    let title: String
    let userWishlist: Bool

    init(json: JSON) {
        startDate = json["start_date"].stringValue
        images = json["images"].arrayValue.map { $0.stringValue }
        desc = json["desc"].stringValue
        videoLink = json["video_link"].stringValue
        price = json["price"].stringValue
        pk = json["pk"].intValue
        currency = json["currency"].intValue
        discountType = json["discount_type"].intValue
        remainder = json["remainder"].intValue
        isAdvertised = json["is_advertised"].boolValue
        createdAt = json["created_at"].stringValue
        discountAmountIsPercent = json["discount_amount_is_percent"].boolValue
        userDislike = json["user_dislike"].boolValue
        features = json["features"].arrayValue.map { SingleProductFeature(json: $0) }
        store = SingleProductStore(json: json["store"])
        categories = json["categories"].arrayValue.map { SingleProductCategory(json: $0) }
        userLike = json["user_like"].boolValue
        endDate = json["end_date"].stringValue
        discountAmount = json["discount_amount"].stringValue
        likes = json["likes"].stringValue
        views = json["views"].stringValue
        storeBranches = json["store_branches"].arrayValue.map { $0.object as Any }
        productCounts = json["product_counts"].intValue
        title = json["title"].stringValue
        userWishlist = json["user_wishlist"].boolValue
    }
    
}

struct SingleProductFeature: Codable {
    let type: String
    let isCustom: Bool
    let values: [SingleProductFeatureValue]
    let name: String
    let pk: Int
    
    init(json: JSON) {
        type = json["type"].stringValue
        isCustom = json["is_custom"].boolValue
        values = json["values"].arrayValue.map { SingleProductFeatureValue(json: $0) }
        name = json["name"].stringValue
        pk = json["pk"].intValue
    }
}

struct SingleProductFeatureValue: Codable {
    let price: Int
    let pk: Int
    let value: String
    
    init(json: JSON) {
        price = json["price"].intValue
        pk = json["pk"].intValue
        value = json["value"].stringValue
    }
}

struct SingleProductStore: Codable {
    let desc: String
    let longitude: Double
    let slogan: String
    let delivery: Bool
    let district: Int
    let workingDayStart: Int
    let rating4: Int
    let rating3: Int
    let followers: String
    let mainPhoneNumber: String
    let logo: String
    let rating1: Int
    let pk: Int
    let workingTimeEnd: String
    let termPayment: Bool
    let region: Int
    let isVerified: Bool
    let address: String
    let userFollow: Bool
    let latitude: Double
    let workingTimeStart: String
    let likes: String
    let rating5: Int
    let workingDayEnd: Int
    let name: String
    let shortname: String
    let rating2: Int

    init(json: JSON) {
        desc = json["desc"].stringValue
        longitude = json["longitude"].doubleValue
        slogan = json["slogan"].stringValue
        delivery = json["delivery"].boolValue
        district = json["district"].intValue
        workingDayStart = json["working_day_start"].intValue
        rating4 = json["rating4"].intValue
        rating3 = json["rating3"].intValue
        followers = json["followers"].stringValue
        mainPhoneNumber = json["main_phone_number"].stringValue
        logo = json["logo"].stringValue
        rating1 = json["rating1"].intValue
        pk = json["pk"].intValue
        workingTimeEnd = json["working_time_end"].stringValue
        termPayment = json["term_payment"].boolValue
        region = json["region"].intValue
        isVerified = json["is_verified"].boolValue
        address = json["address"].stringValue
        userFollow = json["user_follow"].boolValue
        latitude = json["latitude"].doubleValue
        workingTimeStart = json["working_time_start"].stringValue
        likes = json["likes"].stringValue
        rating5 = json["rating5"].intValue
        workingDayEnd = json["working_day_end"].intValue
        name = json["name"].stringValue
        shortname = json["shortname"].stringValue
        rating2 = json["rating2"].intValue
    }
    
}

struct SingleProductCategory: Codable {
    let name: String
    let pk: Int
    
    init(json: JSON) {
        name = json["name"].stringValue
        pk = json["pk"].intValue
    }
}
