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
        
        label.trailingAnchor.constraint(equalTo: imageBtnView.leadingAnchor, constant: -DeliverySummaryButtonConstants.horizontalSpacing).isActive = true
        
        label.topAnchor.constraint(equalTo: topAnchor, constant: DeliverySummaryButtonConstants.verticalSpacing).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DeliverySummaryButtonConstants.verticalSpacing).isActive = true
        imageBtnView.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        imageBtnView.heightAnchor.constraint(equalToConstant: DeliverySummaryButtonConstants.imageWidhtHeight).isActive = true
        imageBtnView.widthAnchor.constraint(equalToConstant: DeliverySummaryButtonConstants.imageWidhtHeight).isActive = true

        
        setLabelText("Add to Favourites")
        setImage(isFav: false)
        setupCustomBtnAppearance()
    }
    
    func setImage(isFav: Bool) {
        imageBtnView.image = UIImage(systemName: isFav ? DeliverySummaryButtonConstants.fav : DeliverySummaryButtonConstants.notFav)
        imageBtnView.tintColor = UIColor.white
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
