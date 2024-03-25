//
//  RecentlySearchView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 25/03/24.
//

import UIKit

class RecentlySearchView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    lazy var topNavigation: SearchItemTopView = {
        let view = SearchItemTopView()
        
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .backColor
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
        backgroundColor = .systemTeal
        addSubview(tableView)
        addSubview(topNavigation)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        topNavigation.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(90.toScreen)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
}

class RecentlySearchCell: UITableViewCell {
    
    
}
