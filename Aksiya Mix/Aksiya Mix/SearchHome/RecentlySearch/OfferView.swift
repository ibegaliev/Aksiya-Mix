//
//  OfferView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 15/02/24.
//

import UIKit

protocol OfferViewDelegate {
    func didSelect(indexPath: IndexPath)
}

class OfferView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: OfferViewDelegate?
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    lazy var topNavigation: SearchTextField = {
        let view = SearchTextField()
        view.isButton = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.backgroundColor = .backColor
        tv.showsVerticalScrollIndicator = false
        tv.contentInset = .init(top: 4, left: 0, bottom: 50, right: 0)
        tv.register(OfferCell.self, forCellReuseIdentifier: "OfferCell")
        tv.register(EmptyCell.self, forCellReuseIdentifier: "EmptyCell")
        tv.register(CategoryCell.self, forCellReuseIdentifier: "CategoryCell")
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
        backgroundColor = .backColor
        addSubview(mainStack)
        [topNavigation, tableView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self).inset(12)
            make.left.right.bottom.equalTo(self)
        }
        tableView.snp.makeConstraints { make in
            make.width.equalTo(0.screenWight)
        }
        topNavigation.snp.makeConstraints { make in
            make.width.equalTo(0.screenWight - 32)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if true {
            if section == 0 {
                return 1
            }
        }
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if false {
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
                    cell.mainImage.isHidden = true
                    cell.chevronImage.isHidden = true
                    cell.titleLabel.font = .appFont(ofSize: 18, weight: .bold)
                    cell.titleLabel.text = "Oxirgi qidirilganlar"
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "OfferCell", for: indexPath) as! OfferCell
                    cell.mainImage.isHidden = true
                    cell.titleLabel.font = .appFont(ofSize: 14, weight: .medium)
                    return cell
                }
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyCell
                
                return cell
            }
        } else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
                cell.mainImage.isHidden = true
                cell.chevronImage.isHidden = true
                cell.titleLabel.text = "Ko'p qidirilganlar"
                cell.titleLabel.font = .appFont(ofSize: 18, weight: .bold)
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "OfferCell", for: indexPath) as! OfferCell
                cell.mainImage.isHidden = true
                cell.titleLabel.font = .appFont(ofSize: 14, weight: .medium)
                return cell
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            delegate?.didSelect(indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 0 && indexPath.row != 0 {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
                
            }
            let action = UISwipeActionsConfiguration(actions: [deleteAction])
            return action
        } else {
            return nil
        }
    }
    
}

class OfferItemsCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Barcha toifalar"
        lbl.font = .appFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    
    lazy var rightIcon: UIImageView = {
        let img = UIImageView()
        img.image = .chevronRight
        return img
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        selectionStyle = .none
        contentView.addSubview(mainStack)
        [titleLabel, rightIcon].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(12)
        }
    }
    
}