import UIKit

class DisplayBrightnessSettingsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Display & Brightness"
        
        navigationItem.backButtonTitle = "Settings"
    }
}
