//
//  UserViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 19/02/24.
//

import SwiftyJSON

class UserViewModel {
    
    var view = UserView()
    
    var userdata: UserData? {
        didSet {
            view.userdata = self.userdata
        }
    }
    
    func getData() {
        NetworkService.shared.mainRequestWithToken(urlPath: .usersProfile, method: .get, bodyData: nil) { [self] responseData in
            userdata = Parser.shared.parse(json: responseData)
            print(userdata)
        } errorData: { errorData in }
    }
    
    func uploadData(data: UserData?) {
        guard let data else { return }
        var bodyData: [String: String] = [:]
        
        if let email = data.email { bodyData["email"] = email }
        if let fullname = data.fullname { bodyData["fullname"] = fullname }
        if let gender = data.gender { bodyData["gender"] = "\(gender)" }
        if let region = data.region { bodyData["region"] = "\(region)" }
        if let district = data.district { bodyData["fullname"] = "\(district)" }
        if let birthday = data.birthday { bodyData["birthday"] = "\(birthday)" }

        NetworkService.shared.mainRequestWithToken(
            urlPath: .usersProfile,
            method: .put,
            bodyData: bodyData) { [self] responseData in
                userdata = Parser.shared.parse(json: responseData)
            } errorData: { errorData in }

    }
    
}
