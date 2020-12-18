//
//  CampaignCollectionViewCellViewModel.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 12/15/20.
//

import UIKit

struct CampaignCellViewModel {
    
    // MARK: - Properties
    
    var campaign: Campaign
    
    var campaignIconURL: URL? {
        return URL(string: campaign.campaignIconURL)
    }
    
    var campaignName: String {
        return campaign.campaignName
    }
    
    var payPerInstall: NSAttributedString {
        let attributedString = NSMutableAttributedString(string: campaign.payPerInstall,
                                                         attributes: [.font: UIFont.boldSystemFont(ofSize: 20),
                                                                      .foregroundColor: #colorLiteral(red: 0, green: 0.5775609016, blue: 0.1883395016, alpha: 1)])
        
        attributedString.append(NSAttributedString(string: " per install", attributes: [.font: UIFont.systemFont(ofSize: 20),
                                                                                        .foregroundColor: #colorLiteral(red: 0, green: 0.5775609016, blue: 0.1883395016, alpha: 1)]))
        return attributedString
    }
    
    // MARK: - Lifecycle
    
    init(campaign: Campaign) {
        self.campaign = campaign
    }
    
    // MARK: - Helpers
}
