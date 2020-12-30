//
//  APWaveView.swift
//  simpleWaveView
//
//  Created by pirzad on 12/29/20.
//

import UIKit
import SnapKit

class APWaveView: UIView {
    private lazy var waveView = WaveView(color: .black, bytesCount: 70)
    private lazy var mainView = UIView()
    private lazy var stack = UIView()
    private lazy var clearView = UIView()
    private lazy var fillView = UIView()

    private var fillViewWidth: Constraint?

    var value: CGFloat?

    override init(frame: CGRect) {
        super.init(frame: frame)
        clearView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        fillView.backgroundColor = .white
        addSubview(stack)
        addSubview(mainView)
        stack.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        mainView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        stack.backgroundColor = .clear
        stack.addSubview(clearView)
        stack.addSubview(fillView)
        fillView.snp.makeConstraints { (make) in
            make.top.bottom.left.equalToSuperview()
            fillViewWidth =  make.width.equalTo(0).constraint
        }
        clearView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(fillView.snp.left)
            make.right.equalToSuperview()
        }

        mainView.addSubview(waveView)
        waveView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }

        DispatchQueue.main.async {
            self.mainView.frame = self.waveView.frame
            self.stack.mask = self.mainView
        }

        // PanGesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panHandler(sender:)))
        stack.addGestureRecognizer(panGesture)

        // UITapHandler
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler(sender:)))
        stack.addGestureRecognizer(tapGesture)
    }

    @objc
    private func tapHandler(sender: UITapGestureRecognizer) {
        let location = sender.location(in: sender.view)
        let newX = location.x
        value = newX / frame.width
        updateWidth(width: newX)
    }

    @objc
    private func panHandler(sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: sender.view)
            let width = fillView.frame.width + translation.x
            updateWidth(width: width)
            sender.setTranslation(CGPoint.zero, in: sender.view)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateWidth(width: CGFloat) {
        fillViewWidth?.update(offset: width)
        UIView.animate(withDuration: 0.3) {
            self.mainView.layoutIfNeeded()
        }
    }

    func updateValue(value: CGFloat?) {
        let width = (value ?? 0) * frame.size.width
        updateWidth(width: width)
    }
}
