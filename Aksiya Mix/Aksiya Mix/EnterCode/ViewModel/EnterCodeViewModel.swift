//
//  EnterCodeViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import Foundation

class EnterCodeViewModel {
    
    let view = EnterCodeView()
    var phoneNumber: String?  

    func getToken(code: String?, completion: @escaping ()->(), error: @escaping (_ description: String?)->()) {
        guard let phoneNumber else { return }
        guard let code else { return }
        let data = ["phone_number": phoneNumber, "auth_code":code]
        NetworkService.shared.mainRequest(urlPath: .authToken, method: .post, bodyData: data) { responseData in 
            var data: UserTokenDM? = Parser.shared.parse(json: responseData)
            UserTokenManager.manager.saveData(data: data)
            completion()
        } errorData: { errorData in
            var data: ErrorResponse?
            data = Parser.shared.parse(json: errorData)
            error(data?.error?.detail?.auth_code?.first)
        }

        
    }
    
}
