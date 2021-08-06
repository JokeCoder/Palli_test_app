//
//  Books.swift
//  Books
//
//  Created by YIM LLC on 06/08/21.
//

import Foundation

struct Books: Codable {
    let totalItems: Int?
    let items: [Item]?
}


struct Item: Codable {
    let volumeInfo: VolumeInfo?
}


struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let publisher: String?
    let description: String?
    let categories: [String]?
    let imageLinks: ImageLink?
}


struct ImageLink: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
