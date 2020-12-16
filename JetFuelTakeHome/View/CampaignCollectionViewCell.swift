//
//  CampaignCollectionViewCell.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 12/14/20.
//

import UIKit
import SDWebImage

class CampaignCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var viewModel: CampaignCellViewModel? {
        didSet { configureWithViewModel() }
    }
    
    static let identifier = "CampaignCollectionViewCell"
    
    private let headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.setHeight(1)
        return view
    }()
    
    private let campaignIcon: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 25
        iv.layer.cornerCurve = .continuous
        iv.setDimensions(height: 80, width: 80)
        return iv
    }()
    
    private let campaignNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .label
        return label
    }()
    
    private let payPerInstallLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let collectionView: UICollectionView
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: frame.width / 3, height: frame.height / 2)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        
        
        super.init(frame: frame)

        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        backgroundColor = .systemGroupedBackground
        
        addSubview(headerContainerView)
        headerContainerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        headerContainerView.setHeight(120)
        
        headerContainerView.addSubview(campaignIcon)
        campaignIcon.anchor(left: headerContainerView.leftAnchor, paddingLeft: 20)
        campaignIcon.centerY(inView: headerContainerView)

        let campaignInfoStack = UIStackView(arrangedSubviews: [campaignNameLabel, payPerInstallLabel])
        campaignInfoStack.axis = .vertical
        campaignInfoStack.spacing = 8

        headerContainerView.addSubview(campaignInfoStack)
        campaignInfoStack.center(inView: headerContainerView)
        campaignInfoStack.anchor(left: campaignIcon.rightAnchor, paddingLeft: 20)
        
        addSubview(dividerView)
        dividerView.anchor(top: headerContainerView.bottomAnchor, left: leftAnchor, right: rightAnchor)
    }

    
    private func configureWithViewModel() {
        guard let viewModel = viewModel else { return }
        campaignIcon.sd_setImage(with: viewModel.campaignIconURL)
        campaignNameLabel.text = viewModel.campaignName
        payPerInstallLabel.attributedText = viewModel.payPerInstall
    }
}
