import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn1(_ sender: Any) {
        let sb = UIStoryboard(name: "OpenLight", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btn2(_ sender: Any) {
        let sb = UIStoryboard(name: "SOSFlashLight", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btn3(_ sender: Any) {
        let sb = UIStoryboard(name: "SOSLight", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btn4(_ sender: Any) {
//        let sb = UIStoryboard(name: "SecurityBuzzerOn", bundle: nil)
//        let vc = sb.instantiateInitialViewController()
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

