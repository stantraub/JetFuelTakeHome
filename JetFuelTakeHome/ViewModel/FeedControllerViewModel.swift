//
//  FeedControllerViewModel.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 5/14/21.
//

import Foundation

final class FeedControllerViewModel {
    
    // MARK: - Properties
    
    var fetchedCampaignsCompletion: ((Error?) -> Void)?
    
    var campaigns: [Campaign] = [] {
        didSet {
            fetchedCampaignsCompletion?(nil)
        }
    }
    
    var numberOfRows: Int {
        campaigns.count
    }
    
    // MARK: - Helpers
    
    func fetchCampaigns() {
        Service.fetchCampaigns { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let response):
                strongSelf.campaigns = response.campaigns
            case .failure(let error):
                strongSelf.fetchedCampaignsCompletion?(error)
            }
        }
    }
    
}
