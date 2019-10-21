//
//  BaseViewProtocol.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/21/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
@objc
protocol BaseViewProtocol: ViewLoadable, ViewFetchable, ViewMessageable {
    
}

@objc
protocol ViewLoadable {
    
    // MARK: - Load Indicator
    @objc
    optional func showLoading(allowNavigation:Bool)
    @objc
    optional func hideLoading()
}

@objc
protocol ViewFetchable {
    
    // MARK: - Load Data
    @objc
    optional func loadDataSuccess(date:Any)
    @objc
    optional func loadDataFailed(with error: Error?)
    
}

@objc
protocol ViewMessageable {
    
    // MARK: - Load Indicator
    @objc
    optional func showSuccessMessage(title: String?, message: String?)
    @objc
    optional func showErrorMessage(title: String?, message: String?)
    
}
