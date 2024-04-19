//
//  ProfileEditViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import SwiftyJSON

class ProfileEditViewModel {
    
    let view = ProfileEditView()
    
    var userdata: UserData? {
        didSet {
            view.userdata = self.userdata
            
        }
    }

    func uploadData(data: UserData?) {
        
        var bodyData: [String: String] = [:]
        
        if let email = data?.email { bodyData["email"] = email }
        if let fullname = data?.fullname { bodyData["fullname"] = fullname }
        if let gender = data?.gender { bodyData["gender"] = "\(gender)" }
        if let region = data?.region { bodyData["region"] = "\(region)" }
        if let district = data?.district { bodyData["district"] = "\(district)" }
        if let birthday = data?.birthday { bodyData["birthday"] = birthday }
        
        NetworkService.shared.mainRequestWithToken(
            urlPath: .usersProfile,
            method: .put,
            bodyData: bodyData)
        { responseData in
            print(JSON(responseData))
        } errorData: { errorData in
            
        }
        
    }
    
}
