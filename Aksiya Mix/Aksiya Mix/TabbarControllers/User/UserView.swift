//
//  UserView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 19/02/24.
//

import UIKit

protocol UserViewDelegate {
    func auth()
}

struct UserViewData {
    var icon: UIImage
    var title: String
}

class UserView: UIView {
    
    var delegate: UserViewDelegate?
    
    var data: [UserViewData] = [
        UserViewData(icon: .settingsUser, title: "Sozlamalar"),
        UserViewData(icon: .messageDotsCircle, title: "Fikir-mulohazalar"),
        UserViewData(icon: .shieldTick, title: "Shartlar va qoidalar"),
        UserViewData(icon: .messageDotsCircle, title: "Ishtimoiy tarmoqlarda"),
        UserViewData(icon: .infoCircle, title: "Ilova haqida"),
        UserViewData(icon: .logOut, title: "Chiqish")
    ]
    
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
        table.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 50, right: 0)
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTopView", for: indexPath) as! UserTopView
            cell.delegate = self
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.cellData = data[indexPath.row]
        if indexPath.row == 0 { cell.cellType = .top } else if indexPath.row == 5 { cell.cellType = .bottom }
        return cell
    }
    
}

extension UserView: UserTopViewDelegate {
    
    func authTapped() {
        delegate?.auth()
    }
    
}
