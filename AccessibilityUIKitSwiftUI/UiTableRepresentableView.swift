//
//  UiTableRepresentableView.swift
//  AccessibilityUIKitSwiftUI
//
//  Created by Sofo Machurishvili on 27.12.23.
//

import UIKit
import SwiftUI

struct UiTableRepresentableView: UIViewRepresentable {
    @ObservedObject var newsViewModel: NewsViewModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator(newsViewModel: newsViewModel)
    }
    
    func makeUIView(context: Context) -> UITableView {
        let uiTableView = UITableView()
        uiTableView.dataSource = context.coordinator
        uiTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return uiTableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
    
    class Coordinator: NSObject, UITableViewDataSource {
        var newsViewModel: NewsViewModel
        
        init(newsViewModel: NewsViewModel) {
            self.newsViewModel = newsViewModel
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            newsViewModel.news.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let currentNews = newsViewModel.news[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            cell.contentConfiguration = UIHostingConfiguration {
                VStack(spacing: 10) {
                    Text(currentNews.title ?? "")
                    
                    Spacer()
                    
                    if let imageUrl = currentNews.urlToImage {
                        
                        AsyncImage (url: URL(string: imageUrl)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .accessibilityAddTraits(.isImage)
                                    .accessibilityHint("Today's news")
                                    .accessibilityLabel(currentNews.title ?? "")
                            } else if phase.error != nil {
                                Image(systemName: "photo.tv")
                            } else {
                                ProgressView()
                            }
                        }
                    }
                }
                
            }
            
            return cell
        }
    }
}
