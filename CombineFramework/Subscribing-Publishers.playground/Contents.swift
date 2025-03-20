import Foundation
import Combine

let timerPublisher = Timer.publish(every: 1, on: .main, in: .common)
let cancellable = timerPublisher.autoconnect()
    .sink { time in
        print("Timer ticked - \(time)")
    }

