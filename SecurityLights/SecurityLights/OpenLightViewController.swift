import Foundation

class OpenLightViewController: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "title"
        LightManager.openLight()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LightManager.closeLight()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func imageBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}
