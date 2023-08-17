//
//  DeliverySummaryDescriptionView.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 16/08/2023.
//

import UIKit

final class DeliverySummaryDescriptionView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        self.backgroundColor = UIColor.systemGray5
        addSubview(label)
        addSubview(imageView)
        setupConstraints()
    }
    
    func setDescription(delivery: DeliveryDataModel) {
        label.text = delivery.remarks
        let image  = UIImage(data: Utils.imageData)
        if let image = image {
            imageView.image = image
        } else {
            imageView.image = UIImage(systemName: "person.circle.fill")
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Constraints for label
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            
            // Constraints for imageView
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            imageView.widthAnchor.constraint(equalToConstant: 180),
            imageView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
}
