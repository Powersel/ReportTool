
import UIKit

typealias ButtonActionCompletionHandler = () -> ()

final public class RokuReportToolViewController: RokuBaseViewController {
    
    init(value: String) {
        super.init(nibName: "RokuReportToolViewController", bundle: .module)
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: "RokuReportToolViewController", bundle: nil)
//        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print("RokuReportToolViewController is loaded")
    }
}
