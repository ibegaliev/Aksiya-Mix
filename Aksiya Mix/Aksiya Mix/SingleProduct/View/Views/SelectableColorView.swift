//
//  SelectableColorView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/2/24.
//

import UIKit

class SelectableColorView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var title: String? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .vertical
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .spacetext
        return label
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(SelectableColorCell.self, forCellWithReuseIdentifier: "SelectableColorCell")
        return cv
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout()
        
        return lay
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setCOnstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(mainStack)
        
        [titleLabel, collectionView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setCOnstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(0.screenWight - 32)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectableColorCell", for: indexPath) as! SelectableColorCell
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 40, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        4
    }
    
}

class SelectableColorCell: UICollectionViewCell {

    lazy var colorView: UIView = {
        let color = UIView()
        color.backgroundColor = .systemTeal
        color.layer.cornerRadius = 4
        return color
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setCOnstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {

        contentView.layer.cornerRadius = 4
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.spaceLine.cgColor
        contentView.layer.borderWidth = 1
        
        contentView.addSubview(colorView)
    }
    
    private func setCOnstraints() {
        colorView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(2)
        }
    }

}

