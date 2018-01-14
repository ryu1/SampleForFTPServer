//
//  ViewController.swift
//  SampleForFTPServer
//
//  Created by 石塚隆一 on 2018/01/13.
//  Copyright © 2018年 石塚隆一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var server: FtpServer! = nil
    var baseDir: String! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        let localIPAddress = NetworkController.localWifiIPAddress()
        let alert = UIAlertController(
            title: "Connect to \(localIPAddress!) port 20000, ",
            message: "The FTP Server has been enabled, please use FTP client software to transfer any import/export data to or from this device.  Press the \"Stop FTP Server\" button once all data transfers have been completed.",
            preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            self.server.stop()
        }))

        let docFolders = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        self.baseDir = docFolders.last!
        self.server = FtpServer(port: 20000, withDir: self.baseDir, notify: self)

        self.present(alert, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

