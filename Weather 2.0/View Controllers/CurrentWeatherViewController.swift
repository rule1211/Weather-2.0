//
//  CurrentWeatherViewController.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 11.10.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeatherViewController: UIViewController {
    
    // MARK:- Current Weather,Date and Time Label
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentIconImage: UIImageView!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentWindspeedLabel: UILabel!
    @IBOutlet weak var currentVisibilityLabel: UILabel!
    @IBOutlet weak var currentPressureLabel: UILabel!
    @IBOutlet weak var currentDescriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var constrainViewTable: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var arrow: UIView!
    
    var currentWeather: CurrentWeather?
    var forecastArray = [CurrentWeather?]()
    var currentTime = Date()
    let date = NSDate()
    let formatter = DateFormatter()
    var currentCity = "Belgrade"
    
    
    // MARK:- ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()


        tableView.delegate = self
        tableView.dataSource = self
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        timeLabel.text = "\(dateFormatter.string(from: currentTime))"
        formatter.dateFormat = "dd.MM.yyyy"
        dateLabel.text = formatter.string(from: date as Date)
        
        
        searchBar.showsCancelButton = false
        searchBar.tintColor = .white
        searchBar.delegate = self
        searchBar.placeholder = "Find your city here"
        searchBar.barTintColor = .white
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        loadData(for: currentCity)
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    // MARK: - LoadData
    
    func loadData(for city: String){
        ForecastService.sharedInstance.getCurrentWeatherFor(city: city) { result in
            
            self.currentWeather = result
            self.currentTemperatureLabel.text = "\(Int(result.mainJson.current.rounded()))"
            self.currentHumidityLabel.text = "\(result.mainJson.humidity)"
            self.currentCityLabel.text = "\(result.name)"
            self.currentWindspeedLabel.text = "\(result.windJson.speed)"
            self.currentPressureLabel.text = "\(result.mainJson.pressure)"
            self.currentDescriptionLabel.text = "\(result.weatherJson[0].someText)"
        }
        
        ForecastService.sharedInstance.getForecastFor(city: city) { (result) in
            self.forecastArray = result
            self.tableView.reloadData()
        }
    }
    
    @IBAction func buttonChangeConst(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {
            self.arrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        })
    
        if constrainViewTable.constant >= 200 {
            constrainViewTable.constant = 5
        } else {
            if constrainViewTable.constant <= 5 {
                constrainViewTable.constant = 200
            }
            
        }
    }
    
    
}

//MARK: - TableView

extension CurrentWeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SevenDaysCell
        
        let forecastDay = self.forecastArray[indexPath.row]
        if let vreme = forecastDay {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd.MM HH:mm"
            let date = dateformatter.string(from: vreme.dateTime)
            cell.date.text = date
            cell.tempMax.text = "\(vreme.temperature!.max.rounded().cleanValue)"
            cell.tempMin.text = "\(vreme.temperature!.min.rounded().cleanValue)"
        
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

// MARK: - SearchBAR

extension CurrentWeatherViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(false)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        self.currentCity = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        self.loadData(for: currentCity)
        self.searchBar.resignFirstResponder()
        searchBar.text = ""
    }
}
