//
//  ViewController.swift
//  sirikit
//
//  Created by IRFAN TRIHANDOKO on 04/02/20.
//  Copyright © 2020 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    @IBOutlet weak var profileImg: RoundedImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var mottoLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
}

extension ViewController {
    
    func setupData() {
        let data = UserDefaults(suiteName: "group.id.gits.sirikit")?.string(forKey: "PERSON_INFO")
        if let dt = data {
            let dtComp = dt.components(separatedBy: "\n")
            nameLbl.text = dtComp.first?.capitalized ?? "-"
            addressLbl.text = dtComp[1]
            mottoLbl.text = "'\(dtComp.last ?? "-").'"
        } else {
            nameLbl.text = "No Data"
            addressLbl.text = "-"
            mottoLbl.text = "-"
        }
    }
    
    func removeData() {
        UserDefaults(suiteName: "group.id.gits.sirikit")?.removeObject(forKey: "PERSON_INFO")
    }
    
}


class RoundedImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        assert(bounds.height == bounds.width, "The aspect ratio isn't 1/1. You can never round this image view!")
        layer.cornerRadius = bounds.height / 2
    }
}
