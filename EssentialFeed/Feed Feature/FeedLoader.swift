//
//  Created by Maksim Soldatov on 12/3/20.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
