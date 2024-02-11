//
//  CategoryView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

protocol CategoryViewDelegate {
    func selected(index: Int)
}

class CategoryView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: CategoryViewDelegate?
    
    lazy var navigationView: UIView = {
        let view = UIView()
        view.addShadow()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        lbl.text = LyricsManager.getLyrics(type: .departaments)
        return lbl
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .backColor
        tv.separatorStyle = .none
        tv.contentInset = .init(top: 10, left: 0, bottom: 50, right: 0)
        tv.showsVerticalScrollIndicator = false
        tv.register(CategoryCell.self, forCellReuseIdentifier: "CategoryCell")
        return tv
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
        navigationView.addSubview(titleLabel)
        addSubview(tableView)
    }
    
    private func setConstraints() {
        navigationView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(100)
        }
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(navigationView).inset(16)
            make.left.right.equalTo(navigationView).inset(16)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp_bottomMargin)
            make.left.right.bottom.equalTo(self)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selected(index: indexPath.row)
    }
    
}