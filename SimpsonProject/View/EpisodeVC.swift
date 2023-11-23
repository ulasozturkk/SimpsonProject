//
//  EpisodeVC.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import UIKit

class EpisodeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let cellIdentifier = "EpisodeCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let tableView = makeTableView()
    }
    

    func makeTableView() -> UITableView{
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.backgroundColor = .yellow.withAlphaComponent(0.7)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        return tableView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .yellow.withAlphaComponent(0.5)
        cell.textLabel?.text = "test"
        return cell
    }
}
