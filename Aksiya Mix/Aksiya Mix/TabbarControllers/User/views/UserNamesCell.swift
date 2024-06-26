//
//  UserNamesCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/03/24.
//

import UIKit
import Lottie

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

    lazy var mainIcon: LottieAnimationView = {
        let ic = LottieAnimationView(name: "CreateNewMarket")
        ic.loopMode = .loop
        ic.clipsToBounds = true
        ic.layer.cornerRadius = 6
        ic.backgroundColor = .backBlue
        ic.contentMode = .scaleAspectFit
        ic.play()
        return ic
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        lbl.numberOfLines = 0
        lbl.text = LyricsManager.getLyrics(type: .descriptionAddStore)
        return lbl
    }()
    
    lazy var addStoreLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .selectBlue
        lbl.font = .appFont(ofSize: 14, weight: .bold)
        lbl.text = LyricsManager.getLyrics(type: .addStore)
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 12
        return stack
    }()

    lazy var topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .fill
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
        [mainIcon, topStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [titleLabel, addStoreLabel].forEach { item in
            topStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
        mainIcon.snp.makeConstraints { make in
            make.height.width.equalTo(70.toScreen)
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
