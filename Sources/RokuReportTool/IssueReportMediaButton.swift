//
//  IssueReportMediaButton.swift
//  RockReportTool
//
//  Created by Powersel on 03.06.2022.
//

import UIKit

final class IssueReportMediaButton: UIView {
    
    enum MediaType {
        case video
        case photo
    }
    
    private enum VIEW_STATE {
        case initial
        case presentation
    }
    
    private let titleLabel = UILabel()
    private var thumbnailImage = UIImageView()
    private var mediaIcon = UIImageView()
    private var mediaContainer = UIView()
    
    private let mediaType: MediaType
    private var viewState: VIEW_STATE = .initial

    weak var delegate: IssueReportMediaButtonDelegate?
    
    init(mediaType: MediaType) {
        self.mediaType = mediaType
        
        super.init(frame: CGRect.zero)
        
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    func presentThumbnail(with image: UIImage) {
        thumbnailImage.image = image
    }
    
    func changeViewState() {
        viewState = viewState == .initial ? .presentation : .initial
        if viewState == .initial {
            thumbnailImage.image = nil
        }
        configureUI()
    }
    
    // MARK: - Private
    
    private func setupView() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        addGestureRecognizer(tapRecognizer)
        
        configureUI()

        titleLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        titleLabel.font = UIFont(name: "Gotham", size: 14)
        titleLabel.tintColor = UIColor.white.withAlphaComponent(0.6)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.isUserInteractionEnabled = false
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        mediaContainer.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        mediaContainer.layer.cornerRadius = 4
        mediaContainer.isUserInteractionEnabled = false
        
        addSubview(mediaContainer)
        
        mediaContainer.translatesAutoresizingMaskIntoConstraints = false
        mediaContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mediaContainer.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -4.0).isActive = true
        mediaContainer.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mediaContainer.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    
        mediaContainer.addSubview(mediaIcon)
        
        mediaIcon.isUserInteractionEnabled = false
        mediaIcon.translatesAutoresizingMaskIntoConstraints = false
        mediaIcon.centerXAnchor.constraint(equalTo: mediaContainer.centerXAnchor).isActive = true
        mediaIcon.centerYAnchor.constraint(equalTo: mediaContainer.centerYAnchor).isActive = true
        mediaIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mediaIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        mediaIcon.contentMode = .scaleAspectFit
        
        let bundle = Bundle.module
        if let photoPreviewURL =  bundle.url(forResource: "photoPreviewThumbnail", withExtension: "png") {
            let photoThumbnail = UIImage(contentsOfFile: photoPreviewURL.absoluteString)
            let videoThumbnail = UIImage(named: "videoPreviewThumbnail", in: .module, compatibleWith: nil)
            mediaIcon.image = mediaType == .photo ? photoThumbnail : videoThumbnail
        }
        
//        let photoThumbnail = UIImage(named: "photoPreviewThumbnail", in: .module, compatibleWith: nil)
        
        
        mediaContainer.addSubview(thumbnailImage)
        
        thumbnailImage.isUserInteractionEnabled = true
        thumbnailImage.contentMode = .scaleAspectFit
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImage.topAnchor.constraint(equalTo: mediaContainer.topAnchor).isActive = true
        thumbnailImage.bottomAnchor.constraint(equalTo: mediaContainer.bottomAnchor, constant: 4.0).isActive = true
        thumbnailImage.leftAnchor.constraint(equalTo: mediaContainer.leftAnchor).isActive = true
        thumbnailImage.rightAnchor.constraint(equalTo: mediaContainer.rightAnchor).isActive = true
    }
    
    @objc func tapHandler() {
        switch viewState {
        case .initial:
            _ = mediaType == .photo ? delegate?.goToPhotoController() : delegate?.goToVideoController()
        case .presentation:
            delegate?.removeThumbnail(with: mediaType)
        }
    }

    private func configureUI() {
        let addPhotoTitle = NSLocalizedString("Add photo", comment: "add photo button title, issue report screen")
        let addVideoTitle = NSLocalizedString("Add video", comment: "add video button title, issue report screen")
        let removePhotoTitle = NSLocalizedString("Remove photo", comment: "remove photo button title, issue report screen")
        let removeVideoTitle = NSLocalizedString("Remove video", comment: "remove video button title, issue report screen")
        
        switch viewState {
        case .initial:
            titleLabel.text = mediaType == .photo ? addPhotoTitle : addVideoTitle
        case .presentation:
            titleLabel.text = mediaType == .photo ? removePhotoTitle : removeVideoTitle
        }
        let isInitialState = viewState == .initial ? true : false
        let initialColor = UIColor.white.withAlphaComponent(0.2)
        mediaIcon.isHidden = !isInitialState
        mediaContainer.backgroundColor = isInitialState ? initialColor : .clear
    }
}
