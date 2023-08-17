//
//  UI+Extensions.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 17/08/2023.
//

import UIKit

extension UIView {
    func setupCustomAppearance() {
        self.backgroundColor = UIColor.init(red: 237/255, green: 237/255, blue: 237/255, alpha: 0.5)
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0).cgColor

        }
}

extension UILabel {
     func setupLabelCustomAppearance() {
         self.font = UIFont(name: "HelveticaNeue-Light", size: 16)
         self.textColor = UIColor.darkGray
         self.numberOfLines = 0
         self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension CALayer {
    func setupCustomAppearance() {
        self.backgroundColor = UIColor.init(red: 237/255, green: 237/255, blue: 237/255, alpha: 0.5).cgColor
        self.cornerRadius = 10.0
        self.borderWidth = 2.0
        self.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0).cgColor
        }
}
