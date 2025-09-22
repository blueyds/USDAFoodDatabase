import Foundation



public struct USDANutrient: Decodable {
    public var id: Int?
    public var number: String
    public var name: String?
    public var rank: Int?
    public var unitName: String
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(forKey: .id)
        number = try container.decode(forKey: .number)
        name = try container.decodeIfPresent(forKey: .name)
        rank = try container.decodeIfPresent(forKey: .rank)
        unitName = try container.decode(forKey: .unitName)
    }
    
    public enum CodingKeys: String, CodingKey{
        case id 
        case number 
        case name 
        case rank 
        case unitName 
    }
}
