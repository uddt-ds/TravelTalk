//
//  ViewController.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var homeCollectionView: UICollectionView!

    @IBOutlet var friendSearchBar: UISearchBar!

    let totalData = ChatList.list

    var currentData: [ChatRoom] = [
        .init(chatroomId: 0, chatroomImage: "", chatroomName: "", chatList: .init())
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()

        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        let xib = UINib(nibName: String(describing: HomeCollectionViewCell.self), bundle: nil)
        homeCollectionView.register(xib, forCellWithReuseIdentifier: String(describing: HomeCollectionViewCell.self))
        homeCollectionView.collectionViewLayout = getCollectionViewLayout()

        friendSearchBar.delegate = self
        currentData = totalData
    }

    private func setupNavigation() {
        let title = "TRAVEL TALK"
        navigationItem.title = title
    }

    func setupSearchBar() {
        friendSearchBar.placeholder = "친구 이름을 검색해보세요"
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
        return currentData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewCell.self), for: indexPath) as? HomeCollectionViewCell else { return .init() }
        cell.configureCell(currentData[indexPath.row])
        DispatchQueue.main.async {
            cell.homeImageView.layer.cornerRadius = cell.homeImageView.frame.width / 2
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, indexPath)
        let sb = UIStoryboard(name: ChatViewController.identifier, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ChatViewController.identifier) as? ChatViewController else { return }
        //TODO: 로직 수정 필요(데이터를 전달하는 방향으로 변경)
        vc.selectedIndex = indexPath.row
        vc.navTitle = currentData[indexPath.row].clearRoomName
        navigationItem.title = ""
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }

        if !text.isEmpty {
            currentData = totalData.filter({ $0.clearRoomName.contains(text) })
        } else {
            currentData = totalData
        }

        homeCollectionView.reloadData()
    }
}

