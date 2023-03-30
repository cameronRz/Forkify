//
//  ForkifyApiSearchResponse.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import Foundation

// TODO - Move these to a subfolder in separate files for easy navigation

struct ForkifyApiSearchResponse: Decodable {
    let status: String
    let results: Int?
    let message: String?
    let data: ForkifyApiSearchResponseData?
}

struct ForkifyApiSearchResponseData: Decodable {
    let recipes: [RecipeSearchResult]
}

struct RecipeSearchResult: Identifiable, Decodable {
    let id: String
    let title: String
    let publisher: String
    let image_url: String?
    
    // TODO - Remove force unwrapping and add error handling
    var imageURL: URL? {
        guard let url = image_url else { return nil }
        
        // Add error handling
        let http = URL(string: url)!
        var components = URLComponents(url: http, resolvingAgainstBaseURL: false)!
        components.scheme = "https"
        let https = components.url!
        
        return https
    }
}
