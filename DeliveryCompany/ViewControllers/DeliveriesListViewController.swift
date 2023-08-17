//
//  DeliveriesListViewController.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import UIKit

final class DeliveriesListViewController: UIViewController {

   lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DeliveryViewCell.classForCoder(), forCellReuseIdentifier: "DeliveryViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Deliveries"
        view.addSubview(tableView)
        // Add constraints to position and size the tableView
            tableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        tableView.reloadData()
        NotificationCenter.default.addObserver(self, selector: #selector(deliveriesFetched), name: .deliveriesFetched, object: nil)
        DeliveriesListViewModel.instance.fetchDeliveries()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        }
    }
}

//MARK: -  TableView Data Source and Delegate
extension DeliveriesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DeliveriesListViewModel.instance.deliveries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryViewCell", for: indexPath) as! DeliveryViewCell
        if DeliveriesListViewModel.instance.deliveries.count >= indexPath.row {
            let delivery = DeliveriesListViewModel.instance.deliveries[indexPath.row]
            cell.configCell(delivery: delivery)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if DeliveriesListViewModel.instance.deliveries.count >= indexPath.row {
            let delivery = DeliveriesListViewModel.instance.deliveries[indexPath.row]
            let vc = DeliverySummaryViewController(delivery: delivery)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension DeliveriesListViewController {
    @objc func deliveriesFetched() {
        tableView.reloadData()
    }
}


