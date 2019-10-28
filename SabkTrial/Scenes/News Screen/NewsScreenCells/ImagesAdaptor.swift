//
//  ImagesAdaptor.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/23/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import UIKit
import DateToolsSwift
import Localize_Swift

class ImagesAdaptor: NSObject, UICollectionViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout {

    var images: [Comics] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImagesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as! ImagesCollectionViewCell
        cell.imageTitle.text = images[indexPath.row].title
        cell.image.sd_setImage(with: URL(string: images[indexPath.row].coverPhoto ?? ""), placeholderImage: UIImage(named: "img_placeholder"))
        let publishDate = images[indexPath.row].publishDate

        //      NSInteger yearsApart = [firstDate yearsFrom:secondDate];

        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ar")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm ss"
        dateFormatter.locale = Locale(identifier: "ar")
        let publishingDate: Date = dateFormatter.date(from: publishDate ?? "") ?? Date()
        let current: String = dateFormatter.string(from: Date())
        let currentDate: Date = dateFormatter.date(from: current) ?? Date()

        let timeApart = TimePeriod(beginning: publishingDate, end: currentDate)

        //       print( timeApart.years.years.earlier.format(with: "yyyy-MM-dd HH:mm ss", locale: Locale.init(identifier: "ar")) )

        //        let yearsApart = timeApart.years
        //        let yearsAgo = yearsApart.years.earlier
        ////        print("Time Ago: ", yearsAgo.format(with: <#T##DateFormatter.Style#>, locale: <#T##Locale#>))
        //
        //        let timeAgoDate = 2.days.earlier
        //        print(timeAgoDate.timeAgoSinceNow)
        //
        currentDate.format(with: "yyyy", locale: Locale(identifier: "ar"))
        publishingDate.format(with: "yyyy", locale: Locale(identifier: "ar"))

        let yearsAgo = currentDate.timeAgo(since: publishingDate)
        //        let loc =
        print(yearsAgo)
        //        let loc = currentDate.format(with: "yyyy-MM-dd HH:mm ss", locale: Locale.init(identifier: "ar"))
        //        print(loc)

        ////        let timePeriod : TimePeriod = TimePeriod(beginning: publishingDate, end: currentDate)
        //        print(timePeriod.years)
        //        if(timePeriod.years > 0){
        //            let years = timePeriod.years
        //            print(years)
        //
        //            let yearsAgoDate = years.years.earlier
        //            print(yearsAgoDate)
        //            let yearsAgo = yearsAgoDate.timeAgo(since: <#T##Date#>)
        //            let loc = yearsAgoDate.format(with: "yyyy-MM-dd HH:mm ss", locale: Locale.init(identifier: "ar"))
        //            print(loc)
        //            print(yearsAgoDate.timeAgoSinceNow.folding(locale: Locale.init(identifier: "ar")))

        //        }

        //        let years = currentDate.years(from: publishingDate)
        //        let months = currentDate.months(from: publishingDate) - years*12
        //        let days = currentDate.days(from: publishingDate) - months*30
        //        let daysAgoDate = days.days.earlier
        //        print("Time Ago: ", daysAgoDate.timeAgoSinceNow)
        //        print(years)
        //        print(months)
        //        print(days)
        //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //        print("\(dateFormatter.string(from: publishingDate))")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 0.75 * collectionView.frame.size.width, height: collectionView.frame.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 45
    }

}
