//
//  ImageViewController.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 22/12/24.
//

import UIKit

class ImageViewController: UIViewController {
    
    private var imageCollectionView: UICollectionView!
    private var appData: [AppData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        prepareAppData()
        configuredCollectionView()
        
    }
    
    private func configuredCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width / 2 - 15, height: 150)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        imageCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        imageCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        view.addSubview(imageCollectionView)
        
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func prepareAppData() {
        for i in 0...15 {
            let _appData = AppData(appName: "App \(i)", downloadCount: String(arc4random()))
            appData.append(_appData)
        }
    }
}

extension ImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        let _appData = appData[indexPath.item]
        cell.configuredCell(using: _appData)
        return cell
    }
}
