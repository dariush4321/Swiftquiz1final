

import Foundation
import SwiftUI

class Glob: ObservableObject {
    @Published var array = ["Taxonomy", "The", "Civil"]
    @Published var question1 = ["Taxonomy", "The", "Word"]
    @Published var newword = 0
    @Published var i = 0
    @Published var streak = 12
}
