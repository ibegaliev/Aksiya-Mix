//
//  BannerCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

//https://github.com/Coder-TanJX/JXBanner

import UIKit

struct BannerData {
    let isShow: Bool
    let image: UIImage
}

class BannerCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data: [BannerData] = [
        BannerData(isShow: false, image: .samsungAd),
        BannerData(isShow: true, image: .marketAd),
        BannerData(isShow: false, image: .yandexAd)
    ]
    
    lazy var collectionView: UICollectionView = { [self] in
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutCollection)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .backColor
        collection.contentInset = UIEdgeInsets(top: 12, left: 16, bottom: 0, right: 12)
        collection.register(BannerItemCell.self, forCellWithReuseIdentifier: "BannerItemCell")
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        return collection
    }()
    
    lazy var layoutCollection: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setUI()
//        setConstraints()
//        reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    private func reloadData() {
        if data.count == 1 {
            
        } else if data.count == 2 {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerItemCell", for: indexPath) as! BannerItemCell
        cell.data = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if data[indexPath.row].isShow {
            return CGSize(width: collectionView.frame.width - 52, height: collectionView.frame.height - 12)
        } else {
            return CGSize(width: collectionView.frame.width - 52, height: collectionView.frame.height - 35)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}
