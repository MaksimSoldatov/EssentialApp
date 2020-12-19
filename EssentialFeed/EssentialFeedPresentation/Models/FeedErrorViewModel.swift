//
//  Created by Maksim Soldatov on 11.12.20.
//

public struct FeedErrorViewModel {
    public let message: String?
    
    public static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    public static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
