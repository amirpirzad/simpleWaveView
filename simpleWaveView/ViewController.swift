//
//  ViewController.swift
//  simpleWaveView
//
//  Created by pirzad on 12/23/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let waveView = WaveView(color: .green, bytesCount: 70)
        view.addSubview(waveView)
        waveView.translatesAutoresizingMaskIntoConstraints = false
        waveView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        waveView.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor).isActive = true
        waveView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        waveView.widthAnchor.constraint(equalToConstant: 300).isActive = true

    }
}

