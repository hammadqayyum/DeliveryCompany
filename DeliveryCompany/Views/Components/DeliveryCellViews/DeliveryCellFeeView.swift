//
//  DeliveryCellFeeView.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import UIKit

final class DeliveryCellFeeView: UIView {
    
    private let topRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = UIColor.white
        return imageView
    }()
    
    private let bottomRightLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCustomAppearance()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(topRightImageView)
        addSubview(bottomRightLabel)
        
    }
    
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        topRightImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomRightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topRightImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -DeliveryCellRightConstants.horizontalSpacing),
            topRightImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: DeliveryCellRightConstants.verticalSpacing),
            
            bottomRightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomRightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -DeliveryCellRightConstants.horizontalSpacing),
            bottomRightLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -DeliveryCellRightConstants.verticalSpacing),
        ])
    }
    
    func updateView(delivery: DeliveryDataModel) {
        bottomRightLabel.text = Utils.calculateTotalCharge(delivery: delivery)
        topRightImageView.isHidden = !delivery.favouriteStatus()
    }
}

