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
    func didTapButton()
}

final class SampleViewController: UIViewController, SamplePresentable, SampleViewControllable {
    weak var listener: SamplePresentableListener?
    
    private let button = UIButton(type: .system)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLayout()
        setUpBindings()
    }
    
    private func makeLayout() {
        self.view.addSubview(self.button)
        
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    private func setUpBindings() {
        self.button.rx.tap.asSignal()
            .emit(onNext: { [unowned self] in
                self.listener?.didTapButton()
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - SamplePresentable
extension SampleViewController {
    func show(displayMessage: String) {
        self.button.setTitle(displayMessage, for: .normal)
    }
}
