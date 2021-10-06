//
//  Pie.swift
//  Pie
//
//  Created by Katie Bankhead on 9/16/21.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = false
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        
        var p = Path()
        
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: !clockwise)
        p.addLine(to: center)
        
        return p
    }
}

struct Pie_Previews: PreviewProvider {
    static var previews: some View {
        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 105-90))
            .foregroundColor(.orange)
            .opacity(0.4)
            .padding()
    }
}
