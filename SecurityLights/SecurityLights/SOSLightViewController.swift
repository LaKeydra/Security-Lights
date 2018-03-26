import UIKit

class SOSLightViewController: ViewController {
    
    var flashViewTimer: Timer?
    var index: Int = 0
    var sreenBrightness: CGFloat = 0.0
    
    @IBOutlet var backgroudView: UIView!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "title"
        flashViewTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(flashView), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        flashViewTimer?.invalidate()
        UIScreen.main.brightness = self.sreenBrightness
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func sosAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func flashView() {
        index += 1;
        if index % 2 == 1 {
            self.sosBtn.setImage(#imageLiteral(resourceName: "img2"), for: .normal)
            self.backgroudView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.titleLabel.textColor = #colorLiteral(red: 0.9529411765, green: 0.03921568627, blue: 0.0862745098, alpha: 1)
            self.contentLabel.textColor = #colorLiteral(red: 0.9529411765, green: 0.03921568627, blue: 0.0862745098, alpha: 1)
            self.statusLabel.textColor = #colorLiteral(red: 0.9529411765, green: 0.03921568627, blue: 0.0862745098, alpha: 1)
        } else {
            self.sosBtn.setImage(#imageLiteral(resourceName: "img1"), for: .normal)
            self.backgroudView.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
            self.titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.contentLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.statusLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            index = 0
        }
    }
}
