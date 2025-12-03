//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/3/25.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        //Use a GeometryReader so the badge uses the size of its containing view
        GeometryReader { geometry in
            // A path combines drawing primitives into complex shapes
            Path { path in
                // Use the minimum dimension to preserve aspect ratio
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                // Add scale and offset to scale down and recenter
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                // move to moves the drawing cursor to the starting point of the shape
                path.move(
                    to: CGPoint(
                        x: width * 0.95  + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                // Use the segments to addlines to the shape
                HexagonParameters.segments.forEach {segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y,
                        )
                    )
                    
                    // Draw bezier curves for corners
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y,
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y,
                        )
                    )
                }
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        // Set the aspect ratio to 1:1 to center the badge
        .aspectRatio(1, contentMode: ContentMode.fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#Preview {
    BadgeBackground()
}
