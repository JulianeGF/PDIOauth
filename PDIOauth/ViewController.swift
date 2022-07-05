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
        
        let path = Bundle.main.url(forResource: "secretList", withExtension: "plist")!
        var secretList: SecretList?
    
        do {
            let data = try Data(contentsOf: path)
            let result = try PropertyListDecoder().decode(SecretList.self, from: data)
            secretList = result
        } catch {
            print(error)
        }
        
        guard let url = URL(string: "https://github.com/login/oauth/authorize?client_id=" + secretList!.clientID) else { return }
        let scheme = "pdioauth"
        let session = ASWebAuthenticationSession(url: url, callbackURLScheme: scheme)
        { callbackURL, error in
            print(callbackURL)
            print(error)
        }
        
        session.presentationContextProvider = self
        session.start()
    }
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window!
    }
}
