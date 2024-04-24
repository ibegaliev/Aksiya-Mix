//
//  ProfileNumberEditCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 20/04/24.
//

import UIKit

protocol ProfileNumberEditCellDelegate {
    func sentNewName(number: String?)
}

class ProfileNumberEditCell: UITableViewCell, UITextFieldDelegate {
    
    var delegate: ProfileNumberEditCellDelegate?
    
    var title: String? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var placeholder: String? {
        get {
            return nil
        }
        set {
            
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 14, weight: .semibold)
        return lbl
    }()
    
    lazy var itemView: InputNumberView = {
        let view = InputNumberView()
        view.backgroundColor = .white
        return view
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
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        selectionStyle = .none
        backgroundColor = .backColor
        
        contentView.addSubview(mainStack)
        [titleLabel, itemView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView).inset(16)
        }
    }
    
}

