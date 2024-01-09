//
//  ExploreService.swift
//  airbnb
//
//  Created by Benjamin. on 08/01/2024.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing]{
        return Listing.sampleData()
    }
}
