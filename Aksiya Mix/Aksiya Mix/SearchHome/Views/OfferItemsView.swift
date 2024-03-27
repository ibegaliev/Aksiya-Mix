//
//  OfferItemsView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 16/02/24.
//

import UIKit

class OfferItemsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var topSelectableView: TopSelectableView = {
        let view = TopSelectableView()

        return view
    }()
    
    lazy var showResultView: ShowResultView = {
        let view = ShowResultView()
        
        return view
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .vertical
        return lay
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .backColor
        cv.delegate = self
        cv.dataSource = self
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 4, left: 12, bottom: 50.toScreen, right: 12)
        cv.register(SingleProductCell.self, forCellWithReuseIdentifier: "SingleProductCell")
        return cv
    }()

    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
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
        backgroundColor = .backColor
        addSubview(mainStack)
        [topSelectableView, showResultView, collectionView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self).inset(50.toScreen)
            make.left.right.bottom.equalTo(self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleProductCell", for: indexPath) as! SingleProductCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (0.screenWight-36)/2, height: 250.toScreen)
    }
    
}
