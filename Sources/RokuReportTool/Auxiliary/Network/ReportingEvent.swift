
//  ReportingEvent.swift
//  RockReportTool

import Foundation

public struct DataType<Data, RawValue> {
    public let rawValue: RawValue
}

public enum ReportingEventTag {}
public typealias ReportingEvent = DataType<ReportingEventTag, String>

extension ReportingEvent {
    static let actionIssueCreation = ReportingEvent(rawValue: "IssueCreation")
    static let actionImageUpload = ReportingEvent(rawValue: "ImageUpload")
    static let actionVideoUpload = ReportingEvent(rawValue: "VideoUpload")
}
