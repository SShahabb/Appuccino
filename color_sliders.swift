@IBOutlet weak var Color_1: UILabel!
    @IBOutlet weak var slider_1: UISlider!
    
    @IBOutlet weak var Color_2: UILabel!
    @IBOutlet weak var slider_2: UISlider!
    
    @IBOutlet weak var Color_3: UILabel!
    @IBOutlet weak var slider_3: UISlider!
    
    @IBAction func background_1(_ sender: Any) {
        MatchEmVC?.view.backgroundColor = UIColor(red:CGFloat(slider_1.value)/255, green:CGFloat(slider_2.value)/255,blue:CGFloat(slider_3.value)/255, alpha: 1)
        
        self.view.backgroundColor = UIColor(red:CGFloat(slider_1.value)/255, green:CGFloat(slider_2.value)/255, blue:CGFloat(slider_3.value)/255, alpha: 1)
        
        Color_1.text = String(slider_1.value)
        Color_2.text = String(slider_2.value)
        Color_3.text = String(slider_3.value)
    }
