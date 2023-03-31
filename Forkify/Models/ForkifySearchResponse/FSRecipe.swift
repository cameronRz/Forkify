//
//  FSRecipe.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import Foundation

// Forkify Search Response Recipe Data
struct FSRecipe: Identifiable, Decodable {
    let id: String
    let title: String
    let publisher: String
    let image_url: String?

    var imageURL: URL? {
        guard let url = image_url else { return nil }
        guard let http = URL(string: url) else { return nil }
        guard var components = URLComponents(url: http, resolvingAgainstBaseURL: false) else { return nil }
        
        // Force https scheme
        components.scheme = "https"
        let https = components.url!

        return https
    }
}
