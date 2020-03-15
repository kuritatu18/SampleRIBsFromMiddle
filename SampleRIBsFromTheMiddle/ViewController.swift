//
//  ViewController.swift
//  SampleRIBsFromTheMiddle
//
//  Created by Tatsunori Kuri on 2020/03/15.
//  Copyright © 2020 Tatsunori Kuri. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let button = UIButton(type: .system)
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLayout()
        setUpBindings()
    }

    private func makeLayout() {
        self.view.addSubview(self.button)
        self.button.setTitle("Present ViewController", for: .normal)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

    private func setUpBindings() {
        self.button.rx.tap.asSignal()
            .emit(onNext: { _ in
                print("test")
            })
            .disposed(by: disposeBag)
    }
}

