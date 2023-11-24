//
//  CharacterVC.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import UIKit

protocol chosenCharacterDelegate {
    func selectedCharacter(char : CharacterModel)
}

class CharacterVC: UIViewController,CharacterSelectionDelegate {
    
    var characterVM = CharacterViewModel()
    var AllCharacters : [CharacterModel] = []
    var characterCount = 0
    let tableView = UITableView()
    var selectDelegate : chosenCharacterDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        characterVM.delegate = self
        characterVM.getAllCharacters()
        setupUI()
    }
    
    func didSelectCharacter(chosenCharacters: [CharacterModel]) {
        DispatchQueue.main.async {
            print("didselectchar çalıştı")
            print("alınan data \(chosenCharacters.count)")
            self.AllCharacters = chosenCharacters
            self.characterCount = chosenCharacters.count
            self.tableView.reloadData()
        }
    }
    
    func setupUI(){
        print("tableview initialize edildi")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .yellow.withAlphaComponent(0.7)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
      
    }

    
}
extension CharacterVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .yellow.withAlphaComponent(0.5)
        cell.textLabel?.text = AllCharacters[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedChar = AllCharacters[indexPath.row]
        let detailvc = CharacterDetailVC()
        self.selectDelegate = detailvc
        selectDelegate?.selectedCharacter(char: selectedChar)
        navigationController?.pushViewController(detailvc, animated: true)
    }
}
