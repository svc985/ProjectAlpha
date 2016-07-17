import UIKit

class GameEndedViewController: UIViewController {
    
    @IBOutlet weak var txtElapsedTime: UILabel!
    
    var elapsedTime: Double = 0.0
    
    var delegate:GameEndedViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtElapsedTime.text = String(elapsedTime.roundToPlaces(3))
        
    }
    
    @IBAction func playGameAgain(sender: AnyObject) {
        dismissViewControllerAnimated(false, completion: nil)
        delegate.restartTimer()
    }

}
