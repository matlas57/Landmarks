//
//  PageView.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/4/25.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // Takes the featured landmarks and displays them and controls swipe behavior
            PageViewController(pages: pages, currentPage: $currentPage)
            // Creates the page indicator in the bottom right using the size of pages and the current page state
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0)})
}
