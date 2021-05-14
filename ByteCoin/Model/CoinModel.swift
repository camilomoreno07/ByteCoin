//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Camilo Moreno on 27/03/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    
    let bitcoinRate: Double
    let currency: String
    
    var decimalCoin: String{
        return String(format: "%.2f", bitcoinRate)
    }
}
