//
//  dealTableViewCell.swift
//  Shop-X-v1
//
//  Created by Mihir Kelkar on 9/6/14.
//  Copyright (c) 2014 Mihir Kelkar. All rights reserved.
//

import UIKit

class dealTableViewCell: UITableViewCell {

    @IBOutlet weak var tagName: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var storeName: UILabel!
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
