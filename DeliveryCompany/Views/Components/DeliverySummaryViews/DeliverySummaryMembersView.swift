//
//  DeliverySummaryMembersView.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import UIKit

final class DeliverySummaryMembersView: UIView {
    
    private let topRightLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCustomAppearance()
        return label
    }()
    
    private let bottomRightLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCustomAppearance()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setMembers(delivery: DeliveryDataModel) {
        topRightLabel.text = delivery.senderName()
        bottomRightLabel.text = delivery.recieverName()
    }
    
    private func setupUI() {
        //self.backgroundColor = UIColor.systemGray3
        self.setupCustomAppearance()
        let topLeftLabel = UILabel()
        topLeftLabel.setupLabelCustomAppearance()
        topLeftLabel.text = DeliverySummaryConstants.from
        
        
        let bottomLeftLabel = UILabel()
        bottomLeftLabel.setupLabelCustomAppearance()
        bottomLeftLabel.text = DeliverySummaryConstants.to
        
        
        addSubview(topLeftLabel)
        addSubview(topRightLabel)
        addSubview(bottomLeftLabel)
        addSubview(bottomRightLabel)
        
        topLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        topRightLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomRightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Top left label constraints
            topLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DeliverySummaryConstants.horizontalSpacing),
            topLeftLabel.topAnchor.constraint(equalTo: topAnchor, constant: DeliverySummaryConstants.verticalSpacing),
            topLeftLabel.bottomAnchor.constraint(equalTo: bottomLeftLabel.topAnchor, constant: -DeliverySummaryConstants.labelsVerticalSpacing),
            
            
            // Top right label constraints
            topRightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DeliverySummaryConstants.horizontalSpacing),
            topRightLabel.topAnchor.constraint(equalTo: topAnchor, constant: DeliverySummaryConstants.verticalSpacing),
            
            
            // Bottom left label constraints
            bottomLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DeliverySummaryConstants.horizontalSpacing),
            bottomLeftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DeliverySummaryConstants.verticalSpacing),
            
            
            // Bottom right label constraints
            bottomRightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DeliverySummaryConstants.horizontalSpacing),
            bottomRightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DeliverySummaryConstants.verticalSpacing),
        ])
    }
}
