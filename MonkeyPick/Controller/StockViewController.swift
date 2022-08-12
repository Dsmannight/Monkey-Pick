//
//  StockViewController.swift
//  MonkeyPick
//
//  Created by Santiago Hernandez on 8/10/22.
//

import UIKit

class StockViewController: UIViewController {

    var ticker : String?
    var name : String?
    var industry : String?
    
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var industryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tickerLabel.text = ticker
        nameLabel.text = name
        industryLabel.text = industry
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
