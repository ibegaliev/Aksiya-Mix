//
//  AddNewMarketView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/04/24.
//

import UIKit

class AddNewMarketView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()

    lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.delegate = self
        collection.dataSource = self
        collection.contentInset = .init(top: -50, left: 0, bottom: 0, right: 0)
        collection.isPagingEnabled = true
        collection.bouncesZoom = false
        collection.bounces = false
        collection.alwaysBounceVertical = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .backColor
        collection.register(MarketBannerCell.self, forCellWithReuseIdentifier: "MarketBannerCell")
        return collection
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
        addSubview(collectionView)
        addSubview(navigationView)
    }
    
    private func setConstraints() {
        navigationView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(100)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp_bottomMargin).inset(-8)
            make.left.right.bottom.equalTo(self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketBannerCell", for: indexPath) as! MarketBannerCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
