//
//  Created by Maksim Soldatov on 12.12.20.
//

public struct FeedImageViewModel {
    
    public let description: String?
    public let location: String?
    
    public init(description: String?, location: String?) {
        self.description = description
        self.location = location
    }

    public var hasLocation: Bool {
        return location != nil
    }
}
