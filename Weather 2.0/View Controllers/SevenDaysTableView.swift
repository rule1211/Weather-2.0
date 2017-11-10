//
//  SevenDaysTableView.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 10.11.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import UIKit

class SevenDaysTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    
    
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SevenDaysCell
        cell.date.text = "\(CurrentWeather.CodingKeys.dateTime)"

        return cell
        
    }
    
}
