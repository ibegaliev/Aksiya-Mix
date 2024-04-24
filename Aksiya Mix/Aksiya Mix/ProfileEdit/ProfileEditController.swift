//
//  ProfileEditController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import UIKit

protocol ProfileEditControllerDelegate {
    func saveData(data: UserData?)
    func error()
    func reloadData()
}

class ProfileEditController: AksiyaViewController, ProfileEditViewDelegate {
    
    var viewModel = ProfileEditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        title = LyricsManager.getLyrics(type: .editProfile)
        view.addSubview(viewModel.view)
        viewModel.view.delegate = self
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func save(data: UserData?) {
        viewModel.uploadData(data: data) { [self] data in
            viewModel.delegate?.saveData(data: data)
            viewModel.delegate?.reloadData()
        }
    }
    
}
