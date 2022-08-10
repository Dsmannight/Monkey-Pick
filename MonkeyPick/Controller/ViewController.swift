//
//  ViewController.swift
//  MonkeyPick
//
//  Created by Santiago Hernandez on 8/8/22.
//

import UIKit

class ViewController: UIViewController, StockPickerDelegate {
    
    //Labels
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var industryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var stockPicker = StockPicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        stockPicker.delegate = self //Set StockPickerDelegate to self
    }
    
    @IBAction func randomStockBtnPressed(_ sender: UIButton) {
        //Call readLocalFile from StockPicker
        stockPicker.readLocalFile(jsonFile: "miscStocks")
    }
    
    func pickedRandomStock(stock: StockModel) {
        //Make current view main
        DispatchQueue.main.async {
            //Change labels to random StockModel
            self.tickerLabel.text = stock.ticker
            self.nameLabel.text = stock.name
            self.industryLabel.text = stock.industry
        }
    }
    
    
    
}

