//
//  UserTokenManager.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 04/03/24.
//

import Foundation

class UserTokenManager {
    
    static var manager = UserTokenManager()
    
    private var code = "_CODE_AKSIYAMIX_CODE_"
    private var token = "_TOKEN_AKSIYAMIX_TOKEN_"

    func saveData(data: UserTokenDM?) {
        guard let data else { return }
        UserDefaultsManager().write(object: data.token ?? "", key: token)
        UserDefaultsManager().write(object: data.code ?? 0, key: code)
    }
    
    func getData() -> UserTokenDM {
        return UserTokenDM(
            code: UserDefaultsManager().getObject(key: code) as? Int,
            token: UserDefaultsManager().getObject(key: token) as? String
        )
    }
    
}
