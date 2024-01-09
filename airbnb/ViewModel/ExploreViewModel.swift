//
//  ExploreViewModel.swift
//  airbnb
//
//  Created by Benjamin. on 08/01/2024.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var listings = [Listing]()
    @Published var location = ""
    var orginalListings = [Listing]()
    var service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        Task {
           let data = await fetchListing()
            DispatchQueue.main.async {
                self.listings = data
                self.orginalListings = data
            }
            
        }
    }
    
    func fetchListing() async -> [Listing] {
        do {
         return try await service.fetchListings()
        } catch {
            print("Error while fetching listings: \(error.localizedDescription)")
            return []
        }
       
    }
    
    func searchListing() {
        let filteredList = listings.filter { $0.state.contains(location) || $0.city.contains(location)
        }
        self.listings = !location.isEmpty ? filteredList : orginalListings
    }
    
 
}
 
