//
//  CompanyBottomItems.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 09/03/24.
//

import UIKit

//protocol ItemsCellDelegate {
//    func didSelectItematIndex(index: Int?)
//}

class CompanyBottomItems: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: ItemsCellDelegate?
        
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
        st.alignment = .fill
        st.spacing = 12
        return st
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.addSubview(stack)
        [collectionView].forEach { item in
            stack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(8)
            make.left.right.bottom.equalTo(contentView)
        }
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(220.toScreen)
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItematIndex(index: indexPath.row)
    }
    
}
