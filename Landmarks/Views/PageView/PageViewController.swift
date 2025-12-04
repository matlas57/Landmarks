//
//  PageViewController.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/4/25.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable  {
    var pages: [Page] // The pages used to scroll between landmarks
    @Binding var currentPage: Int
    
    //Called before makeUIViewController so there is access before configuring the ViewController
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //This is called a single time when a view is ready to be displayed and then manages the view controller's life cycle
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    //This hosts the page SwiftUI view on every update
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true
        )
    }
    
    //UIPageViewControllerDataSource requires methods that establish relationships between view controllers so that we can go back and forth between them
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]() //store controllers in a coordinator since its only created once and before they're needed
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // Defines a left right that wraps to the last item if we reach the end
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        // Defines a right swipe that wraps to the first item if reached the end
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        // When a page switching animation completes find the index of the current page and update the state of currentPage
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
