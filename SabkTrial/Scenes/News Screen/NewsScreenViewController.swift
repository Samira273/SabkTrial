//
//  NewsScreenView.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/20/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit


class NewsScreenViewController: BaseViewController<NewsScreenPresenter> , NewsScreenViewProtocol{
    
    
    @IBOutlet weak var newsTable: UITableView!
    let newsScreenAdaptor = NewsScreenAdaptor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.delegate = newsScreenAdaptor
        newsTable.dataSource = newsScreenAdaptor
        presenter = NewsScreenPresenter(view: self, model: NewsScreenModel())
        presenter.loadData()
        newsTable.estimatedRowHeight = 100
        newsTable.rowHeight = UITableView.automaticDimension
        //registering custome cells
        newsTable.register(UINib(nibName: "SliderSectionCell", bundle: nil), forCellReuseIdentifier: "SliderSectionCell")
        newsTable.register(UINib(nibName: "NewsSectionCell", bundle: nil), forCellReuseIdentifier: "NewsSectionCell")
        newsTable.register(UINib(nibName: "VideosCell", bundle: nil), forCellReuseIdentifier: "VideosCell")
        newsTable.register(UINib(nibName: "ImagesCell", bundle: nil), forCellReuseIdentifier: "ImagesCell")
        
        
        //right bar button item
        let button = UIButton(type: .custom)
        button.setImage(UIImage (named: "notification_icon"), for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        //button.addTarget(target, action: nil, for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
        //central image in bar
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "img_logo")
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        //Make: add left bar button item
        
        
    }
    func showErrorMessage(title: String?, message: String?) {
        
    }
    
    func setSliders(sliders: [Slider]) {
        self.newsScreenAdaptor.slidersData = sliders
        self.newsTable.reloadData()
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
    
    
}

