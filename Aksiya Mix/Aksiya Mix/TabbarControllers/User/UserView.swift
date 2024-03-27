//
//  UserView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 19/02/24.
//

import UIKit

protocol UserViewDelegate {
    func auth()
    
    func loguotTapped()
}

struct UserViewData {
    var icon: UIImage
    var title: String
}

class UserView: UIView {
    
    var delegate: UserViewDelegate?
        
    var data: [[UserViewData]] = [
        [
            UserViewData(icon: .userUnselected, title: "Profilni tahrirlash"),
            UserViewData(icon: .notificationShop, title: "Bildirishnoma"),
            UserViewData(icon: .shopHeard, title: "Sevimli do'konlar"),
        ],
        [
            UserViewData(icon: .settingsUser, title: "Sozlamalar"),
            UserViewData(icon: .messageDotsCircle, title: "Fikir-mulohazalar"),
            UserViewData(icon: .shieldTick, title: "Shartlar va qoidalar"),
            UserViewData(icon: .messageDotsCircle, title: "Ishtimoiy tarmoqlarda"),
            UserViewData(icon: .infoCircle, title: "Ilova haqida"),
            UserViewData(icon: .logOut, title: "Chiqish")
        ]
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
        table.separatorStyle = .none
        table.backgroundColor = .backColor
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        table.register(UserTopView.self, forCellReuseIdentifier: "UserTopView")
        table.register(UserNamesCell.self, forCellReuseIdentifier: "UserNamesCell")
        table.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 50, right: 0)
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
        data.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return data[section - 1].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            print(UserTokenManager.manager.isHaveToken())
            if UserTokenManager.manager.isHaveToken() {
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserNamesCell", for: indexPath) as! UserNamesCell
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserTopView", for: indexPath) as! UserTopView
                cell.delegate = self
                return cell
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.cellData = data[indexPath.section - 1][indexPath.row]
        if indexPath.row == 0 {
            cell.cellType = .top
            cell.lineView.isHidden = false
        } else if indexPath.row == data[indexPath.section - 1].count - 1 {
            cell.cellType = .bottom
            cell.lineView.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        if indexPath.section == 0 {
            
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                
            } else if indexPath.row == 1 {
                
            }  else if indexPath.row == 2 {
                
            }  else if indexPath.row == 3 {
                
            }  else if indexPath.row == 4 {
                
            }  else if indexPath.row == 5 {
                delegate?.loguotTapped()
            }
        } else {
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .red
        headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
}

extension UserView: UserTopViewDelegate {
    
    func authTapped() {
        delegate?.auth()
    }
    
}
