import UIKit

public protocol UIControllerLifeCycle: AnyObject {
    func didAppear()
}

public protocol RokuReportToolViewLogicProtocol: AnyObject {
    func showDialogView(with type: ReportToolAlertDialogType)
    func showThumbnail(with mediaType: ReportToolMediaType, image: UIImage)
    
    func presentController(controller: UIViewController)
    
    func showSpinnerView()
    func hideSpinnerView()
    func isSpinnerActive() -> Bool
    
    func getSummaryText() -> String
    func getDescriptionText() -> String
    
    // Send button states handling
    func enableSendButton()
    func disableSendButton()
    func unlockSendButtonUserInteraction()
    
    func updateIssueIDLabel(with issueID: String)
    func updateSummaryCounter()
}
