//
//  DetailsRepresentableView.swift
//  AccessibilityUIKitSwiftUI
//
//  Created by Sofo Machurishvili on 29.12.23.
//

import UIKit
import SwiftUI

struct DetailsRepresentableView: UIViewControllerRepresentable {
    var newsModel: NewsModel
    
    func makeUIViewController(context: Context) -> DetailsViewController {
       let detailsViewController = DetailsViewController()
        
        detailsViewController.newsModel = newsModel
        
        return detailsViewController
    }
    
    func updateUIViewController(_ uiViewController: DetailsViewController, context: Context) {
        uiViewController.updateViews()
    }
    
    
    
}
