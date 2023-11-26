//
//  ViewController.swift
//  SimpsonProject
//
//  Created by macbook pro on 22.11.2023.
//

import UIKit

class OnboardingVC: UIViewController , UIScrollViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow.withAlphaComponent(0.9)
        setupUI()
    }
    
    func setupUI(){
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let scrollView = makeScrollView()
        scrollView.delegate = self
        let firstView = makeView(color: .yellow, 
                                      title: "Welcome to the Simpson App",
                                      image : UIImage(named: "homer.png"),
                                      subtitle: "lets see its features",
                                      height: screenHeight,
                                      width: screenWidth,
                                      isButtonHidden: true
        )
        let secondView = makeView(color: .yellow, title: nil, image: nil, subtitle: nil,height: screenHeight,width: screenWidth,isButtonHidden: true)
        let thirdView = makeView(color: .yellow, title: nil, image: nil, subtitle: nil,height: screenHeight,width: screenWidth,isButtonHidden: false)
        view.addSubview(scrollView)
        
        let stackView = UIStackView()
        scrollView.addSubview(stackView)
        stackView.axis = .horizontal
        
        stackView.addArrangedSubviews(views: firstView,secondView,thirdView)
        stackView.distribution = .fillEqually
        
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left:view.safeAreaLayoutGuide.leadingAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.safeAreaLayoutGuide.trailingAnchor,
                          paddingTop: screenHeight * 0.05,paddingLeft: screenWidth * 0.05, paddingBottom : screenHeight * 0.05, paddingRight: screenWidth * 0.05
        )
        stackView.anchor(top: scrollView.topAnchor,left: scrollView.leadingAnchor,bottom: scrollView.bottomAnchor,right: scrollView.trailingAnchor,width: scrollView.widthAnchor, height: scrollView.heightAnchor,widthMultiplier: 3)
        
    }
    
    func makeView(color : UIColor, title: String?, image : UIImage?,subtitle: String?, height : CGFloat,width: CGFloat,isButtonHidden : Bool) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        let width = width
        let height = width
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        let subLabel = UILabel()
        subLabel.text = subtitle
        subLabel.font = UIFont.systemFont(ofSize: 15)
        
        let button = UIButton()
        button.isHidden = isButtonHidden
        button.setTitle("Home Page", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        view.addSubViews(imageView,label,subLabel,button)
        imageView.anchor(top: view.topAnchor,left: view.leadingAnchor,
                         right: view.trailingAnchor,paddingTop: height * 0.05, paddingLeft: width * 0.05, 
                         paddingRight: width * 0.05,centerX : view.centerXAnchor, height: view.heightAnchor , heightMultiplier: 0.6)
        label.anchor(top: imageView.bottomAnchor,paddingTop: height * 0.1,centerX: view.centerXAnchor)
        subLabel.anchor(top: label.bottomAnchor,paddingTop: height * 0.1,centerX: view.centerXAnchor)
        button.anchor(top: subLabel.bottomAnchor,paddingTop: height * 0.05,centerX: view.centerXAnchor)
        
        return view
    }

    func makeScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true // kaydırma açık
        scrollView.showsHorizontalScrollIndicator = true
        return scrollView
    }
    @objc func tapButton(){
        navigationController?.pushViewController(TabBar(), animated: true)
    }
}
