//
//  DeliverySummaryMembersView.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import UIKit

final class DeliverySummaryMembersView: UIView {
    
    private let senderLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCustomAppearance()
        return label
    }()
    
    private let recieverLabel: UILabel = {
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
        senderLabel.text = delivery.senderName()
        recieverLabel.text = delivery.recieverName()
    }
    
    private func setupUI() {
        //self.backgroundColor = UIColor.systemGray3
        self.setupCustomAppearance()
        let topLeftLabel = UILabel()
        topLeftLabel.setupLabelCustomAppearance()
        topLeftLabel.text = StringsConstant.from
        
        
        let bottomLeftLabel = UILabel()
        bottomLeftLabel.setupLabelCustomAppearance()
        bottomLeftLabel.text = StringsConstant.to
        
        
        addSubview(topLeftLabel)
        addSubview(senderLabel)
        addSubview(bottomLeftLabel)
        addSubview(recieverLabel)
        
        topLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        senderLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        recieverLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Top left label constraints
            topLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DeliverySummaryConstants.horizontalSpacing),
            topLeftLabel.topAnchor.constraint(equalTo: topAnchor, constant: DeliverySummaryConstants.verticalSpacing),
            topLeftLabel.bottomAnchor.constraint(equalTo: bottomLeftLabel.topAnchor, constant: -DeliverySummaryConstants.labelsVerticalSpacing),
            
            
            // Top right label constraints
            senderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DeliverySummaryConstants.horizontalSpacing),
            senderLabel.topAnchor.constraint(equalTo: topAnchor, constant: DeliverySummaryConstants.verticalSpacing),
            
            
            // Bottom left label constraints
            bottomLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DeliverySummaryConstants.horizontalSpacing),
            bottomLeftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DeliverySummaryConstants.verticalSpacing),
            
            
            // Bottom right label constraints
            recieverLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DeliverySummaryConstants.horizontalSpacing),
            recieverLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DeliverySummaryConstants.verticalSpacing),
        ])
    }
}
