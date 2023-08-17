//
//  DeliveryCellMembersView.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import UIKit

final class DeliveryCellMembersView: UIView {
    
    private let upperLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCustomAppearance()
        return label
    }()
    
    private let lowerLabel: UILabel = {
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
        addSubview(upperLabel)
        addSubview(lowerLabel)
        
    }
    
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            upperLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            upperLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: DeliveryCellRightConstants.verticalSpacing),
            upperLabel.heightAnchor.constraint(equalTo: lowerLabel.heightAnchor),
            upperLabel.bottomAnchor.constraint(equalTo: lowerLabel.topAnchor),
            
            lowerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lowerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lowerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -DeliveryCellRightConstants.verticalSpacing),
        ])
    }
    
    func updateLabels(from: String = "", to: String = "") {
        upperLabel.text = "From: \(from)"
        lowerLabel.text = "To: \(to)"
    }
}

