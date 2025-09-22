import Foundation


public  struct USDAFoodAttribute: Decodable {
    public var id: Int?
    public var sequenceNumber: Int?
    public var value: String?
    public var foodAttributeType: USDAFoodAttributeType?
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(forKey: .id)
        sequenceNumber = try container.decodeIfPresent(forKey: .sequenceNumber)
        value = try container.decodeIfPresent(forKey: .value)
        foodAttributeType = try container.decodeIfPresent(forKey: .foodAttributeType)
    }
    
    public enum CodingKeys: String, CodingKey{
        case id
        case sequenceNumber
        case value 
        case foodAttributeType = "FoodAttributeType"
    }
    
}
