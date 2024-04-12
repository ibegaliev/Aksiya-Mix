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
        table.register(OwnerMarketCell.self, forCellReuseIdentifier: "OwnerMarketCell")
        table.register(UploadImageMarketCell.self, forCellReuseIdentifier: "UploadImageMarketCell")
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
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OwnerMarketCell", for: indexPath) as! OwnerMarketCell
            cell.title = "Do'kon egasining ma'lumotlari"
            cell.placeholder = "To'liq ism sharif"
            cell.number = "+998 95 905 15 75"
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UploadImageMarketCell", for: indexPath) as! UploadImageMarketCell

            return cell
        }
        return UITableViewCell()
    }
    
}
