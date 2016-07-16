import Foundation

class NSUserDefaultsUtil {
    
    //refactor this name
    static let BEST_SCORE_NSDEFAULT = "bestScore"
    
    static func readNSUserDefaultsValue(value:String) -> String {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let name = defaults.stringForKey(value) {
            return name
        }
        return "0"
    }
    
    static func writeNSUserDefaultsValue(value:String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(value, forKey: BEST_SCORE_NSDEFAULT)
    }
    
}
