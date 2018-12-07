//
//  Menu_Screen.swift
//  Appuccino_Test
//
//  Created by Guest Jess on 12/7/18.
//  Copyright Â© 2018 Jess. All rights reserved.
//

import UIKit
import Mapkit

class Menu_Screen: UIViewController { //UITableViewController    
    @IBOutlet weak var Points: UILabel!
    @IBOutlet weak var MenuSearch: UISearchBar!
    @IBOutlet weak var MenuList: UITableView!
   
    let list = [
        Coffee: "Drip Coffee", "Mocha", "Latte", "Cappuccino", "Americano", "Espresso", "Iced Mocha", "Iced Latte", "Cold Brew", "Frozen Mocha", "Frappe"
        Chai Latte, "Hot Tea", "Iced Tea",
        Misc.: "Italian Soda", "Cider", 
        Smoothies: "Smoothie-Strawberry", "Smoothie-Strawberry/Banana", "Peach", "Wild Berry", "Pina Colada", 
        Bakery: "Bagel W/Cream Cheese", "Bagel W/Jam", "Plain Bagel", "Biscotti", "Brownies", "Cinnamon Rolls", "Cookies", "Muffins", "Scones", "Strudel", 
        Breakfast: "Yogurt Parfait", "Breakfast Sammich", "Breakfast Wrap", "Avocado Toast", "Santa Fe Toast"
    ]
    
    var itemArray = [String]() 
    var SearchItem = [String]()
    var Searching = false
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension Menu_Screen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.section.count //was return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Searching {
            return SearchItem.count
        } else {
            return self.list[section].count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        if Searching {
            Cell.textLabel?.text = SearchItem[indexPath.row]
        } else {
            Cell.textLabel?.text = list[indexPath.section][indexPath.row]
        }
        return Cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        func setPoints() -> Int {
            if(index == 10) {
                index = 0
            }
            index += 1
            return(index)
        }
        
        let pointIndex = "Your Appuccino Points: \(setPoints())"
        
        for food in list {
            if food.key == "Coffee" {
                self.Points.text = pointIndex
        }
        
    }
}
    
extension Menu_Screen: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //SearchItem = list.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        var searchResult = list.flatMap({$0}).filter {$0.lowercased().contains(searchText)}
        Searching = true
        MenuList.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Searching = false
        searchBar.text = ""
        MenuList.reloadData()
    }
}


