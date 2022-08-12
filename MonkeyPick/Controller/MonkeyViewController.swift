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
    
    //Monkey Pick Misc
    @IBAction func randomStockBtnPressed(_ sender: UIButton) {
        //Call readLocalFile from StockPicker
        stockPicker.readLocalFile(jsonFile: "miscStocks")
        
        //Go to next page
        self.performSegue(withIdentifier: "goToStocks", sender: self)
    }
    
    //Monkey Pick Finance
    @IBAction func financeBtnPressed(_ sender: UIButton) {
        //Call readLocalFile from StockPicker
        stockPicker.readLocalFile(jsonFile: "financeStocks")
        
        //Go to next page
        self.performSegue(withIdentifier: "goToStocks", sender: self)
    }
    
    //Monkey Pick Tech
    @IBAction func techBtnPressed(_ sender: UIButton) {
        //Call readLocalFile from StockPicker
        stockPicker.readLocalFile(jsonFile: "techStocks")
        
        //Go to next page
        self.performSegue(withIdentifier: "goToStocks", sender: self)
    }
    
    //Monkey Pick Health Care
    @IBAction func healthBtnPressed(_ sender: UIButton) {
        //Call readLocalFile from StockPicker
        stockPicker.readLocalFile(jsonFile: "healthCareStocks")
        
        //Go to next page
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
    
    //Passes information through segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //When the segue is on the second page
        if segue.identifier == "goToStocks" {
            //Change view
            let destinationVC = segue.destination as! StockViewController
            
            //Change variables
            destinationVC.ticker =  self.ticker
            destinationVC.name =  self.name
            destinationVC.industry =  self.industry
        }
    }
    
}

