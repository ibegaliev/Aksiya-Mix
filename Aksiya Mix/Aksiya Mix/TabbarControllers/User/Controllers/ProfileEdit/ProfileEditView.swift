//
//  ProfileEditView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import UIKit

enum ProfileEditType {
case name, bornData, sex, region, fok, numberPhone, email
}

struct ProfileEditDM {
    var title: String?
    var type: ProfileEditType
}

class ProfileEditView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var itemsData: [ProfileEditDM] = [
        ProfileEditDM(title: "Ism", type: .name),
        ProfileEditDM(title: "Tug'ilgan sana", type: .bornData),
        ProfileEditDM(title: "Jins", type: .sex),
        ProfileEditDM(title: "Viloyat", type: .region),
        ProfileEditDM(title: "Tuman", type: .fok),
        ProfileEditDM(title: "Telefon raqam", type: .numberPhone),
        ProfileEditDM(title: "Elektron pochta", type: .email)
    ]
    
    lazy var topNavigation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.backgroundColor = .backColor
        table.showsVerticalScrollIndicator = false
        table.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 100, right: 0)
        table.register(ProfileEditCell.self, forCellReuseIdentifier: "ProfileEditCell")
        return table
    }()
    
    lazy var saveButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitle("Save", for: .normal)
        btn.layer.borderColor = UIColor.selectBlue.cgColor
        btn.layer.borderWidth = 1
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
        addSubview(tableView)
        addSubview(topNavigation)
        addSubview(saveButton)
        backgroundColor = .backColor
    }
    
    private func setConstraints() {
        topNavigation.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(85.toScreen)
        }
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(topNavigation.snp_bottomMargin)
        }
        saveButton.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(16)
            make.bottom.equalTo(self).inset(32)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileEditCell", for: indexPath) as! ProfileEditCell
        cell.title = itemsData[indexPath.row]
        return cell
    }

    
}
