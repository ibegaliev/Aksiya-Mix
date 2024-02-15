//
//  OfferView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 15/02/24.
//

import UIKit

class OfferView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        lbl.textColor = .spacetext
        lbl.text = "MAXSUS TAKLIFLAR"
        return lbl
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
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
        backgroundColor = .backColor
        
        addSubview(mainStack)
        [titleLabel, tableView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self).inset(8)
            make.left.right.bottom.equalTo(self)
        }
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(0.screenWight - 32)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }

    
}
