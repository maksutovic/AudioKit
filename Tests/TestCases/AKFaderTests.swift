// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AudioKit

class AKFaderTests: AKTestCase {

    func testDefault() {
        output = AKFader(input, gain: 1.0)
        AKTestNoEffect()
    }

    func testBypass() {
        let fader = AKFader(input, gain: 2.0)
        fader.bypass()
        output = fader
        AKTestNoEffect()
    }

    func testMany() {
        let initialFader = AKFader(input, gain: 1.0)
        var nextFader = initialFader
        for _ in 0 ..< 200 {
            let fader = AKFader(nextFader, gain: 1.0)
            nextFader = fader
        }
        output = nextFader
        AKTestNoEffect()
    }


    func testParameters() {
        output = AKFader(input, gain: 2.0)
        AKTestMD5("09fdb24adb3181f6985eba4b408d8c6d")
    }

    func testParameters2() {
        output = AKFader(input, gain: 0.5)
        AKTestMD5("79972090508032a146d806185f9bc871")
    }
}
