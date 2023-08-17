//
//  DeliveriesListViewController.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import UIKit

final class DeliveriesListViewController: UIViewController {
    private var activityIndicator: UIActivityIndicatorView!
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
        setupUI()
        NotificationCenter.default.addObserver(self, selector: #selector(deliveriesFetched), name: .deliveriesFetched, object: nil)
        startLoading()
        DeliveriesListViewModel.instance.fetchDeliveries()
        
    }
    
    private func setupUI() {
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
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
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
            if let cell = tableView.cellForRow(at: indexPath) {
                let deliveryCell = cell as? DeliveryViewCell
                Utils.imageData = deliveryCell?.getImageData() ?? Data()
            }
            let delivery = DeliveriesListViewModel.instance.deliveries[indexPath.row]
            let vc = DeliverySummaryViewController(delivery: delivery)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height > 0 && scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.bounds.height {
            if  DeliveriesListViewModel.instance.isPaginationNeeded && DeliveriesListViewModel.instance.servicesCount == 0 {
                startLoading()
                tableView.tableFooterView = activityIndicator
                DeliveriesListViewModel.instance.fetchDeliveries(readFromLocalStorage: true)
            }
        }
    }
}

extension DeliveriesListViewController {
    @objc func deliveriesFetched() {
        stopLoading()
        tableView.tableFooterView = nil
        tableView.reloadData()
    }
}


