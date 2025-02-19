import UIKit

class ControlCenterSettingsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Control Center"
        
        navigationItem.backButtonTitle = "Settings"
    }
}
