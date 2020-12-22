//
//  Created by Maksim Soldatov on 10.12.20.
//
import Combine
import EssentialFeed
import EssentialFeediOS
import EssentialFeedPresentation

final class FeedLoaderPresentationAdapter {
    private let feedLoader: () -> FeedLoader.Publisher
    private var cancellable: Cancellable?
    var presenter: FeedPresenter?
    
    init(feedLoader: @escaping () -> FeedLoader.Publisher) {
        self.feedLoader = feedLoader
    }
}

extension FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    
    func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()
        
        cancellable = feedLoader().sink { [weak self] completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                self?.presenter?.didFinishLoadingFeed(with: error)
            }
        } receiveValue: { [weak self] feed in
            self?.presenter?.didFinishLoadingFeed(with: feed)
        }
    }
}
