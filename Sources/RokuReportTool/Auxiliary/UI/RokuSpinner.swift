//
//  RokuSpinner.swift
//  RockReportTool
//
//  Created by Powersel on 02.06.2022.
//

import UIKit

protocol RokuSpinnerDelegate: AnyObject {
    func timerElapsed()
}

final class  RokuSpinner: UIView {
    weak var delegate: RokuSpinnerDelegate?
    
    static func createMaskedImage(with image: UIImage, fillColor: UIColor) -> UIImage {
        return UIImage()
    }
    
    func initWithFrame(frame: CGRect) -> RokuSpinner {
        return RokuSpinner()
    }
    
    func initWithFrame(frame: CGRect, counter: Int) -> RokuSpinner {
        return RokuSpinner()
    }
    
    func initWithFrame(frame: CGRect, counter: Int, useLargeImage: Bool) -> RokuSpinner {
        return RokuSpinner()
    }
    
    func initWithFrame(frame: CGRect, counter: Int, useLargeImage: Bool, spinnerColor: UIColor) -> RokuSpinner {
        return RokuSpinner()
    }
    
    func initWithFrame(frame: CGRect, counter: Int, image: UIImage) -> RokuSpinner {
        return RokuSpinner()
    }
    
    func startSpin() {
        
    }
    
    func endSpin() {
        
    }
}
