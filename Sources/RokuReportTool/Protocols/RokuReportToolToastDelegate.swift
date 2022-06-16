import Foundation

public protocol RokuReportToolToastDelegate: AnyObject {
    func showToasView(with issueID: String)
}
