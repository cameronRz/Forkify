//
//  FSResponse.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import Foundation

// Forkify Search Response
struct FSResponse: Decodable {
    let status: String?
    let results: Int?
    let message: String?
    let data: FSData?
}
