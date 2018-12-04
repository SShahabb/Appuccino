//
//  Menu_Screen.swift
//  Appuccino_Test
//
//  Created by Guest User on 11/29/18.
//  Copyright Â© 2018 Guest User. All rights reserved.
//

import UIKit

class Menu_Screen: UIViewController // UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
    
    @IBOutlet weak var Points: UILabel!
    
    @IBOutlet weak var MenuSearch: UISearchBar!
    
    @IBOutlet weak var MenuList: UITableView!
    
    var list = ["Coffee", "Bagel", "Bacon", "Cappuccino", "Apple", "Candy", "Xray", "Banana", "Expresso", "Zebra"]
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
            
            case "Coffee":
                self.Points.text = pointIndex
            
            case "Cappuccino":
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



