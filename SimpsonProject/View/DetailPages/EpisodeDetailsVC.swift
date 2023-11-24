//
//  EpisodeDetailsVC.swift
//  SimpsonProject
//
//  Created by macbook pro on 25.11.2023.
//

import UIKit

class EpisodeDetailsVC: UIViewController,selectedEpisodeDelegate {
    
    var stackView = UIStackView()
    var seasonLabel = UILabel()
    var rating = UILabel()
    var desc = UILabel()
    var airDate = UILabel()
    var thumbnailURL = UILabel()
    var scrollView = UIScrollView()
    var selectedEpisode : EpisodeModel? {
        didSet{
            UpdateUI()
        }
    }
    
    override func viewDidLoad() {
        print("viewdidload çalıştı")
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupUI()
        
    }
    
    func UpdateUI(){
        print("updateUI çalıştı")
        guard let selectedEpisode = selectedEpisode else { return }
        self.seasonLabel.text = "season :  \(String(selectedEpisode.season))"
        self.rating.text = "rating : \(String(selectedEpisode.rating))"
        self.desc.text = "Description \n \n \(selectedEpisode.description)"
        self.airDate.text = "Air Date : \(selectedEpisode.airDate)"
        self.thumbnailURL.text = "Thumbnail URL : \(selectedEpisode.thumbnailURL)"
        print(desc.text)
    }
    
    func setupUI(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        seasonLabel.translatesAutoresizingMaskIntoConstraints = false
        rating.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false
        airDate.translatesAutoresizingMaskIntoConstraints = false
        thumbnailURL.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        view.addSubview(scrollView)
        desc.textColor = .black
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(seasonLabel)
        stackView.addArrangedSubview(rating)
        stackView.addArrangedSubview(airDate)
        stackView.addArrangedSubview(thumbnailURL)
        scrollView.addSubview(desc)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isScrollEnabled = true
        scrollView.contentInsetAdjustmentBehavior = .automatic
        desc.numberOfLines = 0
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        
        
        NSLayoutConstraint.activate( [
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
            
            scrollView.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: screenHeight * 0.05),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.35),
            desc.topAnchor.constraint(equalTo: scrollView.topAnchor),
            desc.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            desc.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            desc.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            desc.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
    }
    
    func selectedEpisode(episodemodel: EpisodeModel) {
        print("selected ep çalıştı")
        selectedEpisode = episodemodel
    }
    
    
}
