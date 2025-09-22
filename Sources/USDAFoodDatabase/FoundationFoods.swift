//
//  FoundationData.swift
//  FoodLogger
//
//  Created by Craig Nunemaker on 8/9/25.

import Foundation
import SwiftData

@Model
public final class  USDAAbridgedFood:Decodable{
    public var fdcId: Int
    public var name: String
    public var dataType: String
    
    public init(_ fdcId: Int, _ name: String, dataType: String = "Foundation"){
        self.fdcId = fdcId
        self.name = name
        self.dataType = dataType
    }
    
    public enum CodingKeys: String, CodingKey{
        case fdcId
        case name = "description"
        case dataType
    }
    
    required public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fdcId = try container.decode(forKey: .fdcId)
        name = try container.decode(forKey: .name)
        dataType = try container.decode(forKey: .dataType)
    }
}
//public let foodList = [
//    (321358,"Hummus, commercial"),
//    (321359,"Milk, reduced fat, fluid, 2/% milkfat, with added vitamin A and vitamin D"),
//    (321360,"Tomatoes, grape, raw"),
//    (321505,"Salt, table, iodized"),
//    (321611,"Beans, snap, green, canned, regular pack, drained solid"),
//    (321900,"Broccoli, raw"),
//    (322228,"Milk, lowfat, fluid, 1% milkfat, with added vitamin A and vitamin D"),
//    (322559,"Milk, nonfat, fluid, with added vitamin A and vitamin D (fat free or skim)"),
//    (322892,"Milk, whole, 3.25% milkfat, with added vitamin D"),
//    (323121,"Frankfurter, beef, unheated"),
//    (323294,"Nuts, almonds, dry roasted, with salt added"),
//    (323444,"Cheese, ricotta, whole milk"),
//    (323505,"Kale, raw")]
/*
public let foodList = [
    FoodListItem(321358,"Hummus, commercial"),
    FoodListItem(321359,"Milk, reduced fat, fluid, 2/% milkfat, with added vitamin A and vitamin D"),
    FoodListItem(321360,"Tomatoes, grape, raw"),
    FoodListItem(321505,"Salt, table, iodized"),
    FoodListItem(321611,"Beans, snap, green, canned, regular pack, drained solid"),
    FoodListItem(321900,"Broccoli, raw"),
    FoodListItem(322228,"Milk, lowfat, fluid, 1% milkfat, with added vitamin A and vitamin D"),
    FoodListItem(322559,"Milk, nonfat, fluid, with added vitamin A and vitamin D (fat free or skim)"),
    FoodListItem(322892,"Milk, whole, 3.25% milkfat, with added vitamin D"),
    FoodListItem(323121,"Frankfurter, beef, unheated"),
    FoodListItem(323294,"Nuts, almonds, dry roasted, with salt added"),
    FoodListItem(323444,"Cheese, ricotta, whole milk"),
    FoodListItem(323505,"Kale, raw")]
*/
