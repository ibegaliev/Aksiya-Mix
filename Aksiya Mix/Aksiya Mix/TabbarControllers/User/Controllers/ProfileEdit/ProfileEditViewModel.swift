//
//  ProfileEditViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import Foundation

class ProfileEditViewModel {
    
    let view = ProfileEditView()
    
    var userdata: UserData? {
        didSet {
            print(userdata)
            view.userdata = self.userdata ?? UserData()
        }
    }

    
}
