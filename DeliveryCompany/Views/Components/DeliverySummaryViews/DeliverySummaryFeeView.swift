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
         label.text = DeliverySummaryConstants.delivery
        label.setupLabelCustomAppearance()
        return label
    }()
    
     private let feeLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCustomAppearance()
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
        self.setupCustomAppearance()
        addSubview(leftLabel)
        addSubview(feeLabel)
        setupConstraints()
    }
    
    func setFee(delivery: DeliveryDataModel) {
        feeLabel.text = Utils.calculateTotalCharge(delivery: delivery)
    }
    
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                leftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: DeliverySummaryConstants.horizontalSpacing),
                leftLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: DeliverySummaryConstants.horizontalSpacing),
                leftLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -DeliverySummaryConstants.horizontalSpacing),

                
                feeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -DeliverySummaryConstants.horizontalSpacing),
                feeLabel.centerYAnchor.constraint(equalTo: leftLabel.centerYAnchor),
            ])
        }

}
