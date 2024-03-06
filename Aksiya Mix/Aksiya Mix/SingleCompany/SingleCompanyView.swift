//
//  View.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class SingleCompanyView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    lazy var topNavigation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
            
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.contentInset = UIEdgeInsets(
            top: 0.screenWight/1.9,
            left: 0,
            bottom: 50,
            right: 0
        )
        tv.register(CompanyMainCell.self, forCellReuseIdentifier: "CompanyMainCell")
        return tv
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
        addSubview(mainImage)
        addSubview(tableView)
        addSubview(topNavigation)
    }

    private func setConstraints() {
        topNavigation.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(50)
        }
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(topNavigation.snp_bottomMargin)
            make.left.right.equalTo(self)
            make.height.equalTo(0.screenWight/1.8)
        }
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(topNavigation.snp_bottomMargin)
        }
        mainImage.backgroundColor = .cyan
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyMainCell", for: indexPath) as! CompanyMainCell
            cell.backgroundColor = .clear
            return cell
        } else if indexPath.row == 1 {
            
        }
        return UITableViewCell()
    }

    
}
