//
//  CoinData.swift
//  ByteCoin
//
//  Created by Camilo Moreno on 26/03/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct CoinData: Decodable {
    let rate: Double
    let asset_id_quote: String
}
