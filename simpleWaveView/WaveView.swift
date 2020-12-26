//
//  WaveView.swift
//  simpleWaveView
//
//  Created by pirzad on 12/23/20.
//

import UIKit

class WaveView: UIView {
    var bytesCount: Int = 70
    var color: UIColor!

    init(color: UIColor, bytesCount: Int) {
        self.color = color
        self.bytesCount = bytesCount
        super.init(frame: .zero)
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        drawWaveView()
    }

    private func drawWaveView() {
        var data: [UInt] = []
        for _ in 0...bytesCount {
            let byte = UInt.random(in: 0...255)
            data.append(byte)
        }

        let finishPointPath = UIBezierPath()
        finishPointPath.lineWidth = (bounds.width / (CGFloat(bytesCount) * 1.5))

        for wave in data {
            let factor: CGFloat = CGFloat(Double(wave) / 255)
            var waveSize = factor * bounds.height * 1.5
            waveSize = max(waveSize, 10)
            let y = bounds.height - waveSize
            let padding = finishPointPath.lineWidth * 1.5
            finishPointPath.move(to: .init(x: finishPointPath.currentPoint.x + padding, y: y))
            finishPointPath.addLine(to: .init(x: Double(finishPointPath.currentPoint.x), y: Double(waveSize)))
        }

        finishPointPath.close()
        color.setStroke()
        finishPointPath.fill()
        finishPointPath.stroke()
    }
}
