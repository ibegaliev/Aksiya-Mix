//
//  View.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

protocol SingleCompanyViewDelegate {
    
}

class SingleCompanyView: UIView {
    
    var delegate: SingleCompanyViewDelegate?
    
    var contentY: CGFloat?
    
    lazy var topNavigation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.image = .macStore
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.contentInset = UIEdgeInsets(
            top: 0.screenWight/1.75,
            left: 0,
            bottom: 50,
            right: 0
        )
        tv.register(CompanyHeaderCell.self, forCellReuseIdentifier: "CompanyHeaderCell")
        tv.register(CompanyCountsCell.self, forCellReuseIdentifier: "CompanyCountsCell")
        tv.register(CompanyLocationsCell.self, forCellReuseIdentifier: "CompanyLocationsCell")
        tv.register(CompanyDescriptionCell.self, forCellReuseIdentifier: "CompanyDescriptionCell")
        tv.register(CompanyMainCell.self, forCellReuseIdentifier: "CompanyMainCell")
        tv.register(CompanyRatingCell.self, forCellReuseIdentifier: "CompanyRatingCell")
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
        addSubview(mainImage)
        addSubview(tableView)
        addSubview(topNavigation)
    }
    
    private func setConstraints() {
        topNavigation.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(90)
        }
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(topNavigation.snp_bottomMargin)
            make.left.right.equalTo(self)
            make.height.equalTo(0.screenWight/1.7)
        }
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(topNavigation.snp_bottomMargin)
        }
        
    }
    
}

extension SingleCompanyView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyHeaderCell", for: indexPath) as! CompanyHeaderCell
            cell.backgroundColor = .clear
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCountsCell", for: indexPath) as! CompanyCountsCell
            cell.backgroundColor = .clear
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyLocationsCell", for: indexPath) as! CompanyLocationsCell
            cell.backgroundColor = .clear
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyMainCell", for: indexPath) as! CompanyMainCell
            cell.backgroundColor = .clear
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyDescriptionCell", for: indexPath) as! CompanyDescriptionCell
            cell.backgroundColor = .clear
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyRatingCell", for: indexPath) as! CompanyRatingCell
            cell.backgroundColor = .clear
            return cell
        }
        return UITableViewCell()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let float = contentY {
            if scrollView.contentOffset.y < float  {
                UIView.animate(withDuration: 0.1) { [self] in
                    mainImage.transform = CGAffineTransform(
                        scaleX: (float - scrollView.contentOffset.y)/100 + 1,
                        y: (float - scrollView.contentOffset.y)/100 + 1
                    )
                }
            } else {
                UIView.animate(withDuration: 0.1) { [self] in
                    mainImage.transform = .identity
                }
            }
        } else {
            contentY = scrollView.contentOffset.y
        }
    }
    
}
