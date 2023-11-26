//
//  StackViewExtension.swift
//  SimpsonProject
//
//  Created by macbook pro on 26.11.2023.
//

import Foundation
import UIKit

extension UIStackView {
    
    func addArrangedSubviews(views : UIView...){
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview(view)
        }
    }
}
