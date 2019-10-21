//
//  NewsScreenView.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/20/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class NewsScreenViewController: UIViewController , UITableViewDelegate{
    
    @IBOutlet weak var newsTable: UITableView!
    let newsScreenAdaptor = NewsScreenAdaptor()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.delegate = self
        newsTable.dataSource = newsScreenAdaptor
        
        let headerNib = UINib.init(nibName: "NewsTableHeader", bundle: Bundle.main)
        newsTable.register(headerNib, forHeaderFooterViewReuseIdentifier: "NewsTableHeader")
        
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

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsTableHeader") as! NewsTableHeader
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 600
    }

}

