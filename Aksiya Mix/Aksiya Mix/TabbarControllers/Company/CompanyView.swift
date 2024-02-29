//
//  View.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

protocol CompanyViewDelegate {
    func selectedCompany(index: Int)
}

class CompanyView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: CompanyViewDelegate?
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        table.backgroundColor = .backColor
        table.contentInset = .init(top: 10, left: 0, bottom: 50, right: 0)
        table.register(CompanyCell.self, forCellReuseIdentifier: "CompanyCell")
        return table
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
        addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell", for: indexPath) as! CompanyCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedCompany(index: indexPath.row)
    }
    
}
