//
//  File.swift
//  USDAFoodDatabase
//
//  Created by Craig Nunemaker on 9/21/25.
//

import Foundation

extension KeyedDecodingContainer{
	public func decodeIfPresent<T:Decodable>(forKey key: K) throws ->T?{
		try decodeIfPresent(T.self, forKey: key)
	}
	public func decode<T:Decodable>(forKey key: K) throws -> T{
		try decode(T.self, forKey: key)
	}

	public func decodeEmptyIfError<T:Decodable>(forKey key: K) throws -> [T]{
		do{
			let result = try decode([T].self, forKey: key)
			return result
		}catch(_) {
			return []
		}
	}

}


public func decode<T:Decodable>(forType: T.Type = T.self, from data: Data)->T?{
	//var result: T? = nil
	do{
		let result = try  JSONDecoder().decode(forType, from: data)
		return result
	}
	catch (DecodingError.dataCorrupted(let context)){
		print("Decoding data corrupted \(context)")
		return nil
	}
	catch(DecodingError.keyNotFound(let key, let context)){
		print("Decoding key\(key) NotFound \(context)")
		return nil
	}
	catch(DecodingError.typeMismatch(let type, let context)){
		print("Decoding type \(type) mismatch \(context)")
		return nil
	}
	catch(DecodingError.valueNotFound(let type, let context)){
		print("Decoding value not found for type \(type) \(context)")
		return nil
	}
	catch(_){
		print("Other decoding error from Utiliies.swift public func decode<T:Decodable>(forType: \(T.self), from : \(data))")
		return nil
	}
}
