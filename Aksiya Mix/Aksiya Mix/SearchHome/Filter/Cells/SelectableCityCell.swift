//
//  SelectableCityCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/04/24.
//

import UIKit

protocol SelectableCityCellDelegate {
    func selectCityTapped()
}

class SelectableCityCell: UICollectionViewCell {
    
    var delegate: SelectableCityCellDelegate?
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Shaharni tanlang"
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var categoryView: SelectableCityItem = {
        let cell = SelectableCityItem()
        cell.title = "Toshkent"
        cell.backView.backgroundColor = .white
        cell.addTarget(self, action: #selector(selectTapped), for: .touchUpInside)
        return cell
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 12
        stack.axis = .vertical
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
        contentView.backgroundColor = .backColor
        contentView.addSubview(mainStack)
        [titleLabel, categoryView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView)
        }
    }
    
    @objc
    func selectTapped() {
        delegate?.selectCityTapped()
    }
    
}

class SelectableCityItem: UIButton {
    
    var title: String? {
        get {
            return nil
        }
        set {
            titlesLabel.text = newValue
        }
    }
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .backColor
        return view
    }()
        
    lazy var titlesLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var chevronImage: UIImageView = {
        let img = UIImageView()
        img.image = .chevronRight
        return img
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()

    lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.alignment = .center
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
        
        addSubview(backView)
        backView.addSubview(mainStack)
        [leftStack, chevronImage].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [titlesLabel].forEach { item in
            leftStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        
        backView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(backView).inset(12)
        }
        
        chevronImage.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        
    }
    
}

struct Province: Codable {
    let id: String
    let dbId: String?
    let createdAt: String
    let createdBy: String
    let isDeleted: Bool
    let parentId: String?
    let hierarchyKey: String?
    let type: String
    let nameRu: String
    let nameUz: String
    let countryId: String
    let orderIndex: Int
    let names: Names
    let postalId: Int
    let nameUzLatn: String
    let soato: String
    let hidden: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case dbId = "db_id"
        case createdAt = "created_at"
        case createdBy = "created_by"
        case isDeleted = "is_deleted"
        case parentId = "parent_id"
        case hierarchyKey = "hierarchy_key"
        case type
        case nameRu = "name_ru"
        case nameUz = "name_uz"
        case countryId = "country_id"
        case orderIndex = "order_index"
        case names
        case postalId = "postal_id"
        case nameUzLatn = "name_uz_latn"
        case soato
        case hidden
    }
}

struct Names: Codable {
    let qq: String
    let ru: String
    let uz: String
    let uzCyr: String
    
    enum CodingKeys: String, CodingKey {
        case qq
        case ru
        case uz
        case uzCyr = "uz_cyr"
    }
}
