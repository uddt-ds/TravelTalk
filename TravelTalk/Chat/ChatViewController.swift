//
//  ChatViewController.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

class ChatViewController: UIViewController {

    static let identifier = "ChatViewController"

    var selectedIndex: Int = 0

    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var chatTextView: UITextView!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var customTextBarStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        setupTextBar()
        setupSendButton()

        let chatXib = UINib(nibName: String(describing: ChatTableViewCell.self), bundle: nil)
        chatTableView.register(chatXib, forCellReuseIdentifier: String(describing: ChatTableViewCell.self))

        let myChatXib = UINib(nibName: String(describing: MyChatTableViewCell.self), bundle: nil)
        chatTableView.register(myChatXib, forCellReuseIdentifier: String(describing: MyChatTableViewCell.self))

        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.separatorStyle = .none
    }

    private func setupTextView() {
        chatTextView.backgroundColor = .clear
        chatTextView.isScrollEnabled = false
    }

    private func setupTextBar() {
        customTextBarStackView.backgroundColor = .systemGray6
        customTextBarStackView.layer.cornerRadius = 12
        customTextBarStackView.clipsToBounds = true
        customTextBarStackView.axis = .horizontal
        customTextBarStackView.distribution = .fill
        customTextBarStackView.alignment = .bottom
        customTextBarStackView.isLayoutMarginsRelativeArrangement = true
        customTextBarStackView.layoutMargins = .init(top: 4, left: 4, bottom: 4, right: 4)
    }

    private func setupSendButton() {
        let image = UIImage(systemName: "paperplane")
        sendButton.setImage(image, for: .normal)
        sendButton.tintColor = .lightGray
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ChatList.list[selectedIndex].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ChatList.list[selectedIndex].chatList[indexPath.row].user.name != "김새싹" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChatTableViewCell.self), for: indexPath) as? ChatTableViewCell else { return .init() }
            cell.configureCell(data: ChatList.list[selectedIndex].chatList[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyChatTableViewCell.self), for: indexPath) as? MyChatTableViewCell else { return .init() }
            cell.configureCell(data: ChatList.list[selectedIndex].chatList[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
