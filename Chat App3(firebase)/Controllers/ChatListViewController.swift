//
//  ChatListViewController.swift
//  Chat App3(firebase)
//
//  Created by Kyohei Morinaka on 2021/04/11.
//

import UIKit

class ChatListViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatListTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped table view")
        let storyboard = UIStoryboard.init(name: "ChatRoom", bundle: nil)
        let  ChatRoomViewController = storyboard.instantiateViewController(withIdentifier: "ChatRoomViewController")
        navigationController?.pushViewController(ChatRoomViewController, animated: true)
        

    }
    
    
    
    private let cellId = "cellId"
    
    @IBOutlet weak var ChatListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ChatListTableView.delegate = self
        ChatListTableView.dataSource = self
        
        navigationController?.navigationBar.barTintColor = .rgb(red: 39, green: 49, blue: 69)
        navigationItem.title = "トーク"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let SignUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(SignUpViewController, animated: true, completion: nil)
    }
    
}

extension ChatListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    }
    
class ChatListTableViewCell: UITableViewCell{
    
    @IBOutlet weak var LatestMessageLabel: UILabel!
    @IBOutlet weak var PartnerLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var UserImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        UserImageView.layer.cornerRadius = 35
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
