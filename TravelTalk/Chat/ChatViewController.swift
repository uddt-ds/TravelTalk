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

        let xib = UINib(nibName: String(describing: MyChatTableViewCell.self), bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: String(describing: MyChatTableViewCell.self))
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.rowHeight = 160
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10  
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyChatTableViewCell.self), for: indexPath) as? MyChatTableViewCell else { return .init() }
        return cell
    }

}
