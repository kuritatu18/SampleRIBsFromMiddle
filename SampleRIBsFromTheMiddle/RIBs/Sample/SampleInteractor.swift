//
//  SampleInteractor.swift
//  SampleRIBsFromTheMiddle
//
//  Created by Tatsunori Kuri on 2020/03/16.
//  Copyright © 2020 Tatsunori Kuri. All rights reserved.
//

import RIBs
import RxSwift

protocol SampleRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SamplePresentable: Presentable {
    var listener: SamplePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SampleListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SampleInteractor: PresentableInteractor<SamplePresentable>, SampleInteractable, SamplePresentableListener {

    weak var router: SampleRouting?
    weak var listener: SampleListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SamplePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
