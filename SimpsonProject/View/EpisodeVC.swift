//
//  EpisodeVC.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import UIKit

protocol selectedEpisodeDelegate {
    func selectedEpisode(episodemodel : EpisodeModel)
}


class EpisodeVC: UIViewController, EpisodeDelegate {

    let episodeVM = EpisodeViewModel()
    var AllEpisodes : [EpisodeModel] = []
    var episodeCount = 0
    let tableView = UITableView()
    var selectEpisodeDelegate : selectedEpisodeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        episodeVM.delegate = self
        episodeVM.getAllEpisodes()
        SetupUI()
    }
    
    func didSelectEpisodes(episodeModel: [EpisodeModel]) {
        DispatchQueue.main.async {
            print("didselectEp çalıştı")
            print(episodeModel.count)
            self.AllEpisodes = episodeModel
            self.episodeCount = episodeModel.count
            self.tableView.reloadData()
        }
    }

    func SetupUI(){
        tableView.backgroundColor = .yellow.withAlphaComponent(0.7)
        view.addSubViews(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leadingAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.trailingAnchor)
    }
}

extension EpisodeVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .yellow.withAlphaComponent(0.5)
        cell.textLabel?.text = AllEpisodes[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEpisode = AllEpisodes[indexPath.row]
        let detailsVC = EpisodeDetailsVC()
        self.selectEpisodeDelegate = detailsVC
        selectEpisodeDelegate?.selectedEpisode(episodemodel: selectedEpisode)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

