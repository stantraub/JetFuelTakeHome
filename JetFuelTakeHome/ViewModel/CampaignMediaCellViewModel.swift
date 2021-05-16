//
//  CampaignMediaCellViewModel.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 5/14/21.
//

import Foundation

struct CampaignMediaCellViewModel {
    
    // MARK: - Properties
    
    var media: Media
    
    // MARK: - Lifecycle
    
    init(media: Media) {
        self.media = media
    }
}
