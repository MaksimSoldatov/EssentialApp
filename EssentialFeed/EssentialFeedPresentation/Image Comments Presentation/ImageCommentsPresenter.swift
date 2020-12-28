//
//  Created by Maksim Soldatov on 28.12.20.
//
import Foundation
import EssentialFeed

public final class ImageCommentsPresenter {
    
    public static var title: String {
        NSLocalizedString("image_comments_view_title",
                          tableName: "Feed",
                          bundle: Bundle(for: FeedPresenter.self),
                          comment: "Title for the image comments view")
    }
}
