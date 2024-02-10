//
//  TypesCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit

class TypesCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Разделы"
        lbl.font = .boldSystemFont(ofSize: 16)
        
        return lbl
    }()
    
    lazy var rightButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Все", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.setTitleColor(.selectBlue, for: .normal)
        return btn
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .spaceLine
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(TypeCell.self, forCellWithReuseIdentifier: "TypeCell")
        cv.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        return cv
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .horizontal
        lay.minimumLineSpacing = 10
        return lay
    }()

    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    lazy var titleStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.spacing = 12
        stack.alignment = .fill
        return stack
    }()
    
    lazy var collectionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
 
    private func setUI() {
        
        contentView.addSubview(mainStack)
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        [titleStack, collectionStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [lineView, collectionView].forEach { item in
            collectionStack.addArrangedSubview(item)
        }
        
        [titleLabel, rightButton].forEach { item in
            titleStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(8)
            make.left.right.equalTo(self)
        }
        
        titleStack.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(16)
        }
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.right.equalTo(self).inset(16)
        }
        collectionView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeCell", for: indexPath) as! TypeCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/4, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        14
    }
    
}
