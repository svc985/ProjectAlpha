import UIKit

class DrawableUIView:UIView {
    
    var viewColor:UIColor
    var viewShapeToDraw:Shape
    
    let SQUARE_SIDE_SIZE:CGFloat = 40
    let MOVE_HOW_MANY_POINTS_FROM_CENTER:CGFloat = 20
    
    init(frame: CGRect, viewColor:UIColor, viewShapeToDraw:Shape) {
        self.viewColor = viewColor
        self.viewShapeToDraw = viewShapeToDraw
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewColor = UIColor.blackColor()
        self.viewShapeToDraw = Shape.Circle
        super.init(coder: aDecoder)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
     */
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.clearsContextBeforeDrawing = true
        
        switch viewShapeToDraw {
            case .Circle:
                drawCircle()
            case .Square:
                drawSquare()
            case .Cross:
                drawCross()
            case .Triangle:
                drawTriangle()
        }
    }
    
    func drawCircle() {
        let viewDimens = frame.size
        var startAngle: Float = Float(2 * M_PI)
        var endAngle: Float = 0.0
        
        // Set the radius
        let strokeWidth = 1.0
        
        // Get the context
        let context = UIGraphicsGetCurrentContext()
        
        // Find the middle of the circle
        let center = CGPointMake(viewDimens.width / 2, viewDimens.height / 2)
        
        // Set the stroke color
        CGContextSetStrokeColorWithColor(context, viewColor.CGColor)
        
        // Set the line width
        CGContextSetLineWidth(context, CGFloat(strokeWidth))
        
        // Set the fill color (if you are filling the circle)
        CGContextSetFillColorWithColor(context, viewColor.CGColor)
        
        // Rotate the angles so that the inputted angles are intuitive like the clock face: the top is 0 (or 2π), the right is π/2, the bottom is π and the left is 3π/2.
        // In essence, this appears like a unit circle rotated π/2 anti clockwise.
        startAngle = startAngle - Float(M_PI_2)
        endAngle = endAngle - Float(M_PI_2)
        
        // Draw the arc around the circle
        CGContextAddArc(context, center.x, center.y, CGFloat(SQUARE_SIDE_SIZE / 2), CGFloat(startAngle), CGFloat(endAngle), 0)
        
        // Draw the arc
        CGContextDrawPath(context, CGPathDrawingMode.EOFillStroke)
    }

    func drawSquare() {
        let viewDimens = frame.size
        let width = viewDimens.width
        let height = viewDimens.height
        let centerCoordinates:[String: CGFloat] = ["x":width / 2, "y":height / 2]
        let topLeftCornerCoordinates = (centerCoordinates["x"]! - MOVE_HOW_MANY_POINTS_FROM_CENTER, centerCoordinates["y"]! - MOVE_HOW_MANY_POINTS_FROM_CENTER)
        
        let context = UIGraphicsGetCurrentContext()

        CGContextMoveToPoint(context, topLeftCornerCoordinates.0, topLeftCornerCoordinates.1)
        CGContextAddLineToPoint(context, topLeftCornerCoordinates.0 + SQUARE_SIDE_SIZE, topLeftCornerCoordinates.1)
        CGContextAddLineToPoint(context, topLeftCornerCoordinates.0 + SQUARE_SIDE_SIZE, topLeftCornerCoordinates.1 + SQUARE_SIDE_SIZE)
        CGContextAddLineToPoint(context, topLeftCornerCoordinates.0, topLeftCornerCoordinates.1 + SQUARE_SIDE_SIZE)
        CGContextAddLineToPoint(context, topLeftCornerCoordinates.0, topLeftCornerCoordinates.1)
        CGContextSetFillColorWithColor(context, viewColor.CGColor)
        CGContextFillPath(context)
    }

    func drawCross() {
        let viewDimens = frame.size
        let width = viewDimens.width
        let height = viewDimens.height
        let centerCoordinates:[String: CGFloat] = ["x":width / 2, "y":height / 2]
      
        let leftEdgeCoordinates = (centerCoordinates["x"]! - SQUARE_SIDE_SIZE / 2, centerCoordinates["y"]!)
        let topEdgeCoordinates = (centerCoordinates["x"]!, centerCoordinates["y"]! - SQUARE_SIDE_SIZE / 2)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2.0)
        CGContextSetStrokeColorWithColor(context, viewColor.CGColor)
        CGContextMoveToPoint(context, leftEdgeCoordinates.0, leftEdgeCoordinates.1)
        CGContextAddLineToPoint(context, leftEdgeCoordinates.0 + SQUARE_SIDE_SIZE, leftEdgeCoordinates.1)
        CGContextMoveToPoint(context, topEdgeCoordinates.0, topEdgeCoordinates.1)
        CGContextAddLineToPoint(context, topEdgeCoordinates.0, topEdgeCoordinates.1 + SQUARE_SIDE_SIZE)
        CGContextStrokePath(context)
    }
    
    func drawTriangle() {
        let viewDimens = frame.size
        let width = viewDimens.width
        let height = viewDimens.height
        let centerCoordinates:[String: CGFloat] = ["x":width / 2, "y":height / 2]
        let topCornerCoordinates = (centerCoordinates["x"]!, centerCoordinates["y"]! - MOVE_HOW_MANY_POINTS_FROM_CENTER)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextMoveToPoint(context, topCornerCoordinates.0, topCornerCoordinates.1)
        CGContextAddLineToPoint(context, topCornerCoordinates.0 - SQUARE_SIDE_SIZE / 2, CGFloat.init(80))
        CGContextAddLineToPoint(context, topCornerCoordinates.0 + SQUARE_SIDE_SIZE / 2, CGFloat.init(80))
        CGContextAddLineToPoint(context, topCornerCoordinates.0, topCornerCoordinates.1)
        CGContextSetFillColorWithColor(context, viewColor.CGColor)
        CGContextFillPath(context)
    }
}
