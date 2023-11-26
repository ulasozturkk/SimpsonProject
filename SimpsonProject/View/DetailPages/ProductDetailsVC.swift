//
//  ProductDetailsVC.swift
//  SimpsonProject
//
//  Created by macbook pro on 25.11.2023.
//

import UIKit

class ProductDetailsVC: UIViewController,SelectedProductDelegate {
    
    var nameLabel = UILabel()
    var categoryLabel = UILabel()
    var descriptionLabel = UILabel()
    var stackView = UIStackView()
    var selectedProduct : ProductsModel? {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupUI()
    }
    
    func selectedProduct(model: ProductsModel) {
        self.selectedProduct = model
    }
    
    func updateUI(){
        guard let selectedProduct = selectedProduct else { return }
        self.nameLabel.text = "name : \(selectedProduct.name)"
        self.categoryLabel.text = "category: \(selectedProduct.category)"
        self.descriptionLabel.text = "description : \(selectedProduct.description)"
    }
    
    func setupUI(){
        view.enableConstraints(nameLabel,categoryLabel,descriptionLabel)
        view.addSubViews(stackView)
        stackView.addArrangedSubviews(views: nameLabel,categoryLabel,descriptionLabel)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        descriptionLabel.numberOfLines = 0
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leadingAnchor,right: view.safeAreaLayoutGuide.trailingAnchor,height: view.safeAreaLayoutGuide.heightAnchor)
    }
}
