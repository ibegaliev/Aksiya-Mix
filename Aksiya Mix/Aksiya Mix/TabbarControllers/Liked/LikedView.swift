//
//  LikedView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/02/24.
//

import UIKit

protocol LikedViewDelegate {
    func selectedSaved()
    func selectedSeen()
    func selectedended()
}

class LikedView: UIView, LikedSordsViewDelegate {
    
    var delegate: LikedViewDelegate?
    
    var selectedItem: Int? {
        get {
            return nil
        }
        set {
            headerView.selectedItem = newValue
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        lbl.text = LyricsManager.getLyrics(type: .departaments)
        return lbl
    }()
    
    lazy var headerView: LikedSordsView = {
        let view = LikedSordsView()
        view.delegate = self
        view.backgroundColor = .white
        return view
    }()
    
    lazy var collectionView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .systemTeal
        return cv
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
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
        [headerView, collectionView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        headerView.snp.makeConstraints { make in
            make.height.equalTo(120)
        }
    }
    
    func selectedSaved() {
        delegate?.selectedSaved()
    }
    
    func selectedSeen() {
        delegate?.selectedSeen()
    }
    
    func selectedended() {
        delegate?.selectedended()
    }
    
}

class LikedCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
