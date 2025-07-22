//
//  ChatViewController.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

class ChatViewController: UIViewController {

    static let identifier = "ChatViewController"

    var navTitle: String = ""

    var chatData: [Chat] = []

    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var chatTextView: UITextView!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var customTextBarStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTextView()
        setupTextBar()
        setupSendButton()
        setupKeyboardEvent()

        let chatXib = UINib(nibName: CellIdentifier.chatTableViewCell, bundle: nil)
        chatTableView.register(chatXib, forCellReuseIdentifier: CellIdentifier.chatTableViewCell)

        let separteChatXib = UINib(nibName: CellIdentifier.separateChatTableViewCell, bundle: nil)
        chatTableView.register(separteChatXib, forCellReuseIdentifier: CellIdentifier.separateChatTableViewCell)

        let myChatXib = UINib(nibName: CellIdentifier.myChatTableViewCell, bundle: nil)
        chatTableView.register(myChatXib, forCellReuseIdentifier: CellIdentifier.myChatTableViewCell)

        let separteMyChatXib = UINib(nibName: CellIdentifier.separateMyChatTableViewCell, bundle: nil)
        chatTableView.register(separteMyChatXib, forCellReuseIdentifier: CellIdentifier.separateMyChatTableViewCell)

        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.separatorStyle = .none

        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.chatTableView.scrollToRow(at: IndexPath(row: chatData.count - 1, section: 0),
                                           at: .bottom, animated: false)
        }

        chatTextView.delegate = self
    }

    private func setupTextView() {
        chatTextView.backgroundColor = .clear
        chatTextView.isScrollEnabled = false
        chatTextView.textContainer.maximumNumberOfLines = 3
        chatTextView.autocorrectionType = .no
        chatTextView.spellCheckingType = .no
        chatTextView.autocapitalizationType = .none
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
            chatData.append(Chat(user: User(name: "김새싹", image: ""),
                                 date: DateFormatter.totalDate.string(from: Date()),
                                 message: chatTextView.text))
            chatTextView.text = ""
            chatTableView.reloadData()
            chatTableView.scrollToRow(at: IndexPath(row: chatData.count - 1, section: 0),
                                      at: .bottom, animated: true)
        }
        self.view.endEditing(true)
    }

    @IBAction func ViewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

extension ChatViewController: InitialSetProtocol {
    func setupNavigation() {
        navigationItem.title = navTitle
        navigationController?.navigationBar.tintColor = .black
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rawChatDate = chatData[indexPath.row]

        var previousDate: String? = nil
        if indexPath.row > 0 {
            previousDate = chatData[indexPath.row - 1].compareDate
        }

        let isValueChanged = rawChatDate.compareDate != previousDate

        if chatData[indexPath.row].user.name != "김새싹" {
            if isValueChanged {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.separateChatTableViewCell, for: indexPath) as? SeparateChatTableViewCell else { return .init() }
                cell.configureCell(data: chatData[indexPath.row])
                cell.configureDateLabel(date: chatData[indexPath.row].compareDate)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.chatTableViewCell, for: indexPath) as? ChatTableViewCell else { return .init() }
                cell.configureCell(data: chatData[indexPath.row])
                return cell
            }
        } else {
            if isValueChanged {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.separateMyChatTableViewCell, for: indexPath) as? SeparateMyChatTableViewCell else { return .init() }
                cell.configureCell(data: chatData[indexPath.row])
                cell.configureDateLabel(date: chatData[indexPath.row].compareDate)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.myChatTableViewCell, for: indexPath) as? MyChatTableViewCell else { return .init() }
                cell.configureCell(data: chatData[indexPath.row])
                return cell
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ChatViewController: UITextViewDelegate {

    func checkLineBreakNumber() {
        guard let text = chatTextView.text else { return }
        let lineBreak = "\n"
        let maximumNumberOfLines = 3
        let lines = text.components(separatedBy: lineBreak)
        if lines.count > maximumNumberOfLines {
            chatTextView.text = String(text.dropLast())
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        checkLineBreakNumber()
    }

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
