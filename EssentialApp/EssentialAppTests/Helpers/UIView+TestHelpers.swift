//
//  Created by Maksim Soldatov on 19.12.20.
//
import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
