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
        label.setupLabelCustomAppearance()
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
        imageBtnView.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        imageBtnView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageBtnView.widthAnchor.constraint(equalToConstant: 25).isActive = true

        
        setLabelText("Add to Favourites")
        setImage(isFav: false)
        layer.borderWidth = 2
        layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0).cgColor

        layer.cornerRadius = 10
        self.backgroundColor = UIColor.init(red: 237/255, green: 237/255, blue: 237/255, alpha: 0.8)

    }
    
    func setImage(isFav: Bool) {
        imageBtnView.image = UIImage(systemName: isFav ? "heart.fill" : "heart.slash.fill")
        imageBtnView.tintColor = UIColor.red
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
