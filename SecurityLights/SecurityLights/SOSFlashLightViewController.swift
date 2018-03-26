import Foundation

class SOSFlashLightViewController: ViewController {
    
    var timer: Timer?
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "title"
        self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.flash), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LightManager.closeLight()
        timer?.invalidate()
    }
    
    @IBAction func sosFlashAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }

    func flash() {
        LightManager.openLight()
        if count >= 3 && count < 6 {
            Thread.sleep(forTimeInterval: 0.5)
        } else if count >= 9 {
            count = 0
            Thread.sleep(forTimeInterval: 0.5)
        } else {
            Thread.sleep(forTimeInterval: 0.5)
        }
        count = count + 1
        LightManager.closeLight()
    }
}
