//
//  DeliverySummaryFvtBtnView.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 16/08/2023.
//

import UIKit

class DeliverySummaryFvtBtnView: UIButton {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageBtnView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(imageBtnView)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        imageBtnView.translatesAutoresizingMaskIntoConstraints = false
        
        label.trailingAnchor.constraint(equalTo: imageBtnView.leadingAnchor, constant: -10).isActive = true
        
        label.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        imageBtnView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        imageBtnView.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        imageBtnView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        setLabelText("Add to Favourites")
        setImage(isFav: false)
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        
        self.backgroundColor = UIColor.systemGray3
    }
    
    func setImage(isFav: Bool) {
        imageBtnView.image = UIImage(systemName: isFav ? "heart.fill" : "heart.slash.fill")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: self.frame.width / 3).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabelText(_ text: String) {
        label.text = text
    }
}
