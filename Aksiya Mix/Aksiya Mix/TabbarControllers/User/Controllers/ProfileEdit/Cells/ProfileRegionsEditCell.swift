//
//  ProfileRegionsEditCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 20/04/24.
//

import UIKit

class ProfileRegionsEditCell: UITableViewCell, ProfileEditItemSelectableViewDelegate {
    
    lazy var provinceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Viloyatni tanlang"
        lbl.font = .appFont(ofSize: 14, weight: .semibold)
        return lbl
    }()
    
    lazy var provinceSelectableView: ProfileEditItemSelectableView = {
        let view = ProfileEditItemSelectableView()
        view.provinceAdded()
        view.delegate = self
        view.placeholder = "Tanlang"
        view.birthDatePicker.isHidden = true
        return view
    }()

    lazy var regionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Tumanni tanlang"
        lbl.font = .appFont(ofSize: 14, weight: .semibold)
        return lbl
    }()
    
    lazy var regionSelectableView: ProfileEditItemSelectableView = {
        let view = ProfileEditItemSelectableView()
        view.placeholder = "Tanlang"
        view.birthDatePicker.isHidden = true
        return view
    }()

    lazy var provinceStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        return stack
    }()
    
    lazy var regionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        return stack
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
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
        [provinceStack, regionStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [provinceLabel, provinceSelectableView].forEach { item in
            provinceStack.addArrangedSubview(item)
        }
        [regionLabel, regionSelectableView].forEach { item in
            regionStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView).inset(16)
        }
    }
    
    func tapped() {
        
    }
    
    func selectedRegion(id: Int?) {
        regionSelectableView.regionAdded(id: id)
    }

    
}
