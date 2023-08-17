//
//  DeliverySummaryFeeView.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 16/08/2023.
//

import UIKit

final class DeliverySummaryFeeView: UIView {

    
     private let leftLabel: UILabel = {
        let label = UILabel()
         label.text = "Delivery Fee"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     private let feeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        self.backgroundColor = UIColor.systemGray3
        addSubview(leftLabel)
        addSubview(feeLabel)
        setupConstraints()
    }
    
    func setFee(delivery: DeliveryDataModel) {
        feeLabel.text = delivery.totalAmount
    }
    
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                // Constraints for leftLabel
                leftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                leftLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                leftLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),

                
                // Constraints for rightLabel
                feeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                feeLabel.centerYAnchor.constraint(equalTo: leftLabel.centerYAnchor),
            ])
        }

}
