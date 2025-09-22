//
//  USDAFoodInfo.swift
//  FoodLogger
//
//  Created by Craig Nunemaker on 8/9/25.
//
import Foundation



public struct USDAApiClient {
	private let apiKey: String
	
	public init(apiKey: String){
		self.apiKey = apiKey
	}

	@available(macOS 12.0, *)
	public func getFood(fdcID: Int) async -> USDAFoodData? {
		var result: USDAFoodData? = nil
		if let url = getURL(fdcID: fdcID),
		   let responose = try? await URLSession.shared.data(from: url),
		   let food:USDAFoodData = decode(from: responose.0){
			result = food
		}
		return result
	}



	public func getURL(fdcID: Int)->URL? {
		var foodURL = USDAFoodUrl(apiKey: apiKey, path: "food/\(fdcID)")
		return foodURL.url
	}


	public func prepareAbridgedFoundationURL(forPage page: Int)->URL{
		var foodURL = USDAFoodUrl(apiKey: apiKey, path: "foods/list")
		foodURL.addQuery(name: "dataType", value: "Foundation")
		foodURL.addQuery(name: "pageSize", value: "50")
		foodURL.addQuery(name: "pageNumber", value: String(page))
		return foodURL.url!
	}


}

internal struct USDAFoodUrl{
	private let scheme: String = "https"
	private let host: String = "api.fns.usda.gov"
	private let defaultPath: String = "/fdc/v1"
	private var path: String = ""
	private var queryItems: [URLQueryItem]

	internal var url: URL?{
		var components: URLComponents = URLComponents()
		components.scheme = scheme
		components.host = host
		components.path = defaultPath + path
		components.queryItems = queryItems
		return components.url
	}

	internal init(apiKey: String, path: String){
		self.path = path
		self.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
	}

	internal init(apiKey: String, path: String, queryItems: [(name: String, value: String)]){
		self.path = path
		var queries = [URLQueryItem(name: "api_key", value: apiKey)]
		for query in queryItems {
			queries.append(URLQueryItem(name: query.name, value: query.value))
		}
		self.queryItems = queries
	}

	internal mutating func addQuery(name: String, value: String){
		queryItems.append(URLQueryItem(name: name, value: value))
	}
}
