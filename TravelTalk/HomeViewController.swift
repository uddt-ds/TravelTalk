//
//  ViewController.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var homeCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()

        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        let xib = UINib(nibName: String(describing: HomeCollectionViewCell.self), bundle: nil)
        homeCollectionView.register(xib, forCellWithReuseIdentifier: String(describing: HomeCollectionViewCell.self))
        homeCollectionView.collectionViewLayout = getCollectionViewLayout()
    }

    private func setupNavigation() {
        let title = "TRAVEL TALK"
        navigationItem.title = title
    }


}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    private func getCollectionViewLayout() -> UICollectionViewFlowLayout {

        let deviceWidth = UIScreen.main.bounds.width

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: deviceWidth, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical

        return layout
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewCell.self), for: indexPath) as? HomeCollectionViewCell else { return .init() }
        return cell
    }
    

}

