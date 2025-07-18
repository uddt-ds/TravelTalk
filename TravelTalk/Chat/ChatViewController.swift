//
//  ChatViewController.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xib = UINib(nibName: String(describing: ChatTableViewCell.self), bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: String(describing: ChatTableViewCell.self))
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.rowHeight = 100
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChatTableViewCell.self), for: indexPath) as? ChatTableViewCell else { return .init() }
        return cell
    }

}
