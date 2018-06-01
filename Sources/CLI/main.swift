//
//  main.swift
//  CLI
//
//  Created by Christopher Mühl on 01.06.18.
//

import Foundation
import Origami

let path = Bundle.main.path(forResource: "example", ofType: "origami")
let stream = InputStream(fileAtPath: path!)
stream?.open()
let origami = Origami(stream: stream!)
