//
//  Created by Maksim Soldatov on 12/5/20.
//
import Foundation
import EssentialFeed
import EssentialFeedCache

func uniqueImage() -> FeedImage {
    FeedImage(id: UUID(), description: "some description", location: "some location", url: anyURL())
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url)}
    return (models, local)
}

extension Date {
    private var feedCacheMaxAgeInDays: Int {
        return 7
    }
    
    func minusFeedCacheMaxAge() -> Date {
        return adding(days: -feedCacheMaxAgeInDays)
    }
}
