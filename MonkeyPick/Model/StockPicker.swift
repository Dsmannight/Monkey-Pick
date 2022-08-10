//
//  StockPicker.swift
//  MonkeyPick
//
//  Created by Santiago Hernandez on 8/9/22.
//

import Foundation

//Delegate for StockPicker
protocol StockPickerDelegate{
    //Expected function from current delegate
    func pickedRandomStock(stock: StockModel)
}

struct StockPicker {
    
    var delegate: StockPickerDelegate?
    
    func readLocalFile(jsonFile sectorGroup : String){
        //Get local json file
        let path = Bundle.main.path(forResource: sectorGroup, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        //Create URL Session
        let session = URLSession(configuration: .default)
        
        //Give session a task
        let task = session.dataTask(with: url) {(data, response, error) in
            if error != nil {
                //Error handling
                print(error!)
                return
            }
            
            //Get data
            if let safeData = data {
                //Parse data
                if let stock = self.parseJSON(theData: safeData) {
                    //Pass random stock to current delegate
                    self.delegate?.pickedRandomStock(stock: stock)
                }
            }
        }
        
        //Start the task
        task.resume()
    }

    func parseJSON(theData: Data) -> StockModel? {
        let decoder = JSONDecoder()
        do {
            //Get random key of avalaible stock
            let decodedData = try decoder.decode(MiscStocks.self, from: theData)
            let randomKey = decodedData.Symbol?.dictionary?.randomElement()?.key
            
            //Get ticker, name, industry, and sector of the random stock
            let ticker = (decodedData.Symbol?.dictionary?[randomKey ?? "114"]! ?? "Stonk") as! String
            let industry = (decodedData.Industry?.dictionary?[randomKey ?? "114"]! ?? "Industry") as! String
            let name = (decodedData.Name?.dictionary?[randomKey ?? "114"]! ?? "Name") as! String
            let sector = (decodedData.Sector?.dictionary?[randomKey ?? "114"]! ?? "Sector") as! String
            
            //Create a stockModel to use between files
            let stockModel = StockModel(ticker: ticker, name: name, industry: industry, sector: sector)
            return stockModel
            
        } catch{
            //Error handling
            print(error)
            return nil
        }
    }
}
