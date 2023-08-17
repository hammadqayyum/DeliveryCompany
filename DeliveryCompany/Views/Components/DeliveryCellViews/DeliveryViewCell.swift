//
//  DeliveryViewCell.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//
import SDWebImage
import UIKit

final class DeliveryViewCell: UITableViewCell {
    private var delivery: DeliveryDataModel!
    let midViewDeliveryCell = DeliveryCellMembersView()
    let rightContainer = DeliveryCellFeeView()
    let containerView = UIView()
    
    let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(leftImageView)
        containerView.addSubview(midViewDeliveryCell)
        containerView.addSubview(rightContainer)
        containerView.setupCustomAppearance()
        contentView.addSubview(containerView)
        setupConstraints()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DeliveryCellConstants.verticalSpacing),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DeliveryCellConstants.horizontalSpacing),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -DeliveryCellConstants.horizontalSpacing),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -DeliveryCellConstants.verticalSpacing),
            
        ])
        NSLayoutConstraint.activate([
            leftImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            leftImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            leftImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            leftImageView.heightAnchor.constraint(equalToConstant: DeliveryCellConstants.imageHeightWidht),
            leftImageView.widthAnchor.constraint(equalToConstant: DeliveryCellConstants.imageHeightWidht)
        ])
        NSLayoutConstraint.activate([
            midViewDeliveryCell.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: DeliveryCellConstants.horizontalSpacing),
            midViewDeliveryCell.topAnchor.constraint(equalTo: containerView.topAnchor),
            midViewDeliveryCell.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

        ])
        
        NSLayoutConstraint.activate([
            rightContainer.topAnchor.constraint(equalTo: containerView.topAnchor),
            rightContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            rightContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

        ])
        leftImageView.layer.cornerRadius = DeliveryCellConstants.cornerRadius
    }
    
    private func setandSaveImage(delivery: DeliveryDataModel) {
        if let url = URL(string: delivery.goodsPictureUrl()) {
            leftImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: PlaceHolderImage.placeHolderImage))
        }
    }
    
    func getImageData() -> Data {
        return self.leftImageView.image?.pngData() ?? Data()
    }
    
    func configCell(delivery: DeliveryDataModel) {
        self.delivery = delivery
        setandSaveImage(delivery: self.delivery)
        midViewDeliveryCell.updateLabels(from: self.delivery.senderName(), to: self.delivery.recieverName())
        rightContainer.updateView(delivery: self.delivery)
    }
}
