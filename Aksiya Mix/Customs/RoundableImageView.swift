//
//  RoundableImageView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/04/24.
//

import UIKit

class RoundableImageView: UIView {
    
    var image: UIImage? {
        get {
            return nil
        }
        set {
            imageView.image = newValue
        }
    }
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
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
        clipsToBounds = false
        addSubview(imageView)
    }
    
    private func setConstraints() {
        backgroundColor = .backColor
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
    }
    
}
