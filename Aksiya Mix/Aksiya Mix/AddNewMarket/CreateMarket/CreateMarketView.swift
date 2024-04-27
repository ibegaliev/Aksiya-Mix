//
//  CreateMarketView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 12/04/24.
//

import UIKit

class CreateMarketView: UIView {

    var delegate: CreateMarketViewDelegate?
    
    var nameOfOwner: String? {
        didSet {
            print(nameOfOwner)
            resultData.owner_firstname = nameOfOwner
        }
    }
    var surnameOfOwner: String? {
        didSet {
            resultData.owner_lastname = surnameOfOwner
        }
    }
    var midNameOfOwner: String? {
        didSet {
            resultData.owner_fathername = midNameOfOwner
        }
    }

    var selectedImage: UIImage? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var marketNameUZ: String? {
        didSet {
            resultData.name_uz = marketNameUZ
        }
    }
    var marketNameRU: String? {
        didSet {
            resultData.name_ru = marketNameRU
        }
    }
    var marketUsername: String? {
        didSet {
            resultData.shortname = marketUsername
        }
    }

    var marketfirstDay: String?
    var marketLastDay: String?
    var marketfirstTime: String?
    var marketLastTime: String?
    
    var isHaveDelivery: Bool? {
        didSet {
            resultData.delivery = isHaveDelivery
        }
    }
    
    var provinceID: Int? {
        didSet {
            resultData.region = provinceID
        }
    }
    var regionID: Int? {
        didSet {
            resultData.district = regionID
        }
    }
    var address: String? {
        didSet {
            resultData.address = address
        }
    }
    
    var numberOfStore: String? {
        didSet {
            resultData.main_phone_number = numberOfStore
        }
    }
    var desctiptionOfStoreUz: String? {
        didSet {
            resultData.desc_uz = desctiptionOfStoreUz
        }
    }
    var desctiptionOfStoreRu: String? {
        didSet {
            resultData.desc_ru = desctiptionOfStoreRu
        }
    }

    var resultData: CreateMarketDM = CreateMarketDM()
    
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
        table.backgroundColor = .backColor
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.contentInset = .init(top: 0, left: 0, bottom: 50, right: 0)
        table.register(OwnerMarketCell.self, forCellReuseIdentifier: "OwnerMarketCell")
        table.register(DatedMarketCell.self, forCellReuseIdentifier: "DatedMarketCell")
        table.register(NumberMarketCell.self, forCellReuseIdentifier: "NumberMarketCell")
        table.register(DeliverMarketCell.self, forCellReuseIdentifier: "DeliverMarketCell")
        table.register(LocationMarketCell.self, forCellReuseIdentifier: "LocationMarketCell")
        table.register(ProfileRegionsEditCell.self, forCellReuseIdentifier: "ProfileRegionsEditCell")
        table.register(UploadImageMarketCell.self, forCellReuseIdentifier: "UploadImageMarketCell")
        table.register(CreateButtonMarketCell.self, forCellReuseIdentifier: "CreateButtonMarketCell")
        return table
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
        backgroundColor = .backColor
        addSubview(tableView)
        addSubview(topNavigation)
    }
    
    private func setConstraints() {
        topNavigation.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(85.toScreen)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(topNavigation)
            make.left.right.bottom.equalTo(self)
        }
    }
    
}

extension CreateMarketView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OwnerMarketCell", for: indexPath) as! OwnerMarketCell
            cell.title = "Do'kon egasining ma'lumotlari"
            cell.placeholder = "To'liq ism sharif"
            cell.number = "+998 00 000 00 00"
            cell.delegate = self
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UploadImageMarketCell", for: indexPath) as! UploadImageMarketCell
            cell.delegate = self
            if let img = selectedImage { cell.selectableImageView.image = img; cell.selectableImageView.contentMode = .scaleAspectFill }
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DatedMarketCell", for: indexPath) as! DatedMarketCell
            cell.delegate = self
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeliverMarketCell", for: indexPath) as! DeliverMarketCell
            cell.delegate = self
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileRegionsEditCell", for: indexPath) as! ProfileRegionsEditCell
            cell.mainStack.spacing = 12
            cell.delegate = self
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NumberMarketCell", for: indexPath) as! NumberMarketCell
            cell.title = "Do'kon telefon raqami"
            cell.placeholder = "+998 "
            cell.delegate = self
            return cell
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreateButtonMarketCell", for: indexPath) as! CreateButtonMarketCell
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
}


extension CreateMarketView: OwnerMarketCellDelegate {
    func changeNameField(text: String) {
        nameOfOwner = text
    }
    
    func changeSurnameField(text: String) {
        surnameOfOwner = text
    }
    
    func changeMidnameField(text: String) {
        midNameOfOwner = text
    }
    
}

extension CreateMarketView: DeliverMarketCellDelegate {
    
    func isHaveDelivery(isHave: Bool?) {
        isHaveDelivery = isHave
    }
    
}

extension CreateMarketView: DatesMarketItemsDelegate {
    
    func setbeginData(data: String) {
        marketfirstDay = data
    }
    
    func setendData(data: String) {
        marketLastDay = data
    }
    
    func setbeginTime(data: String) {
        marketfirstTime = data
    }
    
    func setendTime(data: String) {
        marketLastTime = data
    }
    
}

extension CreateMarketView: ProfileRegionsEditCellDelegate {
    
    func selectProvinse(id: Int?) {
        provinceID = id
    }
    
    func selectRegion(id: Int?) {
        regionID = id
    }
    
}

extension CreateMarketView: NumberMarketCellDelegate {
    
    func sentNewNumber(number: String?) {
        numberOfStore = number
    }
    
    func errorNewNumber() {
        print("error")
    }
    
}

extension CreateMarketView: UploadImageMarketCellDelegate {
    
    func nameUZ(text: String?) {
        marketNameUZ = text
    }
    
    func nameRU(text: String?) {
        marketNameRU = text
    }
    
    func shortName(text: String?) {
        marketUsername = text
    }
    
    func imageSelectTapped() {
        delegate?.imageSelected()
    }
    
}

extension CreateMarketView: CreateButtonMarketCellDelegate {
    
    func saveTapped() {
        print(resultData)
    }
    
}
