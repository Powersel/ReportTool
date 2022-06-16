import Foundation

protocol IssueReportMediaButtonDelegate: AnyObject {
    func goToPhotoController()
    func goToVideoController()
    
    func removeThumbnail(with mediaType: IssueReportMediaButton.MediaType)
}
