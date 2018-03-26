import Foundation
import AVFoundation
import AVKit

struct LightManager {
    static func adjustLight(){
        let device = AVCaptureDevice.defaultDevice(withMediaType:  AVMediaTypeVideo)
        
        if device == nil {
            return
        }
        
        if device?.torchMode == .off{
            do {
                try device?.lockForConfiguration()
            } catch {
                return
            }
            device?.torchMode = .on
            device?.unlockForConfiguration()
        } else {
            do {
                try device?.lockForConfiguration()
            } catch {
                return
            }
            device?.torchMode = .off
            device?.unlockForConfiguration()
        }
    }
    
    static func openLight() {
        let device = AVCaptureDevice.defaultDevice(withMediaType:  AVMediaTypeVideo)
        
        if device == nil {
            return
        }
        
        if device?.torchMode == .off{
            do {
                try device?.lockForConfiguration()
            } catch {
                return
            }
            device?.torchMode = .on
            device?.unlockForConfiguration()
        }
    }
    
    static func closeLight() {
        let device = AVCaptureDevice.defaultDevice(withMediaType:  AVMediaTypeVideo)
        
        if device == nil {
            return
        }
        if device?.torchMode == .on{
            do {
                try device?.lockForConfiguration()
            } catch {
                return
            }
            device?.torchMode = .off
            device?.unlockForConfiguration()
        }
    }
}
