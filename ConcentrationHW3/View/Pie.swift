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
    var clockwise = true
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: radius * cos(startAngle.radians),
            y: radius * sin(startAngle.radians)
        )
        
        var p = Path()
        
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        return p
    }
}

struct Pie_Previews: PreviewProvider {
    static var previews: some View {
        Pie(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 105))
            .foregroundColor(.orange)
            .opacity(0.4)
    }
}
