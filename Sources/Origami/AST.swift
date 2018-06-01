//
//  AST.swift
//  Origami
//
//  Created by Christopher Mühl on 01.06.18.
//

import Foundation

protocol Node {}
protocol Statement: Node {}
protocol Expression: Node {}
protocol Type: Node {}

class PointType: Type {}
class LineType: Type {}
class RegionType: Type {}

class Constructor: Expression {}
