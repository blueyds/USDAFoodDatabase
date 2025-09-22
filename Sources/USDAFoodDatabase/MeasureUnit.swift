import Foundation



public struct USDAMeasureUnit: Decodable {
    public var id: Int?
    public var name: String?
    public var abbreviation: String?
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(forKey: .id)
        name = try container.decodeIfPresent(forKey: .name)
        abbreviation = try container.decodeIfPresent(forKey: .abbreviation)
    }
    
    public enum CodingKeys: String, CodingKey{
        case id
        case name 
        case abbreviation
    }
}
