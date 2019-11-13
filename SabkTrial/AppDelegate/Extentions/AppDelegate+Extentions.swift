//
//  AppDelegate+Extentions.swift
//  SabkTrial
//
//  Created by Samira.Marassy on 10/17/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import Foundation

extension AppDelegate {
    func setupNetworking() {
        NetworkManager.shared = NetworkManager(config: NetworkDefaults())
    }

}
