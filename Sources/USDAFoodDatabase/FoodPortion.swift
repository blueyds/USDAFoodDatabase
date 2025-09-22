import Foundation


public struct USDAFoodPortion: Decodable {
    private var usdaId: Int?
    public var amount: Double?
    public var dataPoints: Int?
    public var gramWeight: Double?
    public var minYearAcquired: Int?
    public var modifier: String?
    public var portionDescription: String?
    public var sequenceNumber: Int?
    public var measureUnit: USDAMeasureUnit?
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        usdaId = try container.decodeIfPresent(forKey: .usdaId)
        amount = try container.decodeIfPresent(forKey: .amount)
        dataPoints = try container.decodeIfPresent(forKey: .dataPoints)
        gramWeight = try container.decodeIfPresent(forKey: .gramWeight)
        minYearAcquired = try container.decodeIfPresent(forKey: .minYearAcquired)
        modifier = try container.decodeIfPresent(forKey: .modifier)
        portionDescription = try container.decodeIfPresent(forKey: .portionDescription)
        sequenceNumber = try container.decodeIfPresent(forKey: .sequenceNumber)
        measureUnit = try container.decodeIfPresent(forKey: .measureUnit)
    }
    
    public enum CodingKeys: String, CodingKey {
        case usdaId = "id"
        case amount
        case dataPoints
        case gramWeight
        case minYearAcquired
        case modifier
        case portionDescription
        case sequenceNumber
        case measureUnit
    }
}


