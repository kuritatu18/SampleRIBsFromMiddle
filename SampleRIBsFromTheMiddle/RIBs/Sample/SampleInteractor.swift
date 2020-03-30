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
}

protocol SamplePresentable: Presentable {
    var listener: SamplePresentableListener? { get set }

    func show(displayButtonText: String)
}

protocol SampleListener: class {
    func show(text: String)
    func detachSample()
}

final class SampleInteractor: PresentableInteractor<SamplePresentable>, SampleInteractable, SamplePresentableListener {
    weak var router: SampleRouting?
    weak var listener: SampleListener?

    private let displayButtonText: String

    init(presenter: SamplePresentable,
         displayButtonText: String) {
        self.displayButtonText = displayButtonText
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()

        presenter.show(displayButtonText: displayButtonText)
    }

    override func willResignActive() {
        super.willResignActive()

        print("detached SampleRIB")
    }
}

// MARK: - SamplePresentableListener
extension SampleInteractor {
    func didTapButton() {
        listener?.show(text: displayButtonText)
    }

    func viewDidDisappear() {
        listener?.detachSample()
    }
}
