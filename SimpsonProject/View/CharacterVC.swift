//
//  CharacterVC.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import UIKit

class CharacterVC: UIViewController,UITableViewDelegate,UITableViewDataSource,CharacterSelectionDelegate {
    
    let cellIdentifier = "characterCell"
    var characterVM = CharacterViewModel()
    var AllCharacters : [CharacterModel] = []
    var characterCount = 0
    let tableView = UITableView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("viewdidload çalıştı")
        view.backgroundColor = .yellow
        tableView.delegate = self
        tableView.dataSource = self
        characterVM.delegate = self
        characterVM.getAllCharacters()
        setupUI()
        print(characterCount)
        
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
        tableView.register(CharacterCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.backgroundColor = .yellow.withAlphaComponent(0.7)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100 // Tahmini bir hücre yüksekliği belirle
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
      
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return characterCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CharacterCell

        
        cell.textLabel?.text = AllCharacters[indexPath.row].name
        
        return cell
    }
}
