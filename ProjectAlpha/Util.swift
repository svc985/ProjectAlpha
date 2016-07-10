import Foundation
import UIKit

class Util {
    
    class func randomInt(minInt: Int, maxInt: Int) -> Int{
        
        return Int(arc4random_uniform(UInt32(maxInt)) + UInt32(minInt))
    }
    
    class func generateRandomColor() -> UIColor{
        let colors:[UIColor] = [UIColor.redColor(),UIColor.greenColor(),UIColor.blueColor(),UIColor.yellowColor(), UIColor.blackColor()]
        let colorIndex = Util.randomInt(0, maxInt: colors.count)
        return colors[colorIndex]
    }
 
    class func generateRandomShape() -> Shape {
        return Shape.randomShape()
    }
    
    class func getColorNameFromRGBValues(color:UIColor) -> String {
        let rgbColor = color.rgb()
        
        for (color, rgbValue) in Constants.colors {
            if (rgbValue == rgbColor!) {
                return color
            }
        }
        
        return ""
    }
}
