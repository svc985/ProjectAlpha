import Foundation

enum Shape:String {
    case Triangle = "Triangle", Circle = "Circle", Square = "Square", Cross = "Cross"
    
    static let allValues = [Triangle, Circle, Square, Cross]
    
    static func randomShape() -> Shape {
        // pick and return a new value
        let rand = Util.randomInt(0, maxInt: allValues.count)
        return allValues[rand]
    }
}
