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
    
    static let identifier = "CampaignCollectionViewCell"
    
    var viewModel: CampaignCellViewModel? {
        didSet { configureWithViewModel() }
    }
    
    private var medias = [Media]()
    
    private let headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8757564425, green: 0.9350169301, blue: 0.9470222592, alpha: 1)
        view.setHeight(2)
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
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 20,
                                           bottom: 0,
                                           right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .systemGroupedBackground
        return cv
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CampaignMediaCollectionViewCell.self, forCellWithReuseIdentifier: CampaignMediaCollectionViewCell.identifier)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
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
        
        addSubview(collectionView)
        collectionView.anchor(top: dividerView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }

    
    private func configureWithViewModel() {
        guard let viewModel = viewModel else { return }
        campaignIcon.sd_setImage(with: viewModel.campaignIconURL)
        campaignNameLabel.text = viewModel.campaignName
        payPerInstallLabel.attributedText = viewModel.payPerInstall
    }
}

extension CampaignCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        guard let viewModel = viewModel else { return 0 }
//        return viewModel.campaign.medias.count
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let media = medias[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CampaignMediaCollectionViewCell.identifier, for: indexPath) as! CampaignMediaCollectionViewCell
        return cell
    }
    
    
}

extension CampaignCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height * 0.85
        let width = frame.width / 3.7
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("sup")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
