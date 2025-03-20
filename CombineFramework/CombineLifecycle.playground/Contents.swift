import UIKit
import Combine

let numberPublisher = (1...10).publisher
let cancellable = numberPublisher.sink { print($0) }

DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
    cancellable.cancel()
    print("enter")
}
