//
//  ShowResultView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 17/02/24.
//

import UIKit

protocol ShowResultViewDelegate {
    
}

class ShowResultView: UICollectionViewCell {
    
    var delegate: ShowResultViewDelegate?
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "23ta na'tija topildi"
        lbl.font = .appFont(ofSize: 14, weight: .semibold)
        return lbl
    }()
    
    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.setImage(.switchVertical, for: .normal)
        
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let lbl = UIButton()
        lbl.tintColor = .black
        lbl.setImage(.layoutGrid, for: .normal)
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var rightStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 24
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        changeButtonAddMenu()
        rightButtonAddMenu()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.addSubview(mainStack)
        [titleLabel, rightStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [changeButton, rightButton].forEach { item in
            rightStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView)
            make.left.right.equalTo(contentView)
        }
        changeButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
    }
    
    private func changeButtonAddMenu() {
        let action1 = UIAction(title: "Hammasi") { action in
            print("action1111")
        }
        let action2 = UIAction(title: "Eng arzoni") { action in
            print("action2222")
        }
        let action3 = UIAction(title: "Eng qimmati") { action in
            print("action3333")
        }
        let action4 = UIAction(title: "Boshqa chegirmalar") { action in
            print("action4444")
        }

        if #available(iOS 15.0, *) {
            let menu = UIMenu(title: "", options: .singleSelection, children: [action1, action2, action3, action4])
            changeButton.menu = menu
            changeButton.showsMenuAsPrimaryAction = true
        } else {
            let menu = UIMenu(title: "", children: [action1, action2, action3, action4])
            changeButton.menu = menu
            changeButton.showsMenuAsPrimaryAction = true
        }
    }
    
    private func rightButtonAddMenu() {
        let action1 = UIAction(title: "Mozaika", image: .layoutGrid) { [self] action in
            rightButton.setImage(.layoutGrid, for: .normal)
        }
        let action2 = UIAction(title: "Ro'yhat", image: .viewList) { [self] action in
            rightButton.setImage(.viewList, for: .normal)
        }

        if #available(iOS 15.0, *) {
            let menu = UIMenu(title: "", options: .singleSelection, children: [action1, action2])
            rightButton.menu = menu
            rightButton.showsMenuAsPrimaryAction = true
        } else {
            let menu = UIMenu(title: "", children: [action1, action2])
            rightButton.menu = menu
            rightButton.showsMenuAsPrimaryAction = true
        }
        
    }
    
}
