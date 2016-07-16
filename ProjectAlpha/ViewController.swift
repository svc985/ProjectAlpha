import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWhatObjectToShow: UILabel!
    @IBOutlet weak var txtElapsedTime: UILabel!
    
    @IBOutlet weak var firstView: DrawableUIView!
    @IBOutlet weak var secondView: DrawableUIView!
    @IBOutlet weak var thirdView: DrawableUIView!
    @IBOutlet weak var fourthView: DrawableUIView!
    
    @IBOutlet var drawableViews: [DrawableUIView]!
    
    var nextColorToGuess = Util.generateRandomColor()
    var nextShapeToGuess = Util.generateRandomShape()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //generate initial set of drawings
        generateNextSetOfDrawings()
        
        //get color + object to guess
        generateWhatShouldBeGuessedLabel()
    }
    
    func generateNextSetOfDrawings() {
        for view in drawableViews {
            view.viewColor = Util.generateRandomColor()
            view.viewShapeToDraw = Util.generateRandomShape()
            view.setNeedsDisplay()
        }
    }
    
    func generateWhatShouldBeGuessedLabel() {
        while(checkIfNewGuessingLabelNeeded()) {
            nextColorToGuess = Util.generateRandomColor()
            nextShapeToGuess = Util.generateRandomShape()
        }
        
        let nextItemToShow =  Util.getColorNameFromRGBValues(nextColorToGuess) + " " + nextShapeToGuess.rawValue
        
        self.txtWhatObjectToShow.textColor = Util.generateRandomColor()
        self.txtWhatObjectToShow.backgroundColor = UIColor.lightGrayColor()
        self.txtWhatObjectToShow.text = nextItemToShow
        self.txtWhatObjectToShow.adjustsFontSizeToFitWidth = true
    }
    
    func checkIfNewGuessingLabelNeeded() -> Bool {
        for view in drawableViews {
            if (Util.getColorNameFromRGBValues(view.viewColor) == Util.getColorNameFromRGBValues(nextColorToGuess) && view.viewShapeToDraw.rawValue == nextShapeToGuess.rawValue) {
                return false
            }
        }
        return true
    }
    
    @IBAction func handleTap(sender: AnyObject) {
        
        let clickedDrawableUIView = sender.view! as! DrawableUIView
        if (Util.getColorNameFromRGBValues(clickedDrawableUIView.viewColor) == Util.getColorNameFromRGBValues(nextColorToGuess) && nextShapeToGuess.rawValue == clickedDrawableUIView.viewShapeToDraw.rawValue) {
            print("success")
            nextColorToGuess = Util.generateRandomColor()
            nextShapeToGuess = Util.generateRandomShape()
            generateNextSetOfDrawings()
            generateWhatShouldBeGuessedLabel()
        }
        else {
            print("wrong view clicked")
        }
        
    }

}

