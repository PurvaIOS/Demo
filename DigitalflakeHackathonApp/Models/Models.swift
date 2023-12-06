//
//  CreateAccountModel.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/3/23.
//

import Foundation

// MARK: - CreateAccountModel
struct CreateAccountModel: Codable {
    let userID: Int
    let message: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case message
    }
}


// MARK: - LoginModel
struct LoginModel: Codable {
    let userID: Int
    let message: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case message
    }
}


// MARK: - GetSlotsModel
struct GetSlotsModel: Codable {
    let slots: [Slot]
}

// MARK: - Slot
struct Slot: Codable {
    let slotName: String
    let slotID: Int
    let slotActive: Bool

    enum CodingKeys: String, CodingKey {
        case slotName = "slot_name"
        case slotID = "slot_id"
        case slotActive = "slot_active"
    }
}


// MARK: - GetAvailabilityModel
struct GetAvailabilityModel: Codable {
    let availability: [Availability]
}

// MARK: - Availability
struct Availability: Codable {
    let workspaceName: String
    let workspaceID: Int
    let workspaceActive: Bool

    enum CodingKeys: String, CodingKey {
        case workspaceName = "workspace_name"
        case workspaceID = "workspace_id"
        case workspaceActive = "workspace_active"
    }
}

// MARK: - ConfirmBookingModel
struct ConfirmBookingModel: Codable {
    let message: String
}


// MARK: - GetBookingModel
struct GetBookingModel: Codable {
    let bookings: [Booking]
}

// MARK: - Booking
struct Booking: Codable {
    let workspaceName: String
    let workspaceID: Int
    let bookingDate: String

    enum CodingKeys: String, CodingKey {
        case workspaceName = "workspace_name"
        case workspaceID = "workspace_id"
        case bookingDate = "booking_date"
    }
}
