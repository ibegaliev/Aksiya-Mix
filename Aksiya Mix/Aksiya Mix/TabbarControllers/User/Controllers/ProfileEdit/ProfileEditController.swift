//
//  ProfileEditController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import UIKit

class ProfileEditController: AksiyaViewController {
    
    var viewModel = ProfileEditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        title = LyricsManager.getLyrics(type: .editProfile)
        view.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
}
