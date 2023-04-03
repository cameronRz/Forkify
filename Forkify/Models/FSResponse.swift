//
//  FSResponse.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import Foundation

// Forkify Search Response
struct FSResponse: Decodable {
    var status: String?
    var results: Int?
    var message: String?
    var data: FSData?
}
