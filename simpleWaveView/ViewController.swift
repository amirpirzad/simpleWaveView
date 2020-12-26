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
        let waveView = WaveView(color: .black, bytesCount: 70)
        view.addSubview(waveView)
        waveView.translatesAutoresizingMaskIntoConstraints = false
        waveView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        waveView.centerXAnchor.constraint(lessThanOrEqualTo: view.centerXAnchor).isActive = true
        waveView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        waveView.widthAnchor.constraint(equalToConstant: 320).isActive = true

    }
}

