//
//  Menu_Screen.swift
//  Appuccino_Test
//
//  Created by Guest User on 11/29/18.
//  Copyright Â© 2018 Guest User. All rights reserved.
//

import UIKit

class Menu_Screen: UIViewController//, UITableViewController
{
    
    @IBOutlet weak var Points: UILabel!
    
    @IBOutlet weak var MenuSearch: UISearchBar!
    
    @IBOutlet weak var MenuList: UITableView!
    
    //let list = ["Drip Coffee", "Mocha", "Latte", "Cappuccino", "Americano", "Espresso", "Chai Latte", "Hot Tea", "Cider", "Hot Chocolate", "Iced Mocha", "Iced Latte", "Cold Brew", "Iced Tea", "Frozen Mocha", "Frappe", "Italian Soda", "Smoothie-Strawberry", "Smoothie-Strawberry/Banana", "Bagel W/Cream Cheese", "Bagel W/Jam", "Plain Bagel", "Biscotti", "Brownies", "Cinnamon Rolls", "Cookies", "Muffins", "Scones", "Strudel", "Yogurt Parfait", "Breakfast Sammich", "Breakfast Wrap", "Avacado Toast", "Santa Fe Toast"] //was a var
    
    
    //let list: Array<Array<<String>> = [["Drip Coffee", "Mocha", "Latte", "Cappuccino", "Americano", "Espresso", "Iced Mocha", "Iced Latte", "Cold Brew", "Frozen Mocha", "Frappe"], ["Chai Latte", "Hot Tea", "Iced Tea"], ["Italian Soda", "Cider"], ["Smoothie-Strawberry", "Smoothie-Strawberry/Banana", "Peach", "Wild Berry", "Pina Colada"], ["Bagel W/Cream Cheese", "Bagel W/Jam", "Plain Bagel", "Biscotti", "Brownies", "Cinnamon Rolls", "Cookies", "Muffins", "Scones", "Strudel"], ["Yogurt Parfait", "Breakfast Sammich", "Breakfast Wrap", "Avacado Toast", "Santa Fe Toast"]]
   
    let list: Array<Array<<String>> = [["Coffee":"Drip Coffee", "Coffee":"Mocha", "Coffee":"Latte", "Coffee":"Cappuccino", "Coffee":"Americano", "Coffee":"Espresso", "Coffee":"Iced Mocha", "Coffee":"Iced Latte", "Coffee":"Cold Brew", "Coffee":"Frozen Mocha", "Coffee":"Frappe"], ["Tea":"Chai Latte", "Tea":"Hot Tea", "Tea":"Iced Tea"], ["Misc.":"Italian Soda", "Misc.":"Cider"], ["Smoothies":"Smoothie-Strawberry", "Smoothies":"Smoothie-Strawberry/Banana", "Smoothies":"Peach", "Smoothies":"Wild Berry", "Smoothies":"Pina Colada"], ["Bakery":"Bagel W/Cream Cheese", "Bakery":"Bagel W/Jam", "Bakery":"Plain Bagel", "Bakery":"Biscotti", "Bakery":"Brownies", "Bakery":"Cinnamon Rolls", "Bakery":"Cookies", "Bakery":"Muffins", "Bakery":"Scones", "Bakery":"Strudel"], ["Breakfast":"Yogurt Parfait", "Breakfast":"Breakfast Sammich", "Breakfast":"Breakfast Wrap", "Breakfast":"Avacado Toast", "Breakfast":"Santa Fe Toast"]]
    
    
    let section: Array<String> = ["Coffee", "Tea", "Misc", "Smoothies", "Bakery", "Breakfast"] 
    
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
    
    //==============================================================
    
    
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



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

