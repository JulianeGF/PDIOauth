import AuthenticationServices
import SafariServices
import UIKit

class LoginViewController: UIViewController, ASWebAuthenticationPresentationContextProviding {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        overrideUserInterfaceStyle = .dark
                        
        let button = UIButton(frame: CGRect(x: 100, y: 700, width: 200, height: 50))
        button.backgroundColor = .black
        button.setTitle("Login com GitHub", for: .normal)
        button.addTarget(self, action: #selector(handlePresentingVC), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func handlePresentingVC() {
        guard let url = URL(string: "https://github.com/login/oauth/authorize") else { return }
        let scheme = "pdioauth"
        let session = ASWebAuthenticationSession(url: url, callbackURLScheme: scheme)
        { callbackURL, error in
            print("show")
        }
        
        session.presentationContextProvider = self
        session.start()

    }
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
            return view.window!
        }
}
