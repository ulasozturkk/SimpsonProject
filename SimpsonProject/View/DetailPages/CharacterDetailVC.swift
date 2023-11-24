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
        print("viewdidload çalıştı")
        view.backgroundColor = .yellow
        setupUI()
    }
    
    func updateUI() {
                print("updateUI çalıştırıldı")
                guard let selectedCharacter = selectedChar else { return }
                print(selectedCharacter.name)
                namelabel.text = "Name: \(selectedCharacter.name)"
                normalizedNameLabel.text = "Normalized Name: \(selectedCharacter.normalizedName)"
                genderLabel.text = "Gender: \(selectedCharacter.gender)"
        }
    
    func selectedCharacter(char: CharacterModel) {
        print("selectedChar çalıştı")
        selectedChar = char
    }
    
    func setupUI(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        normalizedNameLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.addArrangedSubview(namelabel)
        stackView.addArrangedSubview(normalizedNameLabel)
        stackView.addArrangedSubview(genderLabel)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        namelabel.textColor = .black
        normalizedNameLabel.textColor = .black
        genderLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
