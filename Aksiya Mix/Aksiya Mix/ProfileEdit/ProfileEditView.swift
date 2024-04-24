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

class ProfileEditView: UIView, UITableViewDelegate, UITableViewDataSource, ProfileEditCellDelegate, ProfileNameEditCellDelegate, ProfileRegionsEditCellDelegate, ProfileNumberEditCellDelegate {
    
    var newData = UserData()
    var itemsData: [ProfileEditDM] = []
    var delegate: ProfileEditViewDelegate?
    
    var userdata: UserData? {
        didSet {
            
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
        table.register(ProfileNameEditCell.self, forCellReuseIdentifier: "ProfileNameEditCell")
        table.register(ProfileRegionsEditCell.self, forCellReuseIdentifier: "ProfileRegionsEditCell")
        table.register(ProfileNumberEditCell.self, forCellReuseIdentifier: "ProfileNumberEditCell")
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
        let placeholderForSex = userdata?.gender == 1 ? "Erkak" : "Ayol"
        itemsData = [
            ProfileEditDM(title: "Ism", placeholder: userdata?.fullname, type: .name),
            ProfileEditDM(title: "Tug'ilgan sana", type: .bornData),
            ProfileEditDM(title: "Jins", placeholder: placeholderForSex, type: .sex),
            ProfileEditDM(title: "Viloyat", placeholder: userdata?.district_label, type: .region),
            ProfileEditDM(title: "Telefon raqam", type: .numberPhone),
            ProfileEditDM(title: "Elektron pochta", type: .email)
        ]
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNameEditCell", for: indexPath) as! ProfileNameEditCell
            cell.tag = indexPath.row
            cell.title = "Ism"
            cell.placeholder = userdata?.fullname
            cell.delegate = self
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileEditCell", for: indexPath) as! ProfileEditCell
            cell.title = itemsData[indexPath.row]
            cell.tag = indexPath.row
            cell.delegate = self
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNameEditCell", for: indexPath) as! ProfileNameEditCell
            cell.title = "Email"
            cell.placeholder = userdata?.email
            cell.delegate = self
            cell.tag = indexPath.row
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileRegionsEditCell", for: indexPath) as! ProfileRegionsEditCell
            cell.delegate = self
            cell.provinceText = userdata?.region_label
            cell.regionText = userdata?.district_label
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNumberEditCell", for: indexPath) as! ProfileNumberEditCell
            cell.title = "Telefon raqam"
            cell.placeholder = userdata?.phone_number
            cell.delegate = self
            cell.tag = indexPath.row
            return cell
        }
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
            print(data)
        }
        if tag == 6 {
            //email
            newData.email = data
        }
        print(data, tag)
    }
    
    @objc
    func tappedSave() {
        if newData.fullname?.isEmpty ?? true {
            newData.fullname = userdata?.fullname
        }
        delegate?.save(data: newData)
    }
    
    func selectedRegion(id: Int?) {
        
    }
    
    func sentNewName(data: String?, tag: Int) {
        if tag == 0 {
            //name
            newData.fullname = data
        }
        if tag == 6 {
            //name
            newData.email = data
        }

    }
    
    func sentNewNumber(number: String?) {
        newData.phone_number = number
        print(newData)
    }
    
    func errorNewNumber() {
        
    }
    
    func selectedMN() {
        newData.gender = 0
    }
    
    func selectedWM() {
        newData.gender = 1
    }

    
    func selectProvinse(id: Int?) {
        userdata?.region = id
        newData = userdata ?? UserData()
        newData.region = id
    }
    
    func selectRegion(id: Int?) {
        userdata?.district = id
        newData = userdata ?? UserData()
        newData.district = id
    }
    
}
