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
    let rightContainer = RightViewDeliveryCell() // Container view for equal-width labels

    // Declare your UI elements
    let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.circle.fill")
        return imageView
    }()
    
    // Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Create horizontal stack view for left side
        let leftStackView = createStack(views: [leftImageView], axis: .vertical)
        
        // Create vertical stack view for upper and lower labels
        
        let labelsStackView = createStack(views: [midViewDeliveryCell], alignment: .leading, axis: .vertical)
        
        // Create vertical stack view for upper and lower labels
        let rightStackView = createStack(views: [rightContainer], alignment: .trailing, axis: .vertical)

        // Create vertical stack view for the whole cell
        let mainStackView = createStack(views: [leftStackView, labelsStackView, rightStackView], axis: .horizontal)
        mainStackView.spacing = 5
        
        // Add the main stack view to the cell's content view
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
        if let url = URL(string: delivery.goodsPicture) {
           // leftImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "person.circle.fill"))
            
            
            leftImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "person.circle.fill"), completed: { (image, error, _, _) in
                    if let error = error {
                        print(error)
                    } else if let image = image {
                        self.delivery.imageData = image.pngData() ?? Data()
                    }
                })
            
            
        }
    }
    
    func configCell(delivery: DeliveryDataModel) {
        self.delivery = delivery
        setandSaveImage(delivery: self.delivery)
        midViewDeliveryCell.updateLabels(from: self.delivery.fromSender, to: self.delivery.toReciever)
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
