//
//  ChatinputAccessoryView.swift
//  Chat App3(firebase)
//
//  Created by Kyohei Morinaka on 2021/04/14.
//

import UIKit

protocol ChatinputAccessoryViewDelegate: class {
    func tappedsendbottom(text: String)
}

class ChatinputAccessoryView: UIView {
    
    @IBAction func tappedsendbottom(_ sender: Any) {
        guard let text = chattextview.text else { return }
        delegate?.tappedsendbottom(text: text)
    }
    
    @IBOutlet weak var chattextview: UITextView!
    @IBOutlet weak var sendbotton: UIButton!
    
    weak var delegate: ChatinputAccessoryViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        

    
        nibInit()
        setupViews()
        autoresizingMask = .flexibleHeight
    }
    private func setupViews() {
        chattextview.layer.borderColor = UIColor.rgb(red: 230, green: 230, blue: 230).cgColor
        chattextview.layer.borderWidth = 1
        
        sendbotton.layer.cornerRadius = 15
        sendbotton.imageView?.contentMode = .scaleAspectFill
        sendbotton.contentHorizontalAlignment = .fill
        sendbotton.contentHorizontalAlignment = .fill
        sendbotton.isEnabled = false
        
        chattextview.text = ""
        chattextview.delegate = self
    }
    
    func removeText() {
        chattextview.text = ""
        sendbotton.isEnabled = false
    }
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    private func nibInit() {
        let nib = UINib(nibName: "ChatinputAccessoryView",bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
}

extension ChatinputAccessoryView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty{
            sendbotton.isEnabled = false
        }else {
            sendbotton.isEnabled = true
        }
    
    }
}
