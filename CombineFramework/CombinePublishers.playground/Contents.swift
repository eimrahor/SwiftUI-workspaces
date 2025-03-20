import UIKit
import Combine

//let publisher = Just("asd")
//
//let cancellable = publisher
//    .sink { print($0) }
//
////cancellable.cancel()

let numbersPublisher = [1,2,3,4,5,6].publisher
let doublePublisher = numbersPublisher.map { $0 * 2 }

doublePublisher.sink { print($0) }
