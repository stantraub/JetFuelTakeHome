//
//  ViewController.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 12/13/20.
//

import UIKit

class FeedController: UICollectionViewController {
    
    // MARK: - Properties
    
    private var campaigns = [Campaign]()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCampaigns()
        configureUI()
    }
    
    // MARK: - API
    
    private func fetchCampaigns() {
        Service.fetchCampaigns { [weak self] result in
            switch result {
            case .success(let campaigns):
                self?.campaigns = campaigns
                DispatchQueue.main.async { [weak self] in
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        navigationItem.title = "PLUGS"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CampaignCollectionViewCell.self, forCellWithReuseIdentifier: CampaignCollectionViewCell.identifier)
    }
    
    // MARK: - Actions

}

extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return campaigns.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let campaign = campaigns[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CampaignCollectionViewCell.identifier, for: indexPath) as! CampaignCollectionViewCell
        cell.viewModel = CampaignCellViewModel(campaign: campaign)
        return cell
    }
}

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height
        
        return CGSize(width: width, height: height / 2.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

