import UIKit
import MediaPlayer
import AVFoundation

class SecurityBuzzerOnViewController: ViewController {
    
    var index: Int = 0
    var flashViewTimer: Timer?
    var initVolume: Float = 0.0
    var player: AVAudioPlayer!
    
    @IBOutlet var backgroudView: UIView!
    @IBOutlet weak var sosBuzzerBtn: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("Security Buzzer Title", comment: "");
        self.tabBarController?.tabBar.isHidden = true
        configureAVAudioSession()
        initVolume = AVAudioSession.sharedInstance().outputVolume
        turnUpVolume()
        flashViewTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(flashView), userInfo: nil, repeats: true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(notification), name: Notification.Name.UIApplicationWillEnterForeground, object: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if player != nil {
            player.stop()
            player = nil
        }
        flashViewTimer?.invalidate()
        backInitialVolume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func notification() {
        self.avPlaySound()
    }
    
    func configureAVAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch let error as NSError{
            print("\(error)")
        }
        do{
            try audioSession.overrideOutputAudioPort(AVAudioSessionPortOverride.speaker)
        } catch let error as NSError{
            print("\(error)")
        }
        do{
            try audioSession.setActive(true)
        } catch let error as NSError{
            print("\(error)")
        }
        NotificationCenter.default.addObserver(self, selector: #selector(interruption(notification:)), name: NSNotification.Name.AVAudioSessionInterruption, object: AVAudioSession.sharedInstance())
    }
    
    func interruption(notification : Notification) {
        guard let userInfo = notification.userInfo as? [String : Any] else {
            return
        }
        let type = userInfo[AVAudioSessionInterruptionTypeKey] as! Int
        if type == AVAudioSessionInterruptionType.ended.rawValue{
            try! AVAudioSession.sharedInstance().setActive(true)
            player.play()
        }else{
            player.pause()
        }
    }
    
    @IBAction func sosBuzzerAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    func turnUpVolume() {
        let volumeBig = MPVolumeView()
        var slider: UISlider?
        for view: UIView in volumeBig.subviews {
            if String(describing: type(of: view)) == "MPVolumeSlider"  {
                slider = view as? UISlider
                break
            }
        }
        var systemVolume = slider?.value ?? 0.5
        if systemVolume < 1.0 {
            slider?.setValue(1.0, animated: false)
            systemVolume = 1.0
        }
        avPlaySound()
    }
    
    func backInitialVolume(){
        let volumeBig = MPVolumeView()
        var slider: UISlider?
        for view: UIView in volumeBig.subviews {
            if String(describing: type(of: view)) == "MPVolumeSlider"  {
                slider = view as? UISlider
                break
            }
        }
        slider?.setValue(initVolume, animated: false)
    }
    
    @objc func flashView() {
        index += 1;
        if index % 2 == 1 {
            self.sosBuzzerBtn.setImage(#imageLiteral(resourceName: "img2"), for: .normal)
            self.backgroudView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.titleLabel.textColor = #colorLiteral(red: 0.9529411765, green: 0.03921568627, blue: 0.0862745098, alpha: 1)
            self.contentLabel.textColor = #colorLiteral(red: 0.9529411765, green: 0.03921568627, blue: 0.0862745098, alpha: 1)
            self.statusLabel.textColor = #colorLiteral(red: 0.9529411765, green: 0.03921568627, blue: 0.0862745098, alpha: 1)
        } else {
            self.sosBuzzerBtn.setImage(#imageLiteral(resourceName: "img1"), for: .normal)
            self.backgroudView.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
            self.titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.contentLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.statusLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            index = 0
        }
    }
}

extension SecurityBuzzerOnViewController: AVAudioPlayerDelegate {
    func avPlaySound()  {
        let audioFilePath = Bundle.main.path(forResource: "meka_ge_bouhan01", ofType: "mp3")
        let url = URL(fileURLWithPath: audioFilePath!)
        player = try? AVAudioPlayer(contentsOf: url)
        guard let currentPlayer = player else {
            return
        }
        currentPlayer.delegate = self
        currentPlayer.play()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        guard self.player != nil  else{
            return
        }
        self.avPlaySound()
    }
}
