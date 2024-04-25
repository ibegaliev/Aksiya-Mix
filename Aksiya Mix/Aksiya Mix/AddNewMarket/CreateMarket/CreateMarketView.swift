//
//  CreateMarketView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 12/04/24.
//

import UIKit

class CreateMarketView: UIView {
    
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

            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DatedMarketCell", for: indexPath) as! DatedMarketCell
            
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeliverMarketCell", for: indexPath) as! DeliverMarketCell
            
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
        print(text)
    }
    
    func changeSurnameField(text: String) {
        print(text)
    }
    
    func changeMidnameField(text: String) {
        print(text)
    }
    
}

extension CreateMarketView: ProfileRegionsEditCellDelegate {
    
    func selectProvinse(id: Int?) {
        print(id)
    }
    
    func selectRegion(id: Int?) {
        print(id)
    }

}

extension CreateMarketView: NumberMarketCellDelegate {
    
    func sentNewNumber(number: String?) {
        print("NEW NUMBER:", number)
    }
    
    func errorNewNumber() {
        print("error")
    }
    
}

extension CreateMarketView: CreateButtonMarketCellDelegate {
    
    func saveTapped() {
        
    }
    
}
