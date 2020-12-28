//
//  Created by Maksim Soldatov on 12.12.20.
//
import Foundation
import EssentialFeed

public final class FeedImagePresenter {
    
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
