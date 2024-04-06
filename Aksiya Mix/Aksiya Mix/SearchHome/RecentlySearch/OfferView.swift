//
//  OfferView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 15/02/24.
//

import UIKit

protocol OfferViewDelegate {
    func didSelect(indexPath: IndexPath)
    
    func backButtonTapped()
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
        view.tf.keyboardType = .webSearch
//        view.tf.becomeFirstResponder()
        view.isButton = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(.chevronLeft, for: .normal)
        btn.imageView?.contentMode = .scaleToFill
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.backgroundColor = .backColor
        tv.showsVerticalScrollIndicator = false
        tv.contentInset = .init(top: 20, left: 0, bottom: 50, right: 0)
        tv.register(OfferCell.self, forCellReuseIdentifier: "OfferCell")
        tv.register(OfferItemCell.self, forCellReuseIdentifier: "OfferItemCell")
        tv.register(EmptyCell.self, forCellReuseIdentifier: "EmptyCell")
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
        addSubview(backButton)
        [topNavigation, tableView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self).inset(48.toScreen)
            make.left.right.bottom.equalTo(self)
        }
        tableView.snp.makeConstraints { make in
            make.width.equalTo(0.screenWight)
        }
        topNavigation.snp.makeConstraints { make in
            make.width.equalTo(0.screenWight - 32)
            make.left.equalTo(self).inset(32)
        }
        backButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(topNavigation).inset(-24)
            make.left.equalTo(self).inset(6)
            make.width.equalTo(24)
        }
    }
    
    @objc
    func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if false {
            return 6
        }
        if section == 0 {
            return 1
        }
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if false {
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "OfferItemCell", for: indexPath) as! OfferItemCell
                    cell.backView.backgroundColor = .backColor
                    cell.rightIcon.isHidden = true
                    cell.titleLabel.font = .appFont(ofSize: 18, weight: .semibold)
                    cell.titleLabel.text = LyricsManager.getLyrics(type: .popularOffers)
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "OfferItemCell", for: indexPath) as! OfferItemCell
                    if indexPath.row == 1 { cell.cellType = .top }
                    if indexPath.row == 5 { cell.cellType = .bottom }
                    cell.titleLabel.text = "some text"
                    return cell
                }
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyCell
                
            return cell
        } else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "OfferItemCell", for: indexPath) as! OfferItemCell
                cell.backView.backgroundColor = .backColor
                cell.rightIcon.isHidden = true
                cell.titleLabel.font = .appFont(ofSize: 18, weight: .semibold)
                cell.titleLabel.text = LyricsManager.getLyrics(type: .popularOffers)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "OfferItemCell", for: indexPath) as! OfferItemCell
                if indexPath.row == 1 { cell.cellType = .top }
                if indexPath.row == 5 { cell.cellType = .bottom }
                cell.titleLabel.text = "some text"
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


