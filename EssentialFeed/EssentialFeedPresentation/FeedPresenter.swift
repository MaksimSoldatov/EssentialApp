//
//  Created by Maksim Soldatov on 11.12.20.
//
import Foundation
import EssentialFeed

public final class FeedPresenter {
    
    public static var title: String {
        NSLocalizedString("feed_view_title",
                          tableName: "Feed",
                          bundle: Bundle(for: FeedPresenter.self),
                          comment: "Title for the feed view")
    }
    
    public static func map(_ feed: [FeedImage]) -> FeedViewModel {
        FeedViewModel(feed: feed)
    }
}
