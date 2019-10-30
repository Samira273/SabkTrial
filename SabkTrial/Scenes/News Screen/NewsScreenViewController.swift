//
//  NewsScreenView.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/20/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit
import Windless

class NewsScreenViewController: BaseViewController<NewsScreenPresenter>, NewsScreenViewProtocol {
    
    @IBOutlet private weak var newsTable: UITableView!
    let newsScreenAdaptor = NewsScreenAdaptor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.delegate = newsScreenAdaptor
        newsTable.dataSource = newsScreenAdaptor
        newsTable.windless.apply {
                          $0.beginTime = 1
                          $0.pauseDuration = 2
                          $0.duration = 3
                          $0.animationLayerOpacity = 0.5
            }.start()
        presenter = NewsScreenPresenter(view: self, model: NewsScreenModel())
        presenter.loadData()
        newsTable.estimatedRowHeight = 100
       
        newsTable.rowHeight = UITableView.automaticDimension
        registerTableCells()
        //right bar button item
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "notification_icon"), for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        //button.addTarget(target, action: nil, for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
        //central image in bar
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = #imageLiteral(resourceName: "img_logo")
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        //Make: add left bar button item
        
    }
    
    func registerTableCells() {
        //registering custome cells
        newsTable.register(
            UINib(nibName: "SliderSectionCell", bundle: nil),
            forCellReuseIdentifier: "SliderSectionCell")
        newsTable.register(
            UINib(nibName: "NewsSectionCell", bundle: nil),
            forCellReuseIdentifier: "NewsSectionCell")
        newsTable.register(
            UINib(nibName: "VideosCell", bundle: nil),
            forCellReuseIdentifier: "VideosCell")
        newsTable.register(
            UINib(nibName: "ImagesCell", bundle: nil),
            forCellReuseIdentifier: "ImagesCell")
        newsTable.register(
            UINib(nibName: "ArticlesCell", bundle: nil),
            forCellReuseIdentifier: "ArticlesCell")
        
    }
    func showErrorMessage(title: String?, message: String?) {
        
    }
    
    func setSliders(sliders: [Slider]) {
        self.newsScreenAdaptor.slidersData = sliders
        self.newsTable.reloadData()
        newsTable.windless.end()
    }
    func setMaterials(materials: [Materials]) {
        self.newsScreenAdaptor.matrialsData = materials
        self.newsTable.reloadData()
    }
    func setVideos(videos: [Comics]) {
        self.newsScreenAdaptor.videosData = videos
        self.newsTable.reloadData()
    }
    
    func setImages(images: [Comics]) {
        self.newsScreenAdaptor.imagesData = images
        self.newsTable.reloadData()
    }
    func setArticles(articles: [Materials]) {
        self.newsScreenAdaptor.articlesData = articles
        self.newsTable.reloadData()
    }
    
}
