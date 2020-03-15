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
    
    func show(displayMessage: String)
}

protocol SampleListener: class {
    func show(displayMessage: String)
}

final class SampleInteractor: PresentableInteractor<SamplePresentable>, SampleInteractable, SamplePresentableListener {
    weak var router: SampleRouting?
    weak var listener: SampleListener?
    
    private let displayMessage: String

    init(presenter: SamplePresentable,
         displayMessage: String) {
        self.displayMessage = displayMessage
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        presenter.show(displayMessage: displayMessage)
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

// MARK: - SamplePresentableListener
extension SampleInteractor {
    func didTapButton() {
        listener?.show(displayMessage: displayMessage)
    }
}
