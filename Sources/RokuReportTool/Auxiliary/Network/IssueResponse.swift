//  IssueResponse.swift
//  RockReportTool

import Foundation

public struct IssueResponseError: Error, Decodable {
    public let title: String
    public let message: String
    public let code: Int
}

protocol IssueMediaUploadResponse {
    var uploaded: Bool { get set }
    var error: Error? { get set }
    var action: ReportingEvent { get }
}

struct ImageMediaUploadResponse: IssueMediaUploadResponse {
    var uploaded: Bool
    var error: Error?
    let action = ReportingEvent.actionImageUpload
}

struct VideoMediaUploadResponse: IssueMediaUploadResponse {
    var uploaded: Bool
    var error: Error?
    let action = ReportingEvent.actionVideoUpload
}

@objc public class IssueResponse: NSObject, Decodable {
    @objc public let issueId: String
    @objc public let imageUploadUrl: IssueAWSPresingedPayload?
    @objc public let videoUploadUrl: IssueAWSPresingedPayload?

    public let error: IssueResponseError?
    
    init(
        issueId: String,
        imagePayload: IssueAWSPresingedPayload?,
        videoPayload: IssueAWSPresingedPayload?,
        error: IssueResponseError?
    ) {
        self.issueId = issueId
        self.imageUploadUrl = imagePayload
        self.videoUploadUrl = videoPayload
        self.error = error
    }
    
    func getAWSPresingedPayload(with key: String) -> IssueAWSPresingedPayload? {
        let isPhotoPayload = key == "photo"
        return isPhotoPayload ? imageUploadUrl : videoUploadUrl
    }
}
