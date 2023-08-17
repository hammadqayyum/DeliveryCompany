//
//  midViewDeliveryCell.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import UIKit

final class MidViewDeliveryCell: UIView {
    
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
            upperLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            upperLabel.heightAnchor.constraint(equalTo: lowerLabel.heightAnchor), // Equal height
            upperLabel.bottomAnchor.constraint(equalTo: lowerLabel.topAnchor), // Equal height
            
            lowerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lowerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lowerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ])
    }
    
    func updateLabels(from: String = "", to: String = "") {
        upperLabel.text = "From: \(from)"
        lowerLabel.text = "To: \(to)"
    }
}

