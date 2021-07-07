//
//  BaseViewController.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/21/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<Presenter: BasePresenterProtocol>: UIViewController, BaseViewProtocol {

    // MARK: - Public Variables

    // MARK: - Private Variables

    var presenter: Presenter!

    // MARK: - Computed Variables

    // MARK: - IBOutlets

    public func setPresenter (presenter: Presenter) {
        self.presenter = presenter
    }
}
