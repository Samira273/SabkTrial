//
//  BasePresenterProtocol.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation
@objc
protocol PresenterLifeCycleProtocol {
    
    @objc
    optional func viewDidLoad()
    @objc
    optional func viewWillAppear()
    @objc
    optional func viewDidAppear()
    @objc
    optional func viewWillDisappear()
    @objc
    optional func viewDidDisappear()
}

protocol BasePresenterAssembable {
    
    associatedtype View where View : BaseViewProtocol
    associatedtype Model where Model : BaseModelProtocol
    
    /// weak refrance to view
    var view: View? { get set }
    /// strong refrance to model
    var model: Model { get set }
    
    init(view: View, model: Model)
}

protocol BasePresenterProtocol:PresenterLifeCycleProtocol {
    
}
