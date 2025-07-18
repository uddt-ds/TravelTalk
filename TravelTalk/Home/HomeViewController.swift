//
//  ViewController.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var homeCollectionView: UICollectionView!

//    let height: CGFloat = 80


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
        layout.itemSize = CGSize(width: deviceWidth, height: deviceWidth * 0.2)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical

        return layout
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ChatList.list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewCell.self), for: indexPath) as? HomeCollectionViewCell else { return .init() }
        cell.configureCell(ChatList.list[indexPath.row])
        DispatchQueue.main.async {
            cell.homeImageView.layer.cornerRadius = cell.homeImageView.frame.width / 2
        }
        return cell
    }
}

