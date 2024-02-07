//
//  LaunchView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

protocol LaunchViewDelegate {
    func animateDidFinish()
}

class LaunchView: UIView {
    
    var delegate: LaunchViewDelegate?
    
    lazy var appIconView: UIImageView = {
        let view = UIImageView()
        view.image = .appicon
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [self] in
            animate()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(appIconView)
        backgroundColor = .white
    }
    
    private func setConstraints() {
        appIconView.snp.makeConstraints { make in
            make.height.width.equalTo(0.screenWight - 100)
            make.center.equalTo(self)
        }
    }

    private func animate() {
        delegate?.animateDidFinish()
    }

}
