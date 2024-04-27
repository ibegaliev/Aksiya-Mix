//
//  DatedMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/04/24.
//

import UIKit

class DatedMarketCell: UITableViewCell, DatesMarketItemsDelegate {
    
    var delegate: DatesMarketItemsDelegate?

    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ish vaqti:"
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var selectableView: DatesMarketItems = {
        let view = DatesMarketItems()
        view.delegate = self
        return view
    }()
        
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.backgroundColor = .backColor
        contentView.addSubview(mainStack)
        [titleLabel, selectableView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView).inset(16)
        }
    }
        
    func setbeginData(data: Int) {
        delegate?.setbeginData(data: data)
    }
    
    func setendData(data: Int) {
        delegate?.setendData(data: data)
    }
    
    func setbeginTime(data: String) {
        delegate?.setbeginTime(data: data)
    }
    
    func setendTime(data: String) {
        delegate?.setendTime(data: data)
    }

    
}

protocol DatesMarketItemsDelegate {
    func setbeginData(data: Int)
    func setendData(data: Int)
    func setbeginTime(data: String)
    func setendTime(data: String)
}

class DatesMarketItems: UIView {
    
    var delegate: DatesMarketItemsDelegate?
    
    lazy var beginData: UIButton = {
        let item = UIButton()
        item.setTitle("Du", for: .normal)
        item.setTitleColor(.placeholderText, for: .normal)
        item.titleLabel?.font = .appFont(ofSize: 14, weight: .semibold)
        item.backgroundColor = .white
        item.layer.cornerRadius = 8
        return item
    }()
    
    lazy var endData: UIButton = {
        let item = UIButton()
        item.setTitle("Ju", for: .normal)
        item.setTitleColor(.placeholderText, for: .normal)
        item.titleLabel?.font = .appFont(ofSize: 14, weight: .semibold)
        item.backgroundColor = .white
        item.layer.cornerRadius = 8
        return item
    }()
    
    lazy var beginTime: UIButton = {
        let item = UIButton()
        item.setTitle("09:00", for: .normal)
        item.setTitleColor(.placeholderText, for: .normal)
        item.titleLabel?.font = .appFont(ofSize: 14, weight: .semibold)
        item.backgroundColor = .white
        item.layer.cornerRadius = 8
        return item
    }()
    
    lazy var endTime: UIButton = {
        let item = UIButton()
        item.setTitle("21:00", for: .normal)
        item.setTitleColor(.placeholderText, for: .normal)
        item.titleLabel?.font = .appFont(ofSize: 14, weight: .semibold)
        item.backgroundColor = .white
        item.layer.cornerRadius = 8
        return item
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.distribution = .fillEqually
        stack.alignment = .fill
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        beginDataAction()
        endDataAction()
        beginTimeAction()
        endTimeAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(mainStack)
        [beginData, endData, beginTime, endTime].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.height.equalTo(36)
        }
    }
    
    func beginDataAction() {
        var actions = [UIAction]()
        for day in ["Du", "Se", "Cho", "Pa", "Ju", "Sha", "Yak"].enumerated() {
            let action = UIAction(title: day.element) { [self] action in
                beginData.setTitle(day.element, for: .normal)
                delegate?.setbeginData(data: day.offset)
            }
            actions.append(action)
        }
        let menu = UIMenu(title: "", children: actions)
        beginData.menu = menu
        beginData.showsMenuAsPrimaryAction = true
    }

    func endDataAction() {
        var actions = [UIAction]()
        for day in ["Du", "Se", "Cho", "Pa", "Ju", "Sha", "Yak"].enumerated() {
            let action = UIAction(title: day.element) { [self] action in
                endData.setTitle(day.element, for: .normal)
                delegate?.setendData(data: day.offset)
            }
            actions.append(action)
        }
        let menu = UIMenu(title: "", children: actions)
        endData.menu = menu
        endData.showsMenuAsPrimaryAction = true
    }

    func beginTimeAction() {
        var actions = [UIAction]()
        [
            "0:00",
            "0:30",
            "1:00",
            "1:30",
            "2:00",
            "2:30",
            "3:00",
            "3:30",
            "4:00",
            "4:30",
            "5:00",
            "5:30",
            "6:00",
            "6:30",
            "7:00",
            "7:30",
            "8:00",
            "8:30",
            "9:00",
            "9:30",
            "10:00",
            "10:30",
            "11:00",
            "11:30",
            "12:00",
            "12:30",
            "13:00",
            "13:30",
            "14:00",
            "14:30",
            "15:00",
            "15:30",
            "16:00",
            "16:30",
            "17:00",
            "17:30",
            "18:00",
            "18:30",
            "19:00",
            "19:30",
            "20:00",
            "20:30",
            "21:00",
            "21:30",
            "22:00",
            "22:30",
            "23:00",
            "23:30"
        ].forEach { item in
            let action = UIAction(title: item) { [self] action in
                beginTime.setTitle(item, for: .normal)
                delegate?.setbeginTime(data: item)
            }
            actions.append(action)
        }
        let menu = UIMenu(title: "", children: actions)
        beginTime.menu = menu
        beginTime.showsMenuAsPrimaryAction = true
    }
    
    func endTimeAction() {
        var actions = [UIAction]()
        [
            "0:00",
            "0:30",
            "1:00",
            "1:30",
            "2:00",
            "2:30",
            "3:00",
            "3:30",
            "4:00",
            "4:30",
            "5:00",
            "5:30",
            "6:00",
            "6:30",
            "7:00",
            "7:30",
            "8:00",
            "8:30",
            "9:00",
            "9:30",
            "10:00",
            "10:30",
            "11:00",
            "11:30",
            "12:00",
            "12:30",
            "13:00",
            "13:30",
            "14:00",
            "14:30",
            "15:00",
            "15:30",
            "16:00",
            "16:30",
            "17:00",
            "17:30",
            "18:00",
            "18:30",
            "19:00",
            "19:30",
            "20:00",
            "20:30",
            "21:00",
            "21:30",
            "22:00",
            "22:30",
            "23:00",
            "23:30"
        ].forEach { item in
            let action = UIAction(title: item) { [self] action in
                endTime.setTitle(item, for: .normal)
                delegate?.setendTime(data: item)
            }
            actions.append(action)
        }
        let menu = UIMenu(title: "", children: actions)
        endTime.menu = menu
        endTime.showsMenuAsPrimaryAction = true
    }

}
