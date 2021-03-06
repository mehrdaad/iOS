//
//  TabSwitcherSettings.swift
//  DuckDuckGo
//
//  Copyright © 2020 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Core

protocol TabSwitcherSettings {
 
    var isGridViewEnabled: Bool { get set }
    var hasSeenNewLayout: Bool { get set }
    
}

class DefaultTabSwitcherSettings: TabSwitcherSettings {

    @UserDefaultsWrapper(key: .gridViewEnabled, defaultValue: isGridViewDefault, setIfEmpty: true)
    var isGridViewEnabled: Bool

    @UserDefaultsWrapper(key: .gridViewSeen, defaultValue: false)
    var hasSeenNewLayout: Bool
    
    private static var isGridViewDefault: Bool = {
        return !DefaultVariantManager().isSupported(feature: .tabSwitcherListLayout)
    }()
}
