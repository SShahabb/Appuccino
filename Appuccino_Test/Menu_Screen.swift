//
//  Menu_Screen.swift
//  Appuccino_Test
//
//  Created by Jess on 12/7/18.
//  Copyright © 2018 Jess. All rights reserved.
//

import UIKit
import MapKit

class Menu_Screen: UIViewController {
    //references to other view controllers
//    var MapVC: Map_Screen?
//    var ConfigVC: Config_Screen?
    
    @IBOutlet weak var Points: UILabel!
    @IBOutlet weak var MenuSearch: UISearchBar!
    @IBOutlet weak var MenuList: UITableView!
    
    let list = [
        "Coffee": ["Drip Coffee", "Mocha", "Latte", "Cappuccino", "Americano", "Espresso", "Iced Mocha", "Iced Latte", "Cold Brew", "Frozen Mocha", "Frappe"],
        "Tea": ["Chai Latte", "Hot Tea", "Iced Tea"],
        "Mis.": ["Italian Soda", "Cider"],
        "Smoothies": ["Smoothie-Strawberry", "Smoothie-Strawberry/Banana", "Peach", "Wild Berry", "Pina Colada"],
        "Bakery": ["Bagel W/Cream Cheese", "Bagel W/Jam", "Plain Bagel", "Biscotti", "Brownies", "Cinnamon Rolls", "Cookies", "Muffins", "Scones", "Strudel"],
        "Breakfast": ["Yogurt Parfait", "Breakfast Sammich", "Breakfast Wrap", "Avacado Toast", "Santa Fe Toast"]
    ]
    
    struct items {
        var itemName: String!
        var itemObjects: [String]!
    }
    
    var itemArray = [items]()
    var SearchItem = [String]()
    var Searching = false
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        //reference to other VC's
//        let tabBarControllerArray1 = self.tabBarController!.viewControllers
//        let tabBarControllerArray2 = self.tabBarController!.viewControllers
//        let viewController1 = tabBarControllerArray1?[1]
//        let viewController2 = tabBarControllerArray2?[2]
//        MapVC = viewController1 as? Map_Screen
//        ConfigVC = viewController2 as? Config_Screen
        
        // Do any additional setup after loading the view.
        for(key, value) in list {
            print("\(key) -> \(value)")
            itemArray.append(items(itemName: key, itemObjects: value))
        }
    }
}

extension Menu_Screen: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { return itemArray.count }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { return itemArray[section].itemName }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Searching {
            return SearchItem.count
        } else {
            return itemArray[section].itemObjects.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCell
        if Searching {
            Cell.textLabel?.text = SearchItem[indexPath.row]
        } else {
            Cell.textLabel?.text = itemArray[indexPath.section].itemObjects[indexPath.row]
        }
        return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row <= 10 {
            if(index == 10) { index = 0 }
            index += 1
            Points.text = ("Your Appuccino Points: \(index)")
        }
    }
}

extension Menu_Screen: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar) { //textDidChange searchText: String was in the function
//        if searchBar.MenuSearch.text! == "" {
//            filteredItems = itemArray
//        } else {
//            filteredItems.removeAll()
//            var ItemsArray = [items]()
//            for (_, value) in itemArray {
//                ItemsArray += value
//            }
//            let itemsFilteredArray = ItemsArray.filter { $0.getName().lowercased().contains(searchBar.MenuSearch.text!.lowercased() }
//            for filteredItems in itemsFilteredArray {
//                if let letter = filteredItems.getName().characters.first {
//                    if filteredItems[String(letter)] != nil {
//                        filteredItems[String(letter)]?.append(filteredItems)
//                    } else {
//                        filteredItems[String(letter)] = [filteredName]
//                    }
//                }
//            }
//        }
//        self.MenuList.reloadData()
//
//        //===================This is all the old code, unhighlight if need to revert back============
//        //SearchItem = list.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
//        //var searchResult = list.flatMap({$0}).filter {$0.lowercased().contains(searchText)}
//        //Searching = true
//        //MenuList.reloadData()
//    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Searching = false
        searchBar.text = ""
        MenuList.reloadData()
    }
}


