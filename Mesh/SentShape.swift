//
//  SentShape.swift
//  Mesh
//
//  Created by James Wolfe on 09/05/2023.
//

import SwiftUI

struct SentShape: Shape {
    
    // MARK: - Variables
    let cornerRadius: CGFloat
    
    // MARK: - Shape
    func path(in rect: CGRect) -> Path {
            var path = Path()
        
            let width = rect.size.width
            let height = rect.size.height

        path.move(to: CGPoint(x: cornerRadius, y: 0))
                path.addLine(to: CGPoint(x: width - cornerRadius, y: 0))
                path.addArc(center: CGPoint(x: width - cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: cornerRadius, y: height))
                path.addArc(center: CGPoint(x: cornerRadius, y: height - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: cornerRadius))
                path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

            return path
        }
}

struct SentShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            Color.black
                .clipShape(SentShape(cornerRadius: 10))
        }.padding()
    }
}
