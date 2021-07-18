//
//  ChatRoomViewController.swift
//  Chat App3(firebase)
//
//  Created by Kyohei Morinaka on 2021/04/12.
//

import UIKit

class ChatRoomViewController: UIViewController{

    private let cellId = "cellId"
    private var messages = [String]()
    
    private lazy var ChatInputAccessoryView: ChatinputAccessoryView = {
        let view = ChatinputAccessoryView()
        view.frame = .init(x: 0, y: 0, width: view.frame.width, height: 100)
        view.delegate = self
        return view
    }()
    
    @IBOutlet weak var ChatRoomTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ChatRoomTableView.delegate = self
        ChatRoomTableView.dataSource = self
        ChatRoomTableView.register(UINib(nibName: "ChatRoomTableViewCell", bundle:  nil), forCellReuseIdentifier: cellId)
        ChatRoomTableView.backgroundColor = .rgb(red: 118, green: 140, blue: 180)
    }
    
    
    override var inputAccessoryView: UIView? {
        get {
            return ChatInputAccessoryView
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }

    
}


extension ChatRoomViewController: ChatinputAccessoryViewDelegate {
    func tappedsendbottom(text: String) {
        messages.append(text)
        ChatInputAccessoryView.removeText()
        ChatRoomTableView.reloadData()
        print("ChatinputAccessoryViewDelegate  text: ", text)
    }
    
}


extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ChatRoomTableView.estimatedRowHeight = 20
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatRoomTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatRoomTableViewCell
 //       cell.TextView.text = messages[indexPath.row]
        cell.messagetext = messages[indexPath.row]
        return cell
    }
}
