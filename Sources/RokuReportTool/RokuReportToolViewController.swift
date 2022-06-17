
import UIKit

typealias ButtonActionCompletionHandler = () -> ()

final public class RokuReportToolViewController: RokuBaseViewController {
    
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var summaryCounterLabel: UILabel!
    @IBOutlet private weak var summryContainer: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var sendReportButton: UIButton!
    
    @IBOutlet weak var issueIDLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var optionalMediaLabel: UILabel!
    @IBOutlet weak var mediaButtonsStackView: UIStackView!
    
//    private let viewLogic = ReportToolViewLogic()
//    private var spinner: RokuSpinner?
    
    public init(value: String) {
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
