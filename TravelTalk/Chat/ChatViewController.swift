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
    var navTitle: String = ""

    private var chatData: [Chat] = [.init(user: User(name: "김새싹", image: ""), date: "00:00", message: "")]

    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var chatTextView: UITextView!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var customTextBarStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        setupTextBar()
        setupSendButton()
        setupKeyboardEvent()
        setupNavigation()

        chatData = ChatList.list[selectedIndex].chatList

        let chatXib = UINib(nibName: String(describing: ChatTableViewCell.self), bundle: nil)
        chatTableView.register(chatXib, forCellReuseIdentifier: String(describing: ChatTableViewCell.self))

        let myChatXib = UINib(nibName: String(describing: MyChatTableViewCell.self), bundle: nil)
        chatTableView.register(myChatXib, forCellReuseIdentifier: String(describing: MyChatTableViewCell.self))

        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.separatorStyle = .none

        chatTableView.scrollToRow(at: IndexPath(row: chatData.count - 1, section: 0), at: .bottom, animated: true)
        print(chatData.count)

        chatTextView.delegate = self
    }

    private func setupTextView() {
        chatTextView.backgroundColor = .clear
        chatTextView.isScrollEnabled = false
    }

    private func setupNavigation() {
        navigationItem.title = navTitle
        navigationController?.navigationBar.tintColor = .black
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
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }

    @objc private func sendButtonTapped(_ sender: UIButton) {
        if chatTextView.text != "" {
            chatData.append(Chat(user: User(name: "김새싹", image: ""), date: "00:00", message: chatTextView.text))
            self.view.endEditing(true)
            chatTextView.text = ""
            chatTableView.reloadData()
            chatTableView.scrollToRow(at: IndexPath(row: chatData.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if chatData[indexPath.row].user.name != "김새싹" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChatTableViewCell.self), for: indexPath) as? ChatTableViewCell else { return .init() }
            cell.configureCell(data: chatData[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyChatTableViewCell.self), for: indexPath) as? MyChatTableViewCell else { return .init() }
            cell.configureCell(data: chatData[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ChatViewController: UITextViewDelegate {

    func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }


    @objc
    func keyboardWillShow(_ sender: Notification) {
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height

        if view.frame.origin.y == 0 {
            view.frame.origin.y -= keyboardHeight
        }
    }


    @objc
    func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}
