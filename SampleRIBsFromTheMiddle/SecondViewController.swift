//
//  SecondViewController.swift
//  SampleRIBsFromTheMiddle
//
//  Created by Tatsunori Kuri on 2020/03/16.
//  Copyright © 2020 Tatsunori Kuri. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController {
    private let button = UIButton(type: .system)
    private let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: nil, action: nil)
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLayout()
        makeLayoutNavigation()
        setUpBindings()
    }

    private func makeLayout() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.button)
        self.button.setTitle("Start RIBs", for: .normal)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    private func makeLayoutNavigation() {
        self.navigationItem.rightBarButtonItem = closeButton
    }

    private func setUpBindings() {
        self.button.rx.tap.asSignal()
            .emit(onNext: { _ in
                print("test")
            })
            .disposed(by: disposeBag)
        
        self.closeButton.rx.tap.asSignal()
            .emit(onNext: { [unowned self] in
                self.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
}
