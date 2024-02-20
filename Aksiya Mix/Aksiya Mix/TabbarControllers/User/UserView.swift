//
//  UserView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 19/02/24.
//

import UIKit

class UserView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 16
        return stack
    }()
        
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .backColor
        table.contentInset = UIEdgeInsets(top: -50, left: 0, bottom: 50, right: 0)
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.register(UserTopView.self, forCellReuseIdentifier: "UserTopView")
        table.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        return table
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        
        return view
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
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}

extension UserView: UITableViewDelegate, UITableViewDataSource {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTopView", for: indexPath) as! UserTopView
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        
        return cell
    }
    
}
