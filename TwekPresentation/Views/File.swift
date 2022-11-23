import UIKit
import SwiftUI
func Encode<T: Encodable>(payload: T) -> Data {
    
    let encoder = JSONEncoder()
    let jsonData = try! JSONEncoder().encode(payload)
    return jsonData
}

func Decode(data: Data) -> [SimplePresentation]{
    let decoder = JSONDecoder()
    let sameEmployee = try? decoder.decode([SimplePresentation].self, from: data)
    return sameEmployee!
}

