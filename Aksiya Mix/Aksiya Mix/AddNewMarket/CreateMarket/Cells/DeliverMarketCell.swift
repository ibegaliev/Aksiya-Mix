//
//  DeliverMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/04/24.
//

import UIKit

protocol DeliverMarketCellDelegate {
    func isHaveDelivery(isHave: Bool?)
}

class DeliverMarketCell: UITableViewCell, DeliverMarketCellDelegate {
    
    var delegate: DeliverMarketCellDelegate?
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Yetkazib berish"
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var selectableView: DeliverMarketSelectableView = {
        let view = DeliverMarketSelectableView()
        view.delegate = self
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .leading
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
    
    func isHaveDelivery(isHave: Bool?) {
        delegate?.isHaveDelivery(isHave: isHave)
    }
    
}

class DeliverMarketSelectableView: UIView {
    
    var delegate: DeliverMarketCellDelegate?
    
    lazy var yesButton: BlueButton = {
        let btn = BlueButton()
        btn.backgroundColor = .white
        btn.setTitle("Ha", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        btn.addTarget(self, action: #selector(uzsTapped), for: .touchUpInside)
        btn.setTitleColor(.selectBlue, for: .normal)
        return btn
    }()
    
    lazy var noButton: BlueButton = {
        let btn = BlueButton()
        btn.backgroundColor = .white
        btn.setTitle("Yo'q", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        btn.addTarget(self, action: #selector(usdTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 6
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
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
        addSubview(buttonsStack)
        [yesButton, noButton].forEach { item in
            buttonsStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        buttonsStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(4)
            make.left.right.equalTo(self)
        }
        yesButton.snp.makeConstraints { make in
            make.height.equalTo(40.toScreen)
            make.width.equalTo(100.toScreen)
        }
    }
    
    @objc
    private func uzsTapped() {
        delegate?.isHaveDelivery(isHave: true)
        yesButton.backgroundColor = .selectBlue
        yesButton.setTitleColor(.white, for: .normal)
        
        noButton.backgroundColor = .white
        noButton.setTitleColor(.selectBlue, for: .normal)
    }
    
    @objc
    private func usdTapped() {
        delegate?.isHaveDelivery(isHave: false)
        yesButton.backgroundColor = .white
        yesButton.setTitleColor(.selectBlue, for: .normal)
        
        noButton.backgroundColor = .selectBlue
        noButton.setTitleColor(.white, for: .normal)
    }

    
}

