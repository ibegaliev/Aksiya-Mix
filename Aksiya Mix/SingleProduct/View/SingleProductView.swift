//
//  SingleProductView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

class SingleProductView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var layout: UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout()
        
        return lay
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.bounces = true
        view.contentInset = .init(top: -5, left: 0, bottom: 50, right: 0)
        view.register(SingleTopCell.self, forCellWithReuseIdentifier: "SingleTopCell")
        view.backgroundColor = .backColor
        return view
    }()
    
    lazy var topNavigation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    lazy var navigationView: UIView = {
        let view = SingleNavigationVIew()

        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        backgroundColor = .backColor
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(collectionView)
        addSubview(navigationView)
        addSubview(topNavigation)
    }
    
    private func setConstraints() {
        
        topNavigation.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(50)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
        
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(self).inset(44)
            make.left.right.equalTo(self)
        }

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleTopCell", for: indexPath) as! SingleTopCell
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            CGSize(
                width: collectionView.frame.width,
                height: 875.toScreen
            )
        } else {
            CGSize(width: 0, height: 0)
        }
    }
    
}
