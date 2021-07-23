//
//  SongsListModel.swift
//  MJMusic
//
//  Created by Sagar Sharma on 23/07/21.
//

import Foundation

// MARK: - SongsListModel
struct SongsListModel: Decodable {
    let resultCount: Int?
    let results: [SearchResult]?
}

// MARK: - Result
struct SearchResult: Decodable {
    let wrapperType: WrapperType?
    let kind: Kind?
    let artistId, collectionId, trackId: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewUrl, collectionViewUrl, trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let collectionExplicitness, trackExplicitness: Explicitness?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: Country?
    let currency: Currency?
    let primaryGenreName, contentAdvisoryRating: String?
    let isStreamable: Bool?
    let collectionArtistId: Int?
    let collectionArtistName: String?
    let collectionArtistViewUrl: String?
    let copyright, description: String?
    let amgArtistId: Int?
    let trackRentalPrice, trackHdRentalPrice: Double?
    let shortDescription, longDescription: String?
    let collectionHdPrice, trackHdPrice: Double?
    let hasITunesExtras: Bool?
    
}

enum Explicitness: String, Codable {
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
    case song = "song"
}

enum WrapperType: String, Codable {
    case audiobook = "audiobook"
    case track = "track"
}


