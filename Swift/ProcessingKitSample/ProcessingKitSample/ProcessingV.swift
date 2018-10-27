
import ProcessingKit

class ProcessingV: ProcessingView {
    
    var bStroking = false
    
    var lightPoints: [[Bool]] = [[]]
    var maxX = 12
    var maxY = 10
    var lightWidth: CGFloat = 0
    var lightHeight: CGFloat = 0
    
    func setup(){
        background(255, 255, 255)
        
        lightWidth  = self.bounds.width / CGFloat(maxX)
        lightHeight = self.bounds.height / CGFloat(maxY)
        
        for y in 0..<maxY {
            var tmpPoints: [Bool] = []
            for x in 0..<maxX {
                tmpPoints.append( false )
            }
            lightPoints.append(tmpPoints)
        }
        
    }
    
    func draw(){
        background(255,255,255)
        displayPoints()
    }
    
    func displayPoints(){
        for x in 0..<lightPoints.count {
            for y in 0..<lightPoints[x].count {
                stroke( 0, 0, 0 )
                if lightPoints[x][y] == true {
                    fill( 255, 0, 0 )
                } else {
                    fill( 255, 255, 255 )
                }
                ellipse( CGFloat(x)*lightWidth + lightWidth/2,
                         CGFloat(y) * lightHeight + lightHeight/2,
                         lightWidth,
                         lightHeight
                        )
            }
        }
    }
    
    func fingerTapped() {
        for x in 0..<lightPoints.count {
            for y in 0..<lightPoints[x].count {
                if dist( x1: touchX, y1: touchY, x2: CGFloat(x)*lightWidth + lightWidth/2, y2: CGFloat(y) * lightHeight + lightHeight/2) < 40
                {
                    lightPoints[x][y] = true
                }
            }
        }
    }
    
    func dist( x1: CGFloat, y1: CGFloat, x2: CGFloat, y2: CGFloat )->CGFloat {
        return sqrt( pow(x2-x1, 2) + pow(y2-y1, 2)  )
    }
    

}
