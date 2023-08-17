//
//  DeliverySummaryViewController.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import UIKit
import RealmSwift

final class DeliverySummaryViewController: UIViewController {
    
    private var delivery: DeliveryDataModel!
    private let deliverySummaryMembersView = DeliverySummaryMembersView()
    private let deliverySummaryDescriptionView = DeliverySummaryDescriptionView()
    private let deliverySummaryFeeView = DeliverySummaryFeeView()
    private let favouriteButton = DeliverySummaryFvtBtnView()
    let realm = try! Realm()
    
    convenience init(delivery: DeliveryDataModel) {
        self.init()
        self.delivery = delivery
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        updateViewsConstraints()
        favouriteButton.addTarget(self, action: #selector(favouriteButtonTapped), for: .touchUpInside)
        configureHelperViews()
    }
    
    private func setupViews() {
        title = "Delivery Details"
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white

        favouriteButton.translatesAutoresizingMaskIntoConstraints = false
        deliverySummaryMembersView.translatesAutoresizingMaskIntoConstraints = false
        deliverySummaryDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        deliverySummaryFeeView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(deliverySummaryMembersView)
        view.addSubview(deliverySummaryDescriptionView)
        view.addSubview(deliverySummaryFeeView)
        view.addSubview(favouriteButton)
    }
    
    private func updateViewsConstraints() {
        NSLayoutConstraint.activate([
            deliverySummaryMembersView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            deliverySummaryMembersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            deliverySummaryMembersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
        ])
        // deliverySummaryMembersView.heightAnchor.constraint(equalToConstant: 100),
        NSLayoutConstraint.activate([
            deliverySummaryDescriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 12),
            deliverySummaryDescriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            deliverySummaryDescriptionView.topAnchor.constraint(equalTo: deliverySummaryMembersView.bottomAnchor, constant: 25),
        ])
        
        NSLayoutConstraint.activate([
            deliverySummaryFeeView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 12),
            deliverySummaryFeeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            deliverySummaryFeeView.topAnchor.constraint(equalTo: deliverySummaryDescriptionView.bottomAnchor, constant: 25),
        ])
        
        NSLayoutConstraint.activate([
            favouriteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            favouriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8),
            favouriteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30),
        ])
    }
    
    private func configureHelperViews() {
        deliverySummaryMembersView.setMembers(delivery: self.delivery)
        deliverySummaryDescriptionView.setDescription(delivery: self.delivery)
        deliverySummaryFeeView.setFee(delivery: self.delivery)
        favouriteButton.setImage(isFav: self.delivery.favouriteStatus())
    }
    
    @objc func favouriteButtonTapped() {
        
        do {
            try realm.write {
                self.delivery.updateIsFavourite()
                realm.add(self.delivery, update: .modified)
            }
        } catch let error as NSError {
            print("Error updating delivery object: \(error.localizedDescription)")
        }
        //        self.delivery.isFavourite = !self.delivery.isFavourite
        favouriteButton.setImage(isFav: self.delivery.favouriteStatus())
    }
}

