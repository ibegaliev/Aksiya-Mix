//
//  TopSelectableView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 17/02/24.
//

import UIKit

class TopSelectableView: UIView {
    
    lazy var layout: UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .horizontal
        return lay
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .backColor
        cv.delegate = self
        cv.dataSource = self
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        cv.register(TopSelectableCell.self, forCellWithReuseIdentifier: "TopSelectableCell")
        return cv
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
        addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.height.equalTo(48)
        }
    }
    
}

extension TopSelectableView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSelectableCell", for: indexPath) as! TopSelectableCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: collectionView.frame.height-20)
    }
    
}

class TopSelectableCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "value here!"
        lbl.font = .appFont(ofSize: 12, weight: .medium)
        return lbl
    }()
    
    lazy var icon: UIButton = {
        let btn = UIButton()
        btn.setImage(.closeX, for: .normal)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 2
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
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
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 4
        
        contentView.addSubview(mainStack)
        [titleLabel, icon].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(2)
            make.left.right.equalTo(contentView).inset(4)
        }
        icon.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
    }
    
}
