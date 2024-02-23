//
//  ItemsCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit

class ItemsCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Новинки"
        lbl.font = .appFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .horizontal
        lay.minimumLineSpacing = 10
        return lay
    }()

    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(SingleProductCell.self, forCellWithReuseIdentifier: "SingleProductCell")
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        return collection
    }()
    
    lazy var stack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.alignment = .center
        st.spacing = 12
        return st
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
        contentView.addSubview(stack)
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        [titleLabel, collectionView].forEach { item in
            stack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
        }
        collectionView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView)
        }
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleProductCell", for: indexPath) as! SingleProductCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: 160.toScreen,
            height: collectionView.frame.height
        )
    }

    
}
