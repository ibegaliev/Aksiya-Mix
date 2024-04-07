//
//  TopSelectableView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 17/02/24.
//

import UIKit

struct TopSelectableDM {
    var name: String
    var image: UIImage
}

protocol TopSelectableDelegate {
    func filterTapped()
}

class TopSelectableView: UICollectionViewCell {
    
    var delegate: TopSelectableDelegate?
    
    let data: [TopSelectableDM] = [
        TopSelectableDM(name: "Filtr", image: .filterLines),
        TopSelectableDM(name: "Barcha toifalar", image: .closeX),
        TopSelectableDM(name: "Ташкент", image: .closeX),
        TopSelectableDM(name: "Valyuta: UZS", image: .closeX)
    ]
    
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
        cv.contentInset = UIEdgeInsets(top: 4, left: 16, bottom: 0, right: 50)
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
        contentView.addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(-12)
        }
    }
    
}

extension TopSelectableView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSelectableCell", for: indexPath) as! TopSelectableCell
        cell.titleLabel.text = data[indexPath.row].name
        cell.icon.setImage(data[indexPath.row].image, for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: data[indexPath.row].name.widthOfString(
                usingFont: .appFont(ofSize: 14, weight: .medium)
            ) + 44,
            height: collectionView.frame.height-6
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            delegate?.filterTapped()
        }
    }
    
}

class TopSelectableCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    lazy var icon: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(.filterLines, for: .normal)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 2
        stack.alignment = .center
        stack.distribution = .fill
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
        contentView.layer.cornerRadius = 6
        contentView.clipsToBounds = true
        
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
