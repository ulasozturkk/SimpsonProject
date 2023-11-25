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
    
    
    func setupUI(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(categoryLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        descriptionLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
            
        
    }
    
    func updateUI(){
        guard let selectedProduct = selectedProduct else { return }
        self.nameLabel.text = "name : \(selectedProduct.name)"
        self.categoryLabel.text = "category: \(selectedProduct.category)"
        self.descriptionLabel.text = "description : \(selectedProduct.description)"
    }

    

}
