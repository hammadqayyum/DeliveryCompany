//
//  RightViewDeliveryCell.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import UIKit

final class RightViewDeliveryCell: UIView {
    
    private let topRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "heart.fill")
        return imageView
    }()
    
    private let bottomRightLabel: UILabel = {
        let label = UILabel()
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
            topRightImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            topRightImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            bottomRightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomRightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            bottomRightLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ])
    }
    
    func updateView(delivery: DeliveryDataModel) {
        bottomRightLabel.text = Utils.calculateTotalCharge(delivery: delivery)
        topRightImageView.isHidden = !delivery.favouriteStatus()
    }
}

