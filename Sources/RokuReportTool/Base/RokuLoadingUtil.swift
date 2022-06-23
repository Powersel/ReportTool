//
//  File.swift
//  
//
//  Created by Powersel on 23.06.2022.
//

import UIKit
import RokuAutoLayout

final class RokuLoadingUtil: UIViewController {
    
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var spinnerContainer: UIView!
    
    var spinner: RokuSpinner?
    var text: String?
    var counter:Int32 = 0
    
    let kMaxLoadingLabelLeadingSpace:CGFloat = 8
    
    init(text: String, countdown: Int32) {
        super.init(nibName: "RokuLoadingUtil", bundle: .module)
        self.counter = countdown
        self.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let text = text, !text.isEmpty {
            loadingLabel.text = text
            loadingLabel.preferredMaxLayoutWidth = self.view.bounds.size.width - 2 * kMaxLoadingLabelLeadingSpace
        }
        
        let rokuSpinner = RokuSpinner(frame: CGRect(x: 0, y: 0, width: 10, height: 10), counter: Int(counter), useLargeImage: true)
        spinner = rokuSpinner
        self.spinnerContainer.addSubview(rokuSpinner)
        spinner?.translatesAutoresizingMaskIntoConstraints = false
        _ = RokuAutoLayout.centerHorizontally(view: rokuSpinner, in: spinnerContainer)
        _ = RokuAutoLayout.centerVertically(view: rokuSpinner, in: spinnerContainer)
    }
}
