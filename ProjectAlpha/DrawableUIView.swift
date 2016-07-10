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
        
        print("DrawableUIView - what to draw:" + Util.getColorNameFromRGBValues(viewColor) + " " + viewShapeToDraw.rawValue)
        
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
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: viewDimens.width / 2,y: viewDimens.height / 2), radius: CGFloat(SQUARE_SIDE_SIZE / 2), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath
        
        //change the fill color
        shapeLayer.fillColor = viewColor.CGColor
        //you can change the stroke color
        shapeLayer.strokeColor = viewColor.CGColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        layer.addSublayer(shapeLayer)
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
