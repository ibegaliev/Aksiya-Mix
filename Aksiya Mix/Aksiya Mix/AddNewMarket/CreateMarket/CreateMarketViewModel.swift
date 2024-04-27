//
//  CreateMarketViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 12/04/24.
//

import UIKit
import SwiftyJSON

protocol CreateMarketViewDelegate {
    func imageSelected()
    func saveDataTapped(data: CreateMarketDM)
}

class CreateMarketViewModel {
    
    var view = CreateMarketView()
    var selectedImage: UIImage? {
        didSet {
            view.selectedImage = selectedImage
        }
    }

    func createMarket(data: CreateMarketDM, completion: @escaping ()->()) {
        
        var bodyData: [String: Any] = [:]
        
        if let name = data.owner_lastname { bodyData["owner_lastname"] = name }
        if let name = data.name_uz { bodyData["name_uz"] = name }
        if let name = data.name_ru { bodyData["name_ru"] = name }
        if let phoneNumber = data.main_phone_number { bodyData["main_phone_number"] = phoneNumber }
        if let delivery = data.delivery { bodyData["delivery"] = delivery }
        if let region = data.region { bodyData["region"] = region }
        if let district = data.district { bodyData["district"] = district }
        if let address = data.address { bodyData["address"] = address }
        if let longitude = data.longitude { bodyData["longitude"] = longitude }
        if let latitude = data.latitude { bodyData["latitude"] = latitude }
        if let workingTimeStart = data.working_time_start { bodyData["working_time_start"] = workingTimeStart }
        if let workingTimeEnd = data.working_time_end { bodyData["working_time_end"] = workingTimeEnd }
        if let workingDayStart = data.working_day_start { bodyData["working_day_start"] = workingDayStart }
        if let workingDayEnd = data.working_day_end { bodyData["working_day_end"] = workingDayEnd }
        if let categories = data.categories { bodyData["categories"] = categories }
        if let shortname = data.shortname { bodyData["shortname"] = shortname }
        if let descriptionUZ = data.desc_uz { bodyData["desc_uz"] = descriptionUZ }
        if let descriptionRU = data.desc_ru { bodyData["desc_ru"] = descriptionRU }
        if let sloganUZ = data.slogan_uz { bodyData["slogan_uz"] = sloganUZ }
        if let sloganRU = data.slogan_ru { bodyData["slogan_ru"] = sloganRU }
        if let ownerFirstname = data.owner_firstname { bodyData["owner_firstname"] = ownerFirstname }
        if let ownerFathername = data.owner_fathername { bodyData["owner_fathername"] = ownerFathername }
        if let phoneNumber2 = data.phone_number2 { bodyData["phone_number2"] = phoneNumber2 }
        if let phoneNumber3 = data.phone_number3 { bodyData["phone_number3"] = phoneNumber3 }
        if let termPayment = data.term_payment { bodyData["term_payment"] = termPayment }
        if let videoLink = data.video_link { bodyData["video_link"] = videoLink }
        
        
        NetworkService.shared.mainRequestWithToken(
            urlPath: .stores,
            method: .post,
            bodyData: bodyData
        ) { responseData in
            print(JSON(responseData))
        } errorData: { errorData in
            print(JSON(errorData))
        }
        
    }
    
}
