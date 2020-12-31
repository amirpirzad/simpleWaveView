//
//  ViewController.swift
//  simpleWaveView
//
//  Created by pirzad on 12/23/20.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var redWaveView: APWaveView!
    private lazy var waveView = APWaveView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemIndigo
        view.addSubview(waveView)
        waveView.update(defaultColor: UIColor.white.withAlphaComponent(0.5), seekColor: .white)
        waveView.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.center.equalToSuperview()
        }

        // set wave view value
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.waveView.updateValue(value: 0.5)
        }

        redWaveView.update(defaultColor: UIColor.red.withAlphaComponent(0.5), seekColor: .red)
        redWaveView.updateValue(value: 0.7)
    }
}

