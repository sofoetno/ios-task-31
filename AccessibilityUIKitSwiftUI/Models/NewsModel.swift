//
//  NewsModel.swift
//  AccessibilityUIKitSwiftUI
//
//  Created by Sofo Machurishvili on 27.12.23.
//

import Foundation

struct NewsModel: Decodable {
    let title: String?
    let description: String?
    let urlToImage: String?
}

struct NewsResponseModel: Decodable {
    let articles: [NewsModel]
}
