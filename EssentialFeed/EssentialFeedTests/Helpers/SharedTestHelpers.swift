//
//  Created by Maksim Soldatov on 12/5/20.
//
import Foundation

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 1)
}

func anyData() -> Data {
    return Data("any data".utf8)
}

extension Date {
    func adding(seconds: TimeInterval) -> Date {
        return self + seconds
    }
    
    func adding(minutes: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .minute, value: minutes, to: self)!
    }
    
     
    func adding(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
}
