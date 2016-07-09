import UIKit

class DrawableUIView:UIView {
    
    var viewColor:UIColor
    var viewShapeToDraw:String
    
    init(frame: CGRect, viewColor:UIColor, viewShapeToDraw:String) {
        self.viewColor = viewColor
        self.viewShapeToDraw = viewShapeToDraw
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewColor = UIColor.blackColor()
        self.viewShapeToDraw = "circle"
        super.init(coder: aDecoder)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
     */
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(20), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        //you can change the stroke color
        shapeLayer.strokeColor = viewColor.CGColor
        //shapeLayer.strokeColor = UIColor.redColor().CGColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        layer.addSublayer(shapeLayer)
    }

}
