//
//  ViewController.swift
//  PDIOauth
//
//  Created by developer on 21/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
                
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.backgroundColor = .black
        button.setTitle("Login com GitHub", for: .normal)
        button.addTarget(self, action: #selector(handlePresentingVC(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func handlePresentingVC(_ sender: UIButton) {
        
    }
}
