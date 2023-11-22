

import Foundation


struct EpisodeModel: Codable {
    let season, episode: Int
    let name: String
    let rating: Double
    let description, airDate: String
    let thumbnailURL: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case season, episode, name, rating, description, airDate
        case thumbnailURL = "thumbnailUrl"
        case id
    }
}

typealias Welcome = [EpisodeModel]
