//
//  PhoneDM.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 02/03/24.
//

import Foundation

struct ErrorResponse: Codable {
    let error: ErrorPhoneObject?
}

struct ErrorPhoneObject: Codable {
    let code: Int?
    let detail: ErrorDetail?
}

struct ErrorDetail: Codable {
    let phone_number: [String]?
}


