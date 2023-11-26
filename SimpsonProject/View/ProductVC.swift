//
//  ProductVC.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import UIKit

protocol SelectedProductDelegate {
    func selectedProduct(model: ProductsModel)
}

class ProductVC: UIViewController,ProductDelegate {
    
    
    var tableView = UITableView()
    let productVM = ProductViewModel()
    var allProducts : [ProductsModel] = []
    var productCount = 0
    var selectedProductdelegate : SelectedProductDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        productVM.delegate = self
        productVM.getAllProducts()
        setupUI()
    }
    func didSelectProduct(model: [ProductsModel]) {
        DispatchQueue.main.async {
            self.allProducts = model
            self.productCount = model.count
            self.tableView.reloadData()
        }
    }
    
    func setupUI(){
        tableView.backgroundColor = .yellow.withAlphaComponent(0.7)
        view.addSubViews(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leadingAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.safeAreaLayoutGuide.trailingAnchor)
    }
}

extension ProductVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .yellow.withAlphaComponent(0.5)
        cell.textLabel?.text = allProducts[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = allProducts[indexPath.row]
        let detailvc = ProductDetailsVC()
        self.selectedProductdelegate = detailvc
        self.selectedProductdelegate?.selectedProduct(model: selectedProduct)
        navigationController?.pushViewController(detailvc, animated: true)
    }
}
