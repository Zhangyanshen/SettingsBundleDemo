//
//  ViewController.swift
//  SettingsBundleDemo
//
//  Created by 张延深 on 2020/2/11.
//  Copyright © 2020 张延深. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl1.text = "\(getLocalizedString("option_preference_text"))\(UserDefaults.standard.integer(forKey: "option_preference"))"
        lbl2.text = "\(getLocalizedString("api_preference_text"))\(UserDefaults.standard.string(forKey: "api_preference") ?? "")"
        lbl3.text = "\(getLocalizedString("rotation_lock_preference_text"))\(UserDefaults.standard.bool(forKey: "rotation_lock_preference") ? "true" : "false")"
        lbl4.text = "\(getLocalizedString("slider_preference_text"))\(UserDefaults.standard.float(forKey: "slider_preference"))"
        lbl5.text = "\(getLocalizedString("version_preference_text"))\(UserDefaults.standard.string(forKey: "version_preference") ?? "")"
    }

    func getLocalizedString(_ key: String) -> String {
        NSLocalizedString(key, comment: "")
    }

}

