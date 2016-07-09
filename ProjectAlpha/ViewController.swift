import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWhatObjectToShow: UILabel!
    @IBOutlet weak var txtElapsedTime: UILabel!
    
    @IBOutlet weak var firstView: DrawableUIView!
    @IBOutlet weak var secondView: DrawableUIView!
    @IBOutlet weak var thirdView: DrawableUIView!
    @IBOutlet weak var fourthView: DrawableUIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //get initial color + object
        let nextColorToGuess = Util.generateRandomColor()
        let nextItemToShow =  Util.getColorNameFromRGBValues(nextColorToGuess) + " " + Util.generateRandomShape()
        self.txtWhatObjectToShow.text = nextItemToShow
        self.txtWhatObjectToShow.adjustsFontSizeToFitWidth = true
        
        //generate initial set of drawings
        generateNextSetOfDrawings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateNextSetOfDrawings() {
        firstView.viewColor = Util.generateRandomColor()
        firstView.viewShapeToDraw = Util.generateRandomShape()
        
        secondView.viewColor = Util.generateRandomColor()
        secondView.viewShapeToDraw = Util.generateRandomShape()
        
        thirdView.viewColor = Util.generateRandomColor()
        thirdView.viewShapeToDraw = Util.generateRandomShape()
        
        fourthView.viewColor = Util.generateRandomColor()
        fourthView.viewShapeToDraw = Util.generateRandomShape()

    }

}

