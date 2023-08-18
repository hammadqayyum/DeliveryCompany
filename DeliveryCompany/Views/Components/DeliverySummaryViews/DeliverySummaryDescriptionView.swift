//
//  DeliverySummaryDescriptionView.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 16/08/2023.
//

import UIKit

final class DeliverySummaryDescriptionView: UIView {
    
    private let remarksLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCustomAppearance()
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.setupCustomAppearance()
        addSubview(remarksLabel)
        addSubview(imageView)
        setupConstraints()
    }
    
    func setDescription(delivery: DeliveryDataModel) {
        remarksLabel.text = delivery.deliveryRemarks()
        if let url = URL(string: delivery.goodsPictureUrl()) {
            imageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: PlaceHolderImage.placeHolderImage))
        }

    }

    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Constraints for label
            remarksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: DeliverySummaryConstants.verticalSpacing),
            remarksLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: DeliverySummaryConstants.verticalSpacing),
            remarksLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -DeliverySummaryConstants.verticalSpacing),
            
            
            // Constraints for imageView
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: DeliverySummaryConstants.verticalSpacing),
            imageView.topAnchor.constraint(equalTo: remarksLabel.bottomAnchor, constant: DeliverySummaryConstants.verticalSpacing),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -DeliverySummaryConstants.verticalSpacing),
            imageView.widthAnchor.constraint(equalToConstant: DeliverySummaryConstants.imageWidhtHeight),
            imageView.heightAnchor.constraint(equalToConstant: DeliverySummaryConstants.imageWidhtHeight)
        ])
        imageView.layer.cornerRadius = DeliverySummaryConstants.cornerRadius
    }
    
}
