//
//  ViewController.swift
//  MonkeyPick
//
//  Created by Santiago Hernandez on 8/8/22.
//

import UIKit

class MonkeyViewController: UIViewController, StockPickerDelegate {
    
    //Variables
    var ticker : String?
    var name : String?
    var industry : String?
    
    var stockPicker = StockPicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        stockPicker.delegate = self //Set StockPickerDelegate to self
        stockPicker.readLocalFile(jsonFile: "miscStocks")
    }
    
    @IBAction func randomStockBtnPressed(_ sender: UIButton) {
        //Call readLocalFile from StockPicker
        stockPicker.readLocalFile(jsonFile: "miscStocks")
        
        self.performSegue(withIdentifier: "goToStocks", sender: self)
    }
    
    func pickedRandomStock(stock: StockModel) {
        //Make current view main
        DispatchQueue.main.async {
            //Change labels to random StockModel
            self.ticker = stock.ticker
            self.name = stock.name
            self.industry = stock.industry
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToStocks" {
            let destinationVC = segue.destination as! StockViewController
            destinationVC.ticker =  self.ticker
            destinationVC.name =  self.name
            destinationVC.industry =  self.industry
        }
    }
    
}

