import UIKit

class HomeViewController:UIViewController {
    
    @IBOutlet weak var txtbestScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI() {
        txtbestScore.text = NSUserDefaultsUtil.readNSUserDefaultsValue(NSUserDefaultsUtil.BEST_SCORE_NSDEFAULT)
    }

}
