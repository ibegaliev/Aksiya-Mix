//
//  UserNamesCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/03/24.
//

import UIKit

class UserNamesCell: UITableViewCell {
    
    var userdata: UserData? {
        didSet {
            topView.nameLabel.text = userdata?.fullname
            topView.numberLabel.text = userdata?.phone_number
        }
    }
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    lazy var topView: UserNamesTopView = {
        let view = UserNamesTopView()
        view.nameLabel.text = userdata?.fullname
        view.numberLabel.text = userdata?.phone_number
        return view
    }()
    
    lazy var bottomView: UserMarketView = {
        let view = UserMarketView()
        
        return view
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
        backgroundColor = .backColor
        addSubview(mainStack)
        [topView, bottomView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(0)
            make.left.right.equalTo(self).inset(16)
        }
    }
    
}

class UserMarketView: UIView {
    
    lazy var mainIcon: UIImageView = {
        let ic = UIImageView()
        ic.contentMode = .center
        ic.backgroundColor = .backBlue
        ic.layer.cornerRadius = 6
        ic.clipsToBounds = true
        ic.image = .shoppingBag
        return ic
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 12, weight: .medium)
        lbl.numberOfLines = 0
        lbl.text = LyricsManager.getLyrics(type: .descriptionAddStore)
        return lbl
    }()
    
    lazy var button: BlueButton = {
        let btn = BlueButton()
        btn.setTitle(LyricsManager.getLyrics(type: .addStore), for: .normal)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    lazy var topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
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
        backgroundColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(mainStack)
        [topStack, button].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [mainIcon, titleLabel].forEach { item in
            topStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
        mainIcon.snp.makeConstraints { make in
            make.height.width.equalTo(40.toScreen)
        }
    }
    
}

class UserNamesTopView: UIView {
    
    lazy var mainImage: UIImageView = {
        let img = UIImageView()
        img.image = .instaIcon
        img.layer.borderColor = UIColor.spacetext.cgColor
        img.layer.borderWidth = 1
        img.layer.cornerRadius = 70.toScreen/2
        img.clipsToBounds = true
        return img
    }()

    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 22, weight: .bold)
        return lbl
    }()
    
    lazy var numberLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 12, weight: .medium)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 12
        return stack
    }()

    lazy var titlesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
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
        addSubview(mainStack)
        [mainImage, titlesStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [nameLabel, numberLabel].forEach { item in
            titlesStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        mainImage.snp.makeConstraints { make in
            make.width.height.equalTo(70.toScreen)
        }
    }
    
}
