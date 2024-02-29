//
//  BannerCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

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

class BannerItemCell: UICollectionViewCell {
    
    var data: BannerData? {
        get {
            return nil
        }
        set {
            guard let newValue else { return }
            imageView.image = newValue.image
//            if newValue.isShow {
//                UIView.animate(withDuration: 0.1) { [self] in
//                    imageView.transform = .identity
//                }
//            } else {
//                UIView.animate(withDuration: 0.1) { [self] in
//                    imageView.transform = CGAffineTransform(
//                        scaleX: 0.8,
//                        y: 1
//                    )
//                }
//            }
        }
    }
        
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
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
        contentView.backgroundColor = .backColor
        contentView.addSubview(imageView)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }

    
}
