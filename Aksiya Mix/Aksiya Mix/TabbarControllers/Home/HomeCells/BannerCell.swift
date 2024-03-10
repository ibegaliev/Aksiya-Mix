//
//  BannerCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
//    lazy var collectionView: UICollectionView = {
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
//        collection.delegate = self
//        collection.dataSource = self
//        collection.scrollsToTop = false
//        
//        return collection
//    }()
    
    lazy var collectionLayout: BannerViewFlowLayout = {
        let layout = BannerViewFlowLayout()
//        layout.isZoom = self.isZoom
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
//        layout.itemSize = CGSize(width: self.itemWidth, height: self.bounds.height)
        return layout
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
    }
    
    private func setConstraints() {
        
    }
        
}

class BannerViewFlowLayout: UICollectionViewFlowLayout {

    public var isZoom:Bool = false
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    override func prepare() {
        super.prepare()
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let tmps = super.layoutAttributesForElements(in: rect)
        if !self.isZoom {
            return tmps
        }
        let centerX = (self.collectionView?.contentOffset.x ?? 0) + (self.collectionView?.bounds.size.width ?? 0) * 0.5
        if tmps == nil {
            return tmps
        }
        for attributes in tmps! {
            let centerDistance = abs(attributes.center.x - centerX)
            let scale = 1.0 / (1 + centerDistance * 0.001)
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        return tmps
    }
    
}
