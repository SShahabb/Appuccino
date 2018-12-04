import UIKit

class Menu_Screen: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  //Label Connection on MainStoryBoard
  @IBOutlet weak var Points: UILabel!
  
  //Search Bar Connection on MainStoryBoard
  @IBOutlet weak var MenuSearch: UISearchBar!
  
  //TableView Conenction on MainStoryBoard
  @IBOutlet weak var MenuList: UITableView!
  
  //Creating an array to hold all the items that can be purchased
  var list = ["Coffee", "Salad", "Bacon", "Egg", "Cappuccino", "Zebra", "Expresso"] //Currently a basic idea, somehow want to go back and change this so we can have categories, but for now this works
  
  //Creating an array to put the search item in
  var SearchItem = [String]()
  
  //Creating a bool variable
  var Searching = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
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
    UITableViewCell {
      let Cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
      
      if Searching {
        Cell.textLabel?.text = SearchItem[indexPath.row]
      } else {
        Cell.textLabel?.text = list[indexPath.row]
      }
      return Cell
    }
  }
  
  extension Menu_Screen: UISearchBarDelegate {
    
    func searchBar(_ searchBar, textDidChange searchText: String) {
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
}
