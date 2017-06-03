//
//  StaffViewTests.swift
//  StaffView
//
//  Created by James Bean on 1/19/17.
//
//

import XCTest
import Pitch
import PitchSpellingTools
import PlotModel
import StaffModel
import QuartzCore
import StaffView

class StaffViewTests: XCTestCase {
    
    func testMelodicCMajorTreble() {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 800, height: 200)
        let cMajorScale: PitchCollection = [60,62,64,65,67,69,71]
        cMajorScale.show(in: layer)
        layer.showTestBorder()
        layer.renderToPDF(name: "treble_c_major_melodic")
    }
    
    func testMelodicCMinorTreble() {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 800, height: 200)
        let cMajorScale: PitchCollection = [60,62,63,65,67,69,71]
        cMajorScale.show(in: layer)
        layer.showTestBorder()
        layer.renderToPDF(name: "treble_c_minor_melodic")
    }
    
    func testPDF() {
        
        var model = StaffModel(clef: Clef(.treble))
        
        let cMajorScale: PitchCollection = [60,62,64,65,67,69,71]
        let sequence: [StaffRepresentablePitch] = cMajorScale.map { pitch in
            let pitch = pitch.spelledWithDefaultSpelling()
            let notehead: Notehead = .ord
            return StaffRepresentablePitch.init(pitch, notehead)
        }
        
        let point = StaffPointModel(sequence)
        model.addPoint(point, at: 10)
        
        let layer = CALayer()
        //layer.frame = CGRect(x: 0, y: 0, width: 800, height: 200)
        
        let view = StaffView(model: model)
        view.render(in: layer, with: StaffViewConfiguration(staffSlotHeight: 12))
        layer.showTestBorder()
        layer.renderToPDF(name: "staff_triad")
    }
}
