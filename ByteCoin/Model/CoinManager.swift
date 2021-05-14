//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinModel: CoinModel)
}
struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "4F626469-A3B2-40DB-9E34-77079C3AA21E"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(currency: String) {
        let coinUrl = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        if let url = URL(string: coinUrl) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData){
                        delegate?.didUpdateCoin(bitcoinPrice)
                    }
                }
                
            }
            task.resume()
        }
    }
    
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            let asset = decodedData.asset_id_quote
            
            let coin = CoinModel(bitcoinRate: rate, currency: asset)
            print(rate)
            return coin
            
        } catch  {
            print(error)
            return nil
        }
        
    }
    
}
