import UIKit
import WebKit

// Usar safari services

class LoginViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                        
        let button = UIButton(frame: CGRect(x: 100, y: 700, width: 200, height: 50))
        button.backgroundColor = .black
        button.setTitle("Login com GitHub", for: .normal)
        button.addTarget(self, action: #selector(handlePresentingVC), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func handlePresentingVC() {
        let url = URL(string: "https://www.github.com/login")!
        webView.load(URLRequest(url: url))
    }
}
