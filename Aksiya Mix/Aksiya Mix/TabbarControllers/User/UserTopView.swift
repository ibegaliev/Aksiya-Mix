//
//  UserTopView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 19/02/24.
//

import UIKit
import SnapKit

class UserTopView: UITableViewCell {
    
    lazy var topView: UserTopImageView = {
        let view = UserTopImageView()
        
        return view
    }()
    
    lazy var titleView: UILabel = {
        let lbl = UILabel()
        lbl.text = "AksiyaMixga xush kelibsiz!"
        lbl.font = .appFont(ofSize: 24, weight: .bold)
        return lbl
    }()
    
    lazy var descripLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Xabar yuborish va qabul gilish, yangi e'lonlar joylash va o'zingiz yoqtirgan e'lonlar va saqlangan gidiruvlarni qayta ko rib chiqish uchun tizimga kiring. Bir necha daqiqada profil oching."
        lbl.textColor = .spacetext
        lbl.font = .appFont(ofSize: 12, weight: .regular)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var blueButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitle(LyricsManager.getLyrics(type: .log), for: .normal)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 16
        return stack
    }()
    
    lazy var labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 4
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
        
        addSubview(mainStack)
        [topView, labelsStack, blueButton].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [titleView, descripLabel].forEach { item in
            labelsStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(12)
            make.left.right.equalTo(self).inset(16)
        }
    }
    
}

class UserTopImageView: UIView {
    
    var image: UIImage?
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = .personImagee
        return image
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
        addSubview(imageView)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.bottom.left.equalTo(self)
        }
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(75)
        }
    }

}
