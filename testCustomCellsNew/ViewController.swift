//
//  ViewController.swift
//  testCustomCellsNew
//
//  Created by Chucks Mac Book on 11/14/17.
//  Copyright © 2017 Chucks Mac Book. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalAmountLabel: UILabel!
    var total: Int = 0
    @IBOutlet weak var tableView: UITableView!
    var calcDelegate: calculateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self // When creating a tableview seperately from from the tableViewController,  you need to setup thhe datasource as self and set up a tableVeiw outlet at the top.....then you can set the customcell values
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
var count: Int = 1
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "powerCell", for: indexPath) as! CustomCell
        if indexPath.row != 0 {
            count = count * 10
        }
        cell.powerLevelLabel.text = String(describing: count)
        // you also need to say that this custom cell will be the delegate
        // to pass the information.
        // so each cell is now a delegate....each cell will pass info
        // when the button is pressed.
        cell.delegate = self
       
        return cell
    }
}

extension ViewController: calculateDelegate{
    // this will subscribe to the delegate and will always receive the updates.
    func calculate(addAmount: Int) {
        self.total = total + addAmount
        totalAmountLabel.text = "Total: \(self.total)"
    }
}
