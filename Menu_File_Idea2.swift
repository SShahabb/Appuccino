//
//  Menu_Screen.swift
//  Appuccino_Test
//
//  Created by Guest User on 11/29/18.
//  Copyright Â© 2018 Guest User. All rights reserved.
//

import UIKit

class Menu_Screen: UIViewController, UITableViewDelegate, UISearchBarDelegate
{
    
    @IBOutlet weak var Points: UILabel!
    
    @IBOutlet weak var MenuSearch: UISearchBar!
    
    @IBOutlet weak var MenuList: UITableView!
    
    var menuArray = [Menu]()
    var currentMenuArray = [Menu]() 
    
    override func viewDidLoad() {
      super.viewDidLoad()
      seUpMenu()
      setUpSearchBar()
      alterLayout()
    }
 
  private func setUpMenu() {
    menuArray.append(Menu(name: "Drip Coffee", category: .Coffee)),
    menuArray.append(Menu(name: "Mocha", category: .Coffee)),
    menuArray.append(Menu(name: "Latte", category: .Coffee)),
    menuArray.append(Menu(name: "Americano", category: .Coffee)),
    menuArray.append(Menu(name: "Expresso", category: .Coffee)),
    menuArray.append(Menu(name: "Iced Mocha", category: .Coffee)),
    menuArray.append(Menu(name: "Iced Latte", category: .Coffee)),
    menuArray.append(Menu(name: "Cold Brew", category: .Coffee)),
    menuArray.append(Menu(name: "Frozen Mocha", category: .Coffee)),
    menuArray.append(Menu(name: "Frappe", category: .Coffee)),
    menuArray.append(Menu(name: "Chai Latte", category: .Tea)),
    menuArray.append(Menu(name: "Hot Tea", category: .Tea)),
    menuArray.append(Menu(name: "Iced Tea", category: .Tea)),
    menuArray.append(Menu(name: "Strawberry", category: .Smoothies)),
    menuArray.append(Menu(name: "Strawberry-Banana", category: .Smoothies)),
    menuArray.append(Menu(name: "Peach", category: .Smoothies)),
    menuArray.append(Menu(name: "Wild Berry", category: .Smoothies)),
    menuArray.append(Menu(name: "Mango", category: .Smoothies)),
    menuArray.append(Menu(name: "Pina Colada", category: .Smoothies)),
    menuArray.append(Menu(name: "Cider", category: .Misc)),
    menuArray.append(Menu(name: "Italian Soda", category: .Misc)),
    menuArray.append(Menu(name: "Bagel W/Cream Cheese", category: .Bakery)),
    menuArray.append(Menu(name: "Bagel W/Jam", category: .Bakery)),
    menuArray.append(Menu(name: "Bagel Plain", category: .Bakery)),
    menuArray.append(Menu(name: "Biscotti", category: .Bakery)),
    menuArray.append(Menu(name: "Brownies", category: .Bakery)),
    menuArray.append(Menu(name: "Cinnamon Rolls", category: .Bakery)),
    menuArray.append(Menu(name: "Cookies", category: .Bakery)),
    menuArray.append(Menu(name: "Muffins", category: .Bakery)),
    menuArray.append(Menu(name: "Scones", category: .Bakery)),
    menuArray.append(Menu(name: "Strudel", category: .Bakery)),
    menuArray.append(Menu(name: "Yogurt Parfait", category: .Breakfast)),
    menuArray.append(Menu(name: "Breakfast Sandwich", category: .Breakfast)),
    menuArray.append(Menu(name: "Breakfast Wrap", category: .Breakfast)),
    menuArray.append(Menu(name: "Avocado Toast", category: .Breakfast)),
    menuArray.append(Menu(name: "Santa Fe Toast", category: .Breakfast))
    
    currentMenuArray = menuArray
}

private func setUpSearchBar() {
  searchBar.delegate = self
}

func alterLayout() {
  table.tableHeaderView = UIView()
  
  table.estimatedSectionHeaderHeight = 50
  
  navigationItem.titleView = searchBar
  searchBar.showsScopeBar = false
  searchBar.placeHolder = "Search Here"
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return currentMenuArray.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else {
    return UITableViewCell()
   }
   cell.nameLbl.text = currentMenuArray[indexPath.row].name
   cell.categoryLbl.text = currentMenuArray[indexPath.row].category.rawValue
   cell.imgView.image = UIImage(named:currentMenuArray[indexPath.row.image)
   return cell
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  return 100
}

func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
  currentMenuArray = menuArray.filter({ items -> Bool in
    switch searchBar.selectedScopeButtonIndex {
    case 0:
      if searchText.isEmpty {return true}
      return items.name.lowercased().contains(searchText.lowercased())
    case 1: 
      if searchText.isEmpty {return items.category == .Coffee}
      return items.name.lowercased().contains(searchText.lowercased()) && items.category == .Coffee
    case 2:
      if searchText.isEmpty { return items.category == .Tea}
      return items.name.lowercased().contains(searchText.lowercased()) && items.category ==.Tea
    case 3:
      if searchText.isEmpty {return items.category == .Misc)
      return items.name.lowercased().contains(searchText.lowercased()) && items.category == .Misc
    case 4:
      if searchText.isEmpty {return items.category == .Smoothies)
      return items.name.lowercased().contains(searchText.lowercased()) && items.category == .Smoothies
    case 5:
      if searchText.isEmpty {return items.category == .Bakery)
      return items.name.lowercased().contains(searchText.lowercased()) && items.category == .Bakery
    case 6:
      if searchText.isEmpty {return items.category == .Breakfast)
      return items.name.lowercased().contains(searchText.lowercased()) && items.category == .Breakfast
    default:
      return false
      }
   })
   MenuList.reloadData()
}

func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
  switch selectedScope {
  case 0:
    currentMenuArray = menuArray
  case 1:
    currentMenuArray = menuArray.filter({items -> Bool in items.category == ItemType.Coffee })
  case 2:
    currentMenuArray = menuArray.filter({ items -> Bool in items.category == ItemType.Tea })
  case 3:
    currentMenuArray = menuArray.filter({ items -> Bool in items.category == ItemType.Misc.})
  case 4: 
    currentMenuArray = menuArray.filter({ items -> Bool in items.category == ItemType.Bakery})
  case 5:
    currentMenuArray = menuArray.filter({ items -> Bool in items.category == ItemType.Breakfast})
  default:
    break
  }
  MenuList.reloadData()
 }
}

class Items {
  let name: String
  let category: ItemType
  
  init(name: String, category: ItemType) {
    self.name = name
    self.category = category
  }
}

enum ItemType: String {
  case Coffee = "Coffee"
  case Tea = "Tea"
  case Misc. = ".Misc"
  case Bakery = "Bakery"
  case Breakfast = "Breakfast"
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



