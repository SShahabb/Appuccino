//
//  Menu_Screen.swift
//  Appuccino_Test
//
//  Created by Guest User on 11/29/18.
//  Copyright Â© 2018 Guest User. All rights reserved.
//

import UIKit

class Menu_Screen: UIViewController
{
    
    @IBOutlet weak var Points: UILabel!
    
    @IBOutlet weak var MenuSearch: UISearchBar!
    
    @IBOutlet weak var MenuList: UITableView!
    
    var list = ["Drip Coffee", "Mocha", "Latte", "Cappuccino", "Americano", "Espresso", "Chai Latte", "Hot Tea", "Cider", "Hot Chocolate", "Iced Mocha", "Iced Latte", "Cold Brew", "Iced Tea", "Forzen Mocha", "Frappe", "Italian Soda", "Smoothie-Strawberry", "Smoothie-Strawberry/Banana", "Bagel W/Cream Cheese", "Bagel W/Jam", "Plain Bagel", "Biscotti", "Brownies", "Cinnamon Rolls", "Cookies", "Muffins", "Scones", "Strudel", "Yogurt Parfait", "Breakfast Sammich", "Breakfast Wrap", "Avacado Toast", "Santa Fe Toast"]
    
    struct itemMenu {
        var itemCategory : String
        var itemName : String
    }
    
  /*  var menuItems = [
        itemMenu(itemCategory:"Coffee", itemName:"Drip Coffee"),
        itemMenu(itemCategory:"Coffee", itemName:"Mocha"),
        itemMenu(itemCategory:"Coffee", itemName:"Latte"),
        itemMenu(itemCategory:"Coffee", itemName:"Americano"),
        itemMenu(itemCategory:"Coffee", itemName:"Expresso"),
        itemMenu(itemCategory:"Coffee", itemName:"Iced Mocha"),
        itemMenu(itemCategory:"Coffee", itemName:"Iced Latte"),
        itemMenu(itemCategory:"Coffee", itemName:"Cold Brew"),
        itemMenu(itemCategory:"Coffee", itemName:"Frozen Mocha"),
        itemMenu(itemCategory:"Coffee", itemName:"Frappe"),
        itemMenu(itemCategory:"Tea", itemName:"Chai Latte"),
        itemMenu(itemCategory:"Tea", itemName:"Hot Tea"),
        itemMenu(itemCategory:"Tea", itemName:"Iced Tea"),
        itemMenu(itemCategory:"Smoothies", itemName:"Strawberry"),
        itemMenu(itemCategory:"Smoothies", itemName:"Strawberry-Banana"),
        itemMenu(itemCategory:"Smoothies", itemName:"Peach"),
        itemMenu(itemCategory:"Smoothies", itemName:"Wild Berry"),
        itemMenu(itemCategory:"Smoothies", itemName:"Mango"),
        itemMenu(itemCategory:"Smoothies", itemName:"Pina Colada"),
        itemMenu(itemCategory:"Misc. Drinks", itemName:"Cider"),
        itemMenu(itemCategory:"Misc. Drinks", itemName:"Italian Soda"),
        itemMenu(itemCategory:"Bakery", itemName:"Bagel W/Cream Cheese"),
        itemMenu(itemCategory:"Bakery", itemName:"Bagel W/Jam"),
        itemMenu(itemCategory:"Bakery", itemName:"Bagel Plain"),
        itemMenu(itemCategory:"Bakery", itemName:"Biscotti"),
        itemMenu(itemCategory:"Bakery", itemName:"Brownies"),
        itemMenu(itemCategory:"Bakery", itemName:"Cinnamon Rolls"),
        itemMenu(itemCategory:"Bakery", itemName:"Cookies"),
        itemMenu(itemCategory:"Bakery", itemName:"Muffins"),
        itemMenu(itemCategory:"Bakery", itemName:"Scones"),
        itemMenu(itemCategory:"Bakery", itemName:"Strudel"),
        itemMenu(itemCategory:"Breakfast", itemName:"Yogurt Parfait"),
        itemMenu(itemCategory:"Breakfast", itemName:"Breakfast Sandwich"),
        itemMenu(itemCategory:"Breakfast", itemName:"Breakfast Wrap"),
        itemMenu(itemCategory:"Breakfast", itemName:"Avocado Toast"),
        itemMenu(itemCategory:"Breakfast", itemName:"Santa Fe Toast"),
    ] */
    
    var SearchItem = [String]()
    var Searching = false

    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension Menu_Screen: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Searching {
            return SearchItem.count
        } else {
            return list.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        if Searching {
            Cell.textLabel?.text = SearchItem[indexPath.row]
            
        } else {
            Cell.textLabel?.text = list[indexPath.row]
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
        
        
        switch self.list[indexPath.row] {
        
        case "Drip Coffee":
            self.Points.text = pointIndex
            
        case "Mocha":
            self.Points.text = pointIndex
            
        case "Latte":
            self.Points.text = pointIndex
            
        case "Cappuccino":
            self.Points.text = pointIndex
        
        case "Americano":
            self.Points.text = pointIndex
            
        case "Expresso":
            self.Points.text = pointIndex
        
        case "Iced Mocha":
            self.Points.text = pointIndex
            
        case "Iced Latte":
            self.Points.text = pointIndex
            
        case "Cold Brew":
            self.Points.text = pointIndex
            
        case "Frozen Mocha":
            self.Points.text = pointIndex
            
        case "Frappe":
            self.Points.text = pointIndex
  
        default:
              print("Purchased a food item instead of a coffee item.")
            } 
        
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

extension Menu_Screen: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        SearchItem = list.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
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



