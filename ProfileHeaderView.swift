//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Мария Можаева on 17.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    private let button = UIButton()
    
    private let avatar = UIImageView()
    
    private let userName = UILabel()
    
    private let status = UILabel()
    
    private let textField = UITextField()
    
    private var statusText = String()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureFrames()
    }
    
    func configureFrames() {
        addSubview(button)
        button.frame = CGRect(x: self.safeAreaInsets.left + 16, y: self.safeAreaInsets.top + 16 * 2 + 110 + 30, width: self.frame.width - self.safeAreaInsets.left - self.safeAreaInsets.right - 16 * 2, height: 50)
        button.backgroundColor = .blue
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        addSubview(avatar)
        avatar.image = #imageLiteral(resourceName: "ptica-popugaj-ara")
        avatar.frame = CGRect(x: self.safeAreaInsets.left + 16, y: self.safeAreaInsets.top + 16, width: 110, height: 110)
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 3
        avatar.clipsToBounds = true
        
        addSubview(userName)
        userName.frame = CGRect(x: self.safeAreaInsets.left + 16 + 110 + 20, y: self.safeAreaInsets.top + 27, width: self.frame.width - self.safeAreaInsets.left - 16 - 110 - 20 - self.safeAreaInsets.right - 16, height: 30)
        userName.textColor = .black
        userName.text = "Lucky Ara"
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userName.sizeToFit()
        
        addSubview(status)
        status.frame = CGRect(x: self.safeAreaInsets.left + 16 + 110 + 20, y: self.safeAreaInsets.top + 110 - (27 - 16) * 2, width: self.frame.width - self.safeAreaInsets.left - 16 - 110 - 20 - self.safeAreaInsets.right - 16, height: 30)
        status.textColor = .gray
        status.text = "Can't ctop coding..."
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.sizeToFit()
        
        addSubview(textField)
        textField.frame = CGRect(x: self.safeAreaInsets.left + 16 + 110 + 20, y: self.safeAreaInsets.top + 110 - (27 - 16) * 2 + status.frame.height + 10, width: self.frame.width - self.safeAreaInsets.left - 16 - 110 - 20 - self.safeAreaInsets.right - 16, height: 40)
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.text = "  Update your status..."
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        textField.addTarget(self, action: #selector(statusChanged), for: .editingChanged)
    }
    
    @objc func statusChanged() {
        statusText = textField.text ?? "No status"
    }
    
    @objc func buttonPressed() {
        status.text = statusText
    }
}
