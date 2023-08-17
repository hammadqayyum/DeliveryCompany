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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomRightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
        topRightLabel.text = delivery.fromSender
        bottomRightLabel.text = delivery.toReciever
    }
    
    private func setupUI() {
        // Create labels
        self.backgroundColor = UIColor.systemGray3
        let topLeftLabel = UILabel()
        topLeftLabel.text = "From"
        
        
        let bottomLeftLabel = UILabel()
        bottomLeftLabel.text = "To"
        
        
        // Add labels to the view
        addSubview(topLeftLabel)
        addSubview(topRightLabel)
        addSubview(bottomLeftLabel)
        addSubview(bottomRightLabel)
        
        // Apply auto layout constraints
        topLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        topRightLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomRightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Top left label constraints
            topLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            topLeftLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            topLeftLabel.bottomAnchor.constraint(equalTo: bottomLeftLabel.topAnchor, constant: -10),
            
            
            // Top right label constraints
            topRightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            topRightLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            
            
            // Bottom left label constraints
            bottomLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bottomLeftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            
            // Bottom right label constraints
            bottomRightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bottomRightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
        ])
    }
}
