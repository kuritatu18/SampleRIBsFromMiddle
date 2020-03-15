//
//  SampleViewController.swift
//  SampleRIBsFromTheMiddle
//
//  Created by Tatsunori Kuri on 2020/03/16.
//  Copyright © 2020 Tatsunori Kuri. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol SamplePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SampleViewController: UIViewController, SamplePresentable, SampleViewControllable {

    weak var listener: SamplePresentableListener?
}
