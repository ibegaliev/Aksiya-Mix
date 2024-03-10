//
//  EnterPhoneViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import Foundation
import SwiftyJSON

class EnterPhoneViewModel {
    
    var view = EnterPhoneView()
    
    func validateUzbekPhoneNumber(_ phoneNumber: String, completion: @escaping (_ isNumber: Bool) -> () ) {
        let phoneNumberRegex = #"^\+998\s?\d{2}\s?\d{3}\s?\d{2}\s?\d{2}$"#
        let regex = try! NSRegularExpression(pattern: phoneNumberRegex)
        let range = NSRange(location: 0, length: phoneNumber.utf16.count)
        completion(regex.firstMatch(in: phoneNumber, options: [], range: range) != nil)
    }
    
    func sentCode(number: String?, completion: @escaping (_ phoneNumber: String?)->(), error: @escaping (_ error: String?)->()) {
        guard let number else { return }
        let data = ["phone_number": number]
        NetworkService.shared.mainRequest(urlPath: .authCode, method: .post, bodyData: data) { responseData in 
            completion(number)
        } errorData: { data in
            print(JSON(data))
            var errorData: ErrorResponse?
            errorData = Parser.shared.parse(json: data)
            error(errorData?.error?.detail?.phone_number?.first)
        }
    }
    
}
