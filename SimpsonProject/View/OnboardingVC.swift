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
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow.withAlphaComponent(0.9)
        setupUI()
        
        
    }
    
    func setupUI(){
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let scrollView = makeScrollView()
        scrollView.delegate = self
        let firstView = makeFirstView(color: .yellow, 
                                      title: "Welcome to the Simpson App",
                                      image : UIImage(named: "homer.png"),
                                      subtitle: "lets see its features",
                                      height: screenHeight,
                                      width: screenWidth,
                                      isButtonHidden: true
        )
        let secondView = makeFirstView(color: .yellow, title: nil, image: nil, subtitle: nil,height: screenHeight,width: screenWidth,isButtonHidden: true)
        let thirdView = makeFirstView(color: .yellow, title: nil, image: nil, subtitle: nil,height: screenHeight,width: screenWidth,isButtonHidden: false)
        view.addSubview(scrollView)
        
        let stackView = UIStackView()
        scrollView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.addArrangedSubview(thirdView)
        stackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: screenWidth * 0.05),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: screenHeight * 0.05),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -(screenWidth * 0.05)),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -(screenHeight * 0.05)),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor , multiplier: 3),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    func makeSecondView(color : UIColor, title: String?,image :UIImage?,subtitle: String?, height : CGFloat,width : CGFloat) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        let width = width
        let height = width
        return view
    }

    func makeFirstView(color : UIColor, title: String?, image : UIImage?,subtitle: String?, height : CGFloat,width: CGFloat,isButtonHidden : Bool) -> UIView {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        let width = width
        let height = width
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        let subLabel = UILabel()
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subLabel)
        subLabel.text = subtitle
        subLabel.font = UIFont.systemFont(ofSize: 15)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.isHidden = isButtonHidden
        button.setTitle("Home Page", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate(
        [
            imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: height * 0.05),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: width * 0.05),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -(width * 0.05)),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: height * 0.1),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: height * 0.05),
            subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: height * 0.05),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
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

