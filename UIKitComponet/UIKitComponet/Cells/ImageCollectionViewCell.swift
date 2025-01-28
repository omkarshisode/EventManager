//
//  ImageCollectionViewCell.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 22/12/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "imageCollectionViewCell"
    
    private var appName: AppLabel!
    private var downloadCount: AppLabel!
    private var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
//        setUpLabel()
        setUpImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        setUpLabel()
        setUpImageView()
    }
    
    private func setUpImageView() {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "omkar_image")
        if let image = image {
            imageView.image = image
        }
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    private func setUpLabel() {
        appName = AppLabel()
        downloadCount = AppLabel()
        appName.translatesAutoresizingMaskIntoConstraints = false
        downloadCount.translatesAutoresizingMaskIntoConstraints = false
        appName.textAlignment = .center
        downloadCount.textAlignment = .center
        appName.textColor = .black
        appName.font = AppFonts.shared.headingSemiBold
        downloadCount.textColor = .black
        contentView.addSubview(appName)
        contentView.addSubview(downloadCount)
        
        NSLayoutConstraint.activate([
            appName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            appName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            appName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            appName.bottomAnchor.constraint(equalTo: downloadCount.topAnchor),
            
            downloadCount.topAnchor.constraint(equalTo: appName.bottomAnchor, constant: 10),
            downloadCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            downloadCount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            downloadCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    func configuredCell(using appData: AppData) {
//        appName.text = appData.appName
//        downloadCount.text = appData.downloadCount
    }
}
