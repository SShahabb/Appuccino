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
  
  
  //========FUNCTIONS==================================================================================
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    if Searching
    {
     return(SearchingItem.count) 
    } else {
      return(list.count)
    }
  }
  
  public func tableView(_ tableView: UITablView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
    
    if Searching {
      cell.textLabel?.text = SearchItem[indexPath.row]
    } 
    else {
      cell.textLabel?.text = list[indexPath.row]
    }
    
    return(cell)
  }
  
  public func MenuSearch(_ MenuSearch: UISearchBar, textDidChange searchText: String)
  {
    SearchItem = list.filter({$0.prefix(searchText.count) == searchText})
    Searching = true
    MenuList.reloadData()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
