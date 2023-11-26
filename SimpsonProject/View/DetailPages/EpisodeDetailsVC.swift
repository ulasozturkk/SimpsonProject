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
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupUI()
    }
    
    func selectedEpisode(episodemodel: EpisodeModel) {
        selectedEpisode = episodemodel
    }
    
    func UpdateUI(){
        guard let selectedEpisode = selectedEpisode else { return }
        self.seasonLabel.text = "season :  \(String(selectedEpisode.season))"
        self.rating.text = "rating : \(String(selectedEpisode.rating))"
        self.desc.text = "Description \n \n \(selectedEpisode.description)"
        self.airDate.text = "Air Date : \(selectedEpisode.airDate)"
        self.thumbnailURL.text = "Thumbnail URL : \(selectedEpisode.thumbnailURL)"
    }
    
    func setupUI(){
        view.enableConstraints(seasonLabel,rating,airDate,thumbnailURL)
        view.addSubview(stackView)
        view.addSubview(scrollView)
        desc.textColor = .black
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.addArrangedSubviews(views: seasonLabel,rating,airDate,thumbnailURL)
        scrollView.addSubview(desc)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isScrollEnabled = true
        scrollView.contentInsetAdjustmentBehavior = .automatic
        desc.numberOfLines = 0
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leadingAnchor,right: view.safeAreaLayoutGuide.trailingAnchor,height: view.safeAreaLayoutGuide.heightAnchor,heightMultiplier: 0.6)
        
        scrollView.anchor(top: stackView.bottomAnchor,left: view.safeAreaLayoutGuide.leadingAnchor,right: view.safeAreaLayoutGuide.trailingAnchor,paddingTop: screenHeight * 0.05,height: view.safeAreaLayoutGuide.heightAnchor,heightMultiplier: 0.35)
        
        desc.anchor(top: scrollView.topAnchor,left: scrollView.leadingAnchor,bottom: scrollView.bottomAnchor, right: scrollView.trailingAnchor,width: scrollView.widthAnchor)
    }
}
