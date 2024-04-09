//
//  SingleCategoryView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

protocol SingleCategoryViewDelegate {
    func selectCategory(index: Int)
    
    func subCategorySelected(childs: [SubCategoryDM]?, categoryData: CategoryModel?)
    func chilCategorySelected(selectedChild: SubCategoryDM?)
}

class SingleCategoryView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: SingleCategoryViewDelegate?
    
    var categoryData: CategoryModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var subData: [CategoryDM]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var childData: [SubCategoryDM]? {
        didSet {
            tableView.reloadData()
        }
    }
        
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .backColor
        tv.separatorStyle = .none
        tv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 50, right: 0)
        tv.register(CategoryCell.self, forCellReuseIdentifier: "CategoryCell")
        return tv
    }()
    
    lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        lbl.text = LyricsManager.getLyrics(type: .selectDepartaments)
        return lbl
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
        addSubview(navigationView)
        addSubview(tableView)
        navigationView.addSubview(titleLabel)
    }
    
    private func setConstraints() {
        navigationView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(100)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp_bottomMargin).inset(-8)
            make.left.right.bottom.equalTo(self)
        }
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(navigationView).inset(20)
            make.left.right.equalTo(navigationView).inset(32)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if subData?.isEmpty ?? false || childData?.isEmpty ?? false {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            if let count = childData?.count {
                return count
            }
            if let count = subData?.count {
                return count
            }
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.mainImage.isHidden = true
            cell.chevronImage.isHidden = false
            cell.titleLabel.font = .appFont(ofSize: 16, weight: .medium)
            if let name = subData?[indexPath.row].name {
                cell.titleLabel.text = name
            }
            if let name = childData?[indexPath.row].name {
                cell.titleLabel.text = name
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.mainImage.isHidden = false
            cell.chevronImage.isHidden = true
            cell.mainImage.image = UIImage(named: categoryData?.image ?? "")
            if LanguageManager().getLanguage() == "uz" {
                cell.titleLabel.text = categoryData?.name_uz
            } else {
                cell.titleLabel.text = categoryData?.name_ru
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 { return }
        if !(childData?.isEmpty ?? true) {
            delegate?.chilCategorySelected(selectedChild: childData?[indexPath.row])
        } else if !(subData?.isEmpty ?? true) {
            delegate?.subCategorySelected(childs: subData?[indexPath.row].children, categoryData: categoryData)
        }

    }
    
}
