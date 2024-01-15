//
//  ViewController.swift
//  test
//
//  Created by Ali Siddiqui on 1/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .systemGray2
        textView.isScrollEnabled = false // Disable scrolling
        textView.font = UIFont.systemFont(ofSize: 16) // Set your preferred font size
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5.0
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8) // Adjust padding
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame;
        
        print("\n newFrame:  \(newFrame)")
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        // Remove placeholder text when the user starts editing
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        // Add placeholder text if the user ends editing with an empty field
        if textView.text.isEmpty {
            textView.text = "Enter text here"
            textView.textColor = UIColor.lightGray
        }
    }
}

