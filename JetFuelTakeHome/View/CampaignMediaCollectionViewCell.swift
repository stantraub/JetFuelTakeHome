//
//  CampaignMediaCollectionViewCell.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 12/15/20.
//

import UIKit

class CampaignMediaCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "CampaignMediaCollectionViewCell"
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
}
