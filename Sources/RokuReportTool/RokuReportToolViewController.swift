
import UIKit

typealias ButtonActionCompletionHandler = () -> ()

final public class RokuReportToolViewController: RokuBaseViewController {
    
    init(with value: String) {
        super.init(nibName: "RokuReportToolViewController", bundle: .module)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print("RokuReportToolViewController is loaded")
    }
}
