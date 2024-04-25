//
//  CreateButtonMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/04/24.
//

import UIKit

protocol CreateButtonMarketCellDelegate {
    func saveTapped()
}

class CreateButtonMarketCell: UITableViewCell {
    
    var delegate: CreateButtonMarketCellDelegate?
    
    lazy var mainButton: BlueButton = {
        let btn = BlueButton()
        btn.setHeight()
        btn.setBorder()
        btn.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        btn.setTitle("Create", for: .normal)
        return btn
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
        
        contentView.backgroundColor = .backColor
        contentView.addSubview(mainButton)
    }
    
    private func setConstraints() {
        mainButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView).inset(16)
        }
    }
    
    @objc
    func saveTapped() {
        delegate?.saveTapped()
    }
    
}
