//
//  DetailsViewController.swift
//  AccessibilityUIKitSwiftUI
//
//  Created by Sofo Machurishvili on 29.12.23.
//

import UIKit
import NetworkService

class DetailsViewController: UIViewController {
    
    var newsModel: NewsModel?
    let label = UILabel()
    let articleDescription = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.numberOfLines = 0
        articleDescription.numberOfLines = 0
        
        view.addSubview(label)
        view.addSubview(articleDescription)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        articleDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate ([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            articleDescription.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            articleDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            articleDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func updateViews() {
        label.text = newsModel?.title
        articleDescription.text = newsModel?.description
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
