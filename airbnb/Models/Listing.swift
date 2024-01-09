//
//  Listing.swift
//  airbnb
//
//  Created by Benjamin. on 08/01/2024.
//

import Foundation


struct Listing: Identifiable, Codable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let title: String
    var rating: Double
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Double
    let latitude: Double
    let longitude: Double
    let address: String
    let city: String
    let state: String
    var feature: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
    var imageUrls: [String]
    
    static func sampleData() -> [Listing] {
        return [
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, ownerName: "Sarah Doe", ownerImageUrl: "profile", title: "Miami Villa", rating: 4.86, numberOfBedrooms: 4, numberOfBathrooms: 3, numberOfGuests: 4, numberOfBeds: 4, pricePerNight: 567, latitude: 25.7850, longitude: -80.1936, address: "124 Main St", city: "Miami", state: "Florida", feature: [.selfCheckIn, .superHost], amenities: [.alarmSystem, .wifi, .balcony, .laundry, .tv], type: .villa, imageUrls: [
                "listing-1",
                "listing-2",
                "listing-3",
                "listing-4",
            ]),
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, ownerName: "Jessica Smith", ownerImageUrl: "profile", title: "Beach House", rating: 4.75, numberOfBedrooms: 3, numberOfBathrooms: 2, numberOfGuests: 6, numberOfBeds: 3, pricePerNight: 450, latitude: 34.0522, longitude: -118.2437, address: "456 Ocean Ave", city: "Los Angeles", state: "California", feature: [.superHost], amenities: [.wifi, .laundry, .tv], type: .house, imageUrls: [
                          "listing-3",
                          "listing-2",
                          "listing-1",
                          "listing-4",
                      ]),
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, ownerName: "Priscilla Long", ownerImageUrl: "profile", title: "Town House", rating: 4.75, numberOfBedrooms: 3, numberOfBathrooms: 2, numberOfGuests: 6, numberOfBeds: 3, pricePerNight: 450, latitude: 34.0522, longitude: -118.2437, address: "456 Herb Ave", city: "Los Vegas", state: "California", feature: [.selfCheckIn], amenities: [.wifi, .alarmSystem, .tv], type: .towHouse, imageUrls: [
                          "listing-4",
                          "listing-1",
                          "listing-2",
                          "listing-3",
                      ]),
        ]
    }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case towHouse
    case villa
    
    var description: String {
        switch self {
        case .apartment:
            return "Apartment"
        case .house:
            return "House"
        case .towHouse: return "Town House"
        case .villa: return "Villa"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    var id: Int {
        return  self.rawValue
    }
    
    var icon:String {
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    var title:String {
        switch self {
        case .selfCheckIn: return "Self check-in"
        case .superHost: return "Superhost"
        }
    }
    var subtitle:String {
        switch self {
        case .selfCheckIn: return "Check yourself in with keypad."
        case .superHost: return "Superhost are experienced., highly rated hosts who are commited to providing greater stars to guests."
        }
    }
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title:String {
        switch self {
        case .alarmSystem: return "Alarm System"
        case .balcony: return "Balcony"
        case .kitchen: return "Kitchen"
        case .laundry: return "Laundry"
        case .tv: return "TV"
        case .office: return "Office"
        case .wifi: return "WiFi"
        case .pool: return "Pool"
            
        }
    }
    
    var icon:String {
        switch self {
        case .alarmSystem: return "checkerboard.shield"
        case .balcony: return "building"
        case .kitchen: return "fork.knife"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .office: return "pencil.and.ruler.fill"
        case .wifi: return "wifi"
        case .pool: return "figure.pool.swim "
            
        }
    }
    var id: Int {
        return  self.rawValue
    }
}


