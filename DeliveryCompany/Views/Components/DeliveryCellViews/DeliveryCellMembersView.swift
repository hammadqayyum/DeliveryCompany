//
//  DeliveryCellMembersView.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import UIKit

final class DeliveryCellMembersView: UIView {
    
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
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(senderLabel)
        addSubview(recieverLabel)
        
    }
    
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            senderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            senderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            senderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: DeliveryCellRightConstants.verticalSpacing),
            senderLabel.heightAnchor.constraint(equalTo: recieverLabel.heightAnchor),
            senderLabel.bottomAnchor.constraint(equalTo: recieverLabel.topAnchor),
            
            recieverLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            recieverLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            recieverLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -DeliveryCellRightConstants.verticalSpacing),
        ])
    }
    
    func updateLabels(from: String = "", to: String = "") {
        senderLabel.text = "\(StringsConstant.from): \(from)"
        recieverLabel.text = "\(StringsConstant.to): \(to)"
    }
}

