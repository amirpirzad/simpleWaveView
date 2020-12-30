//
//  WaveView.swift
//  simpleWaveView
//
//  Created by pirzad on 12/23/20.
//

import UIKit

class WaveView: UIView {
    var bytesCount: Int
    var color: UIColor
    
    init(color: UIColor, bytesCount: Int) {
        self.color = color
        self.bytesCount = bytesCount
        super.init(frame: .zero)
        backgroundColor = .clear
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
            let waveSize = factor * bounds.height * 1.5
            let y = bounds.height - waveSize
            let padding = finishPointPath.lineWidth * 1.5
            let move = CGPoint(x: finishPointPath.currentPoint.x + padding, y: y)
            finishPointPath.move(to: move)
            let line = CGPoint(x: Double(finishPointPath.currentPoint.x), y: Double(waveSize))
            
            finishPointPath.addLine(to: line)
        }
        
        finishPointPath.close()
        color.setStroke()
        finishPointPath.fill()
        finishPointPath.stroke()
    }
}
