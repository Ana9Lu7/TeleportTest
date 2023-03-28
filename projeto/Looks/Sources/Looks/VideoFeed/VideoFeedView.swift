//
//  File.swift
//  
//
//  Created by Ana Luiza on 27/03/23.
//

import Common
import UIKit

public class VideoFeedView: UIView {

    // MARK: - init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Properties
    
    var fireNumber = 0 {
        didSet {
            fireLabel.text = "\(fireNumber)"
        }
    }
    var heartNumber = 0 {
        didSet {
            heartLabel.text = "\(heartNumber)"
        }
    }

    weak var delegate: VideoFeedViewControllerDelegate?
    
    lazy var loadingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.isHidden = true
        return view
    }()

    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .black
        return activityIndicator
    }()

    lazy var profilePicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 30
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var videoTitleLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.textColor = .black
        text.backgroundColor = .lightGray.withAlphaComponent(0.6)
        text.layer.cornerRadius = 10
        text.textAlignment = .center
        text.clipsToBounds = true
        return text
    }()
    
    lazy var videoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var heartImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "heart.fill")
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectHeart))
        image.addGestureRecognizer(gesture)
        return image
    }()
    
    lazy var heartLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.backgroundColor = .lightGray.withAlphaComponent(0.6)
        text.layer.cornerRadius = 6
        text.textAlignment = .center
        text.text = "0"
        text.clipsToBounds = true
        return text
    }()
    
    lazy var fireImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "fire")
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectFire))
        image.addGestureRecognizer(gesture)
        return image
    }()
    
    lazy var fireLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.backgroundColor = .lightGray.withAlphaComponent(0.6)
        text.layer.cornerRadius = 6
        text.textAlignment = .center
        text.text = "0"
        text.clipsToBounds = true
        return text
    }()
}

// MARK: - CodeViewProtocol
extension VideoFeedView: CodeViewProtocol {

    // MARK: buildViewsHierarchy
    public func buildViewsHierarchy() {
        addSubview(videoView)
        addSubview(profilePicture)
        addSubview(videoTitleLabel)
        addSubview(heartImage)
        addSubview(heartLabel)
        addSubview(fireImage)
        addSubview(fireLabel)
        addSubview(loadingView)
        addSubview(activityIndicatorView)
    }

    // MARK: setupConstraints
    public func setupConstraints() {
        
        NSLayoutConstraint.activate([
            videoView.topAnchor.constraint(equalTo: topAnchor),
            videoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            videoView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            profilePicture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            profilePicture.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            profilePicture.heightAnchor.constraint(equalToConstant: 60),
            profilePicture.widthAnchor.constraint(equalToConstant: 60),
            
            videoTitleLabel.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor),
            videoTitleLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 16),
            videoTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            fireImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            fireImage.heightAnchor.constraint(equalToConstant: 70),
            fireImage.widthAnchor.constraint(equalToConstant: 70),
            fireImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            fireLabel.trailingAnchor.constraint(equalTo: fireImage.leadingAnchor),
            fireLabel.centerYAnchor.constraint(equalTo: fireImage.centerYAnchor, constant: 10),
            
            heartImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            heartImage.heightAnchor.constraint(equalToConstant: 60),
            heartImage.widthAnchor.constraint(equalToConstant: 60),
            heartImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            heartLabel.leadingAnchor.constraint(equalTo: heartImage.trailingAnchor, constant: 8),
            heartLabel.centerYAnchor.constraint(equalTo: heartImage.centerYAnchor),
    
            loadingView.topAnchor.constraint(equalTo: topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor)
        ])
    }

    // MARK: setupAddtionalConfiguration
    public func setupAddtionalConfiguration() {
        backgroundColor = .white
        self.isUserInteractionEnabled = true

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeLeft.direction = .left
        self.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        swipeRight.direction = .right
        self.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
        swipeUp.direction = .up
        self.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
        swipeDown.direction = .down
        self.addGestureRecognizer(swipeDown)
    }
}

// MARK: - Methods

extension VideoFeedView {
    
    func setViewInfo(viewModel: VideoFeedViewModel) {
        profilePicture.image = viewModel.profilePicture
        videoTitleLabel.text = viewModel.videoTitle
        heartNumber = 0
        fireNumber = 0
    }
    
    func startLoading() {
        loadingView.isHidden = false
        activityIndicatorView.startAnimating()
    }
    
    func stopLoading() {
        loadingView.isHidden = true
        activityIndicatorView.stopAnimating()
    }
    
    // MARK: - Action
    
    @objc func selectHeart() {
        delegate?.selectHeart()
    }
    
    @objc func selectFire() {
        delegate?.selectFire()
    }
    
    @objc func swipeLeft() {
        selectFire()
    }
    
    @objc func swipeRight() {
        selectHeart()
    }
    
    @objc func swipeUp() {
        delegate?.swipeUp()
    }
    
    @objc func swipeDown() {
        delegate?.swipeDown()
    }
}
