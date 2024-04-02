//
//  UserViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 19/02/24.
//

import Foundation

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
        } errorData: { errorData in
            
        }

    }
    
}
