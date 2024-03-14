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
    
//    lazy var titleLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.font = .appFont(ofSize: 18, weight: .bold)
//        lbl.textColor = .spacetext
//        lbl.text = "MAXSUS TAKLIFLAR"
//        return lbl
//    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.register(OfferItemsCell.self, forCellReuseIdentifier: "OfferItemsCell")
        tv.showsVerticalScrollIndicator = false
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
        addSubview(mainStack)
//        [titleLabel, tableView].forEach { item in
        [tableView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self).inset(8)
            make.left.right.bottom.equalTo(self)
        }
//        titleLabel.snp.makeConstraints { make in
//            make.width.equalTo(0.screenWight - 32)
//        }
        tableView.snp.makeConstraints { make in
            make.width.equalTo(0.screenWight)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OfferItemsCell", for: indexPath) as! OfferItemsCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label : UILabel = UILabel()
        label.font = .appFont(ofSize: 18, weight: .bold)
        label.textColor = .spacetext
        label.backgroundColor = .white
        
        if section == 0 {
            label.text = "   Yaqinda ko'rilganlar"
        } else {
            label.text = "   Maxsus takliflar"
        }
        
        return label
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
