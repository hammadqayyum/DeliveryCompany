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
    
    private let feeLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCustomAppearance()
        return label
    }()
    
    var isTopRightImageViewHidden: Bool {
        return topRightImageView.isHidden
    }
    
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
        addSubview(feeLabel)
        
    }
    
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        topRightImageView.translatesAutoresizingMaskIntoConstraints = false
        feeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topRightImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -DeliveryCellRightConstants.horizontalSpacing),
            topRightImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: DeliveryCellRightConstants.verticalSpacing),
            
            feeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            feeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -DeliveryCellRightConstants.horizontalSpacing),
            feeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -DeliveryCellRightConstants.verticalSpacing),
        ])
    }
    
    func updateView(delivery: DeliveryDataModel) {
        feeLabel.text = Utils.calculateTotalCharge(delivery: delivery)
        topRightImageView.isHidden = !delivery.favouriteStatus()
    }
}

