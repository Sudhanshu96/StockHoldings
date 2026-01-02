//
//  HoldingsAPIResponse.swift

struct HoldingsAPIResponse: Codable {
    let data: UserHoldingResponse
    let success: Bool?
    let message: String?
}

struct UserHoldingResponse: Codable {
    let userHolding: [StockHoldingDTO]
}
