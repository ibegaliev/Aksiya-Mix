//
//  LikedSordsView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/02/24.
//

import UIKit

protocol LikedSordsViewDelegate {
    func selectedSaved()
    func selectedSeen()
    func selectedended()
}

class LikedSordsView: UIView, LikedSordsItemDelegate {
    
    var delegate: LikedSordsViewDelegate?
    
    var selectedItem: Int? {
        get {
            return nil
        }
        set {
            guard let newValue else { return }
            let items = [savedView, seenView, endedView]
            items.forEach { item in
                item.isSelect = false
            }
            items[newValue].isSelect = true
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        lbl.text = LyricsManager.getLyrics(type: .departaments)
        return lbl
    }()
    
    lazy var savedView: LikedSordsItem = {
        let view = LikedSordsItem()
        view.title = "Saralanganlar"
        view.delegate = self
        view.tag = 0
        return view
    }()

    lazy var seenView: LikedSordsItem = {
        let view = LikedSordsItem()
        view.title = "Yaqinda ko'rilganlar"
        view.delegate = self
        view.tag = 1
        return view
    }()

    lazy var endedView: LikedSordsItem = {
        let view = LikedSordsItem()
        view.title = "Tugagan e'lonlar"
        view.delegate = self
        view.tag = 2
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
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
        [savedView, seenView, endedView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        addSubview(titleLabel)
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.right.equalTo(self).inset(8)
        }
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(mainStack.snp_topMargin).inset(-10)
            make.left.right.equalTo(self).inset(16)
        }
    }
    
    func selected(tag: Int) {
        if tag == 0 {
            delegate?.selectedSaved()
        } else if tag == 1 {
            delegate?.selectedSeen()
        } else if tag == 2 {
            delegate?.selectedended()
        }
    }

    
}
