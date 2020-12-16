//
//  Campaign.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 12/14/20.
//

import Foundation

struct Campaign: Decodable {
    let id: Int
    let campaignName: String
    let campaignIconURL: String
    let payPerInstall: String
    let medias: [Media]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case campaignName = "campaign_name"
        case campaignIconURL = "campaign_icon_url"
        case payPerInstall = "pay_per_install"
        case medias = "medias"
    }
}

struct Media: Decodable {
    let coverPhotoURL: String
    let downloadURL: String
    let trackingLink: String
    let mediaType: String
    
    enum CodingKeys: String, CodingKey {
        case coverPhotoURL = "cover_photo_url"
        case downloadURL = "download_url"
        case trackingLink = "tracking_link"
        case mediaType = "media_type"
    }
}
