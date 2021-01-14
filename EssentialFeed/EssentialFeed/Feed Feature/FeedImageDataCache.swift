//
//  Created by Maksim Soldatov on 18.12.20.
//
import Foundation

public protocol FeedImageDataCache {
    
    func save(_ data: Data, for url: URL) throws
}
