//
//  PokemonCollectionViewCell.swift
//  PrettyGoodPokedex
//
//  Created by Kevin Tan on 8/20/19.
//  Copyright © 2019 Kevin Tan. All rights reserved.
//

import UIKit

// This protocol is used to pass a PokemonCollectionViewCell around a VIP cycle when we're
// trying to get the sprite for a Pokemon - it's not quite Clean Swift, but blame Apple not
// me :)
protocol PokemonCollectionViewDataSource {
    func setImage(to image: UIImage?)
}

class PokemonCollectionViewCell: UICollectionViewCell, PokemonCollectionViewDataSource {
    static let identifier = "PokemonCollectionViewCell"
    static let height: CGFloat = 200
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure subviews
        imageView.contentMode = .scaleAspectFit
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var imageViewFrame = CGRect.zero
        imageViewFrame.size.width = bounds.width
        imageViewFrame.size.height = bounds.width
        
        var nameLabelFrame = CGRect.zero
        nameLabelFrame.size = nameLabel.intrinsicContentSize
        nameLabelFrame.origin.x = (bounds.width - nameLabelFrame.width) / 2
        nameLabelFrame.origin.y = (bounds.height + imageViewFrame.maxY - nameLabelFrame.height) / 2
        
        imageView.frame = imageViewFrame
        nameLabel.frame = nameLabelFrame
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // MARK: - Mutators
    
    func setImage(to image: UIImage?) {
        UIView.transition(with: imageView,
                          duration: 0.25,
                          options: .curveLinear,
                          animations: { self.imageView.image = image },
                          completion: nil)
    }
    
    func setName(to name: String) {
        nameLabel.text = name
        setNeedsLayout()
    }
}
