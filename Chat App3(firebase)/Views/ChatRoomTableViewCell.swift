//
//  ChatRoomTableViewCell.swift
//  Chat App3(firebase)
//
//  Created by Kyohei Morinaka on 2021/04/12.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {
    
    var messagetext: String? {
        didSet {
            guard let text = messagetext else { return }
            let width = estimateFrameForTextView(text: text).width + 20
            
            massageTextViewWidthConstraint.constant = width
            TextView.text = text
        }
    }
    
    @IBOutlet weak var lavel: UILabel!
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var UserImageView: UIImageView!
    
    @IBOutlet weak var massageTextViewWidthConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        UserImageView.layer.cornerRadius = 30
        TextView.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func estimateFrameForTextView(text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
}

}
