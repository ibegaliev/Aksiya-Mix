//
//  SingleProductView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

protocol SingleProductViewDelegate: SingleNavigationViewDelegate {
    
}

class SingleProductView: UIView, UITableViewDelegate, UITableViewDataSource, SingleNavigationViewDelegate {
    
    var delegate: SingleProductViewDelegate?
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        view.rowHeight = UITableView.automaticDimension
        view.register(SingleTopView.self, forCellReuseIdentifier: "SingleTopView")
        view.register(DescriptionView.self, forCellReuseIdentifier: "DescriptionView")
        view.register(SingleProductHorizontalCell.self, forCellReuseIdentifier: "SingleProductHorizontalCell")
        view.register(UserDatesCell.self, forCellReuseIdentifier: "UserDatesCell")
        view.register(LineCell.self, forCellReuseIdentifier: "LineCell")
        view.register(StoreCell.self, forCellReuseIdentifier: "StoreCell")
        view.contentInset = .init(top: -10, left: 0, bottom: 100, right: 0)
        view.backgroundColor = .backColor
        return view
    }()
    
    lazy var topNavigation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    lazy var navigationView: UIView = {
        let view = SingleNavigationVIew()
        view.delegate = self
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        backgroundColor = .backColor
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(tableView)
        addSubview(navigationView)
        addSubview(topNavigation)
    }
    
    private func setConstraints() {
        
        topNavigation.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(self).inset(44)
            make.left.right.equalTo(self)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            8
        } else {
            10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SingleTopView", for: indexPath) as! SingleTopView
                
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LineCell", for: indexPath) as! LineCell
                cell.backgroundColor = .backColor
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionView", for: indexPath) as! DescriptionView
                
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LineCell", for: indexPath) as! LineCell
                cell.backgroundColor = .backColor
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserDatesCell", for: indexPath) as! UserDatesCell
                
                return cell
            } else if indexPath.row == 5 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LineCell", for: indexPath) as! LineCell
                cell.backgroundColor = .backColor
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 6 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreCell
                
                return cell
            } else if indexPath.row == 7 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LineCell", for: indexPath) as! LineCell
                cell.backgroundColor = .backColor
                cell.selectionStyle = .none
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleProductHorizontalCell", for: indexPath) as! SingleProductHorizontalCell
            
            return cell
        }
        return UITableViewCell()
    }
    
}

extension SingleProductView {
    
    func backViewTapped() {
        delegate?.backViewTapped()
    }
    
    func shareButtonTapped() {
        delegate?.shareButtonTapped()
    }
    
    func likeButtonTapped() {
        delegate?.likeButtonTapped()
    }

}

class LineCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .red
        contentView.snp.makeConstraints { make in
            make.height.equalTo(8)
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
