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
    let labelsHeight = 20
    let midViewDeliveryCell = MidViewDeliveryCell()
    let rightContainer = RightViewDeliveryCell()
    
    let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.circle.fill")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let leftStackView = createStack(views: [leftImageView], axis: .vertical)
        let labelsStackView = createStack(views: [midViewDeliveryCell], alignment: .leading, axis: .vertical)
        let rightStackView = createStack(views: [rightContainer], alignment: .trailing, axis: .vertical)
        let mainStackView = createStack(views: [leftStackView, labelsStackView, rightStackView], axis: .horizontal)
        mainStackView.spacing = 5
        contentView.addSubview(mainStackView)
        setupConstraints(for: mainStackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(for stackView: UIStackView) {
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 1
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6).isActive = true
        
        leftImageView.widthAnchor.constraint(equalTo: leftImageView.heightAnchor).isActive = true
    }
    
    private func setandSaveImage(delivery: DeliveryDataModel) {
        if let url = URL(string: delivery.goodsPictureUrl()) {
             leftImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "person.circle.fill"))
//            leftImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "person.circle.fill"), completed: { (image, error, _, _) in
//                if let error = error {
//                    print(error)
//                } else if let image = image {
////                    Utils.imageData = image.pngData() ?? Data()
//                }
//            })
        }
    }
    
    func getImageData() -> Data {
        return self.leftImageView.image?.jpegData(compressionQuality: 0.2) ?? Data()
    }
    
    func configCell(delivery: DeliveryDataModel) {
        self.delivery = delivery
        setandSaveImage(delivery: self.delivery)
        midViewDeliveryCell.updateLabels(from: self.delivery.senderName(), to: self.delivery.recieverName())
        rightContainer.updateView(delivery: self.delivery)
    }
    
    private func createStack(views: [UIView], alignment: UIStackView.Alignment = .fill , axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.alignment = alignment
        return stackView
    }
}
