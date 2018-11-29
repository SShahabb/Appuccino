import UIKit

class Menu_Screen: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  //Label Connection on MainStoryBoard
  @IBOutlet weak var Points: UILabel!
  
  //Search Bar Connection on MainStoryBoard
  @IBOutlet weak var MenuSearch: UISearchBar!
  
  //Creating an array to hold all the items that can be purchased
  var list = ["Coffee", "Salad") //Currently a basic idea, somehow want to go back and change this so we can have categories, but for now this works
  
  //========FUNCTIONS==================================================================================
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return(list.count)
  }
  
  public func tableView(_ tableView: UITablView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell"
    
    cell.textLabel?.text = list[indexPath.row]
    
    return(cell)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
