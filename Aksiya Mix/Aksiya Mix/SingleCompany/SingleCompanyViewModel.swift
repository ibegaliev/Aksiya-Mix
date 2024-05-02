//
//  ViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import Foundation
import SwiftyJSON

class SingleCompanyViewModel {
    
    let view = SingleCompanyView()
    
    var id: Int? {
        didSet {
            getAllDates(id: id)
        }
    }
    
    var data: SingleCompanyDM? {
        didSet {
            view.data = data
        }
    }
    
    func getAllDates(id: Int?) {
        guard let id else { return }
        NetworkService.shared.mainRequestWithToken(
            urlPath: .stores,
            addToURL: "\(id)",
            method: .get,
            bodyData: nil) { [self] responseData in
                print(JSON(responseData))
                data = Parser.shared.parse(json: responseData)
            } errorData: { errorData in
                let error: SingleCompanyError? = Parser.shared.parse(json: errorData)
                print(error?.error?.detail ?? "")
            }

    }
    
}
