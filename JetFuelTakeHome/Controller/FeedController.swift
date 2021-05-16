//
//  ViewController.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 12/13/20.
//

import UIKit

final class FeedController: UICollectionViewController {
    
    // MARK: - Lifecycle
    
    private var viewModel = FeedControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.fetchCampaigns()
        configureUI()
    }
    
    // MARK: - Helpers
    
    private func bindViewModel() {
        viewModel.fetchedCampaignsCompletion = { [weak self] error in
            guard let strongSelf = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                DispatchQueue.main.async {
                    strongSelf.collectionView.reloadData()
                }
            }
        }
    }
    
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
        viewModel.numberOfRows
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let campaign = viewModel.campaigns[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CampaignCollectionViewCell.identifier, for: indexPath) as! CampaignCollectionViewCell
        let viewModel = CampaignCellViewModel(campaign: campaign)
        cell.configure(with: viewModel)
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

