import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWhatObjectToShow: UILabel!
    @IBOutlet weak var txtElapsedTime: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    
    var shapes:[String] = ["Triangle", "Circle", "Square", "Star"]
    var colors:[String] = ["Red","Green","Blue","Yellow", "Black"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //get initial color + object
        let nextItemToShow = generateRandomObject()
        self.txtWhatObjectToShow.text = nextItemToShow
        self.txtWhatObjectToShow.adjustsFontSizeToFitWidth = true
        
        drawRandomObjectsForAllViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func generateRandomObject() -> String {
        let objectIndex = Util.randomInt(0, maxInt: shapes.count)
        let colorIndex = Util.randomInt(0, maxInt: colors.count)
        
        return colors[colorIndex] + " " + shapes[objectIndex]
    }
    
    func drawRandomObjectsForAllViews() {
        let firstRandomObject = generateRandomObject()
        let secondRandomObject = generateRandomObject()
        let thirdRandomObject = generateRandomObject()
        let fourthRandomObject = generateRandomObject()
        
        print(firstRandomObject)
        print(secondRandomObject)
        print(thirdRandomObject)
        print(fourthRandomObject)
    }

}

