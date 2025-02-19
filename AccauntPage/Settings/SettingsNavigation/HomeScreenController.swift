import UIKit

class HomeScreenSettingsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Home Screen"
        
        navigationItem.backButtonTitle = "Settings"
    }
}
