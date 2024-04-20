//
//  ProfileEditView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import UIKit

protocol ProfileEditViewDelegate {
    func save(data: UserData?)
}

enum ProfileEditType {
    case name, bornData, sex, region, fok, numberPhone, email
}

struct ProfileEditDM {
    var title: String?
    var placeholder: String?
    var type: ProfileEditType
}

class ProfileEditView: UIView, UITableViewDelegate, UITableViewDataSource, ProfileEditCellDelegate {
    
    var newData = UserData()
    var itemsData: [ProfileEditDM] = []
    var delegate: ProfileEditViewDelegate?
    
    var userdata: UserData? {
        didSet {
            initializeItemsData()
        }
    }
    
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
        btn.addTarget(self, action: #selector(tappedSave), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        initializeItemsData()
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
    
    private func initializeItemsData() {
        itemsData = [
            ProfileEditDM(title: "Ism", placeholder: userdata?.fullname, type: .name),
            ProfileEditDM(title: "Tug'ilgan sana", type: .bornData),
            ProfileEditDM(title: "Jins", type: .sex),
            ProfileEditDM(title: "Viloyat", type: .region),
            ProfileEditDM(title: "Tuman", type: .fok),
            ProfileEditDM(title: "Telefon raqam" ,placeholder: userdata?.phone_number, type: .numberPhone),
            ProfileEditDM(title: "Elektron pochta", type: .email)
        ]
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileEditCell", for: indexPath) as! ProfileEditCell
        cell.title = itemsData[indexPath.row]
        cell.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func setData(data: String?, tag: Int?) {
        
        if tag == 0 {
            //name
            newData.fullname = data
        }
        if tag == 1 {
            //data brightday
            
        }
        if tag == 5 {
            //phone number
            newData.phone_number = data
        }
        if tag == 6 {
            //email
            newData.email = data
        }
        print(data, tag)
    }
    
    @objc
    func tappedSave() {
        delegate?.save(data: newData)
    }
    
}
