import Foundation


public struct USDAFoodDataCategory: Decodable {
    public var id: Int?
    public var code: String?
    public var name: String?
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(forKey: .id)
        code = try container.decodeIfPresent(forKey: .code)
        name = try container.decodeIfPresent(forKey: .name)
    }
    public enum CodingKeys: String, CodingKey{
        case id
        case code 
        case name = "description" 
    }
}
