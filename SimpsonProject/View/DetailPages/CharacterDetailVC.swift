//
//  CharacterDetailVC.swift
//  SimpsonProject
//
//  Created by macbook pro on 24.11.2023.
//

import UIKit

class CharacterDetailVC: UIViewController,chosenCharacterDelegate {
    
    var namelabel = UILabel()
    var normalizedNameLabel = UILabel()
    var genderLabel = UILabel()
    var stackView = UIStackView()
    var selectedChar : CharacterModel? {
        didSet{
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupUI()
    }
    
    func selectedCharacter(char: CharacterModel) {
        selectedChar = char
    }
    
    func updateUI() {
                guard let selectedCharacter = selectedChar else { return }
                print(selectedCharacter.name)
                namelabel.text = "Name: \(selectedCharacter.name)"
                normalizedNameLabel.text = "Normalized Name: \(selectedCharacter.normalizedName)"
                genderLabel.text = "Gender: \(selectedCharacter.gender)"
        }
    
    func setupUI(){
        view.enableConstraints(stackView,namelabel,normalizedNameLabel,genderLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubviews(views: namelabel,normalizedNameLabel,genderLabel)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        namelabel.textColor = .black
        normalizedNameLabel.textColor = .black
        genderLabel.textColor = .black
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leadingAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.trailingAnchor)
    }
}
