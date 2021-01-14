//
//  Created by Maksim Soldatov on 8.12.20.
//
import Foundation

public protocol FeedImageDataLoader {
    
    func loadImageData(from url: URL) throws -> Data
}
