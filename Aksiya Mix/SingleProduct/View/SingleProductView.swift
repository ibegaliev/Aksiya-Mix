//
//  SingleProductView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

class SingleProductView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.rowHeight = UITableView.automaticDimension
        view.register(SingleTopView.self, forCellReuseIdentifier: "SingleTopView")
        view.register(DescriptionView.self, forCellReuseIdentifier: "DescriptionView")
        view.register(SingleProductHorizontalCell.self, forCellReuseIdentifier: "SingleProductHorizontalCell")
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
            2
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "SingleTopView", for: indexPath) as! SingleTopView
                
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleProductHorizontalCell", for: indexPath) as! SingleProductHorizontalCell
            
            return cell
        }
        return UITableViewCell()
    }
            
}
