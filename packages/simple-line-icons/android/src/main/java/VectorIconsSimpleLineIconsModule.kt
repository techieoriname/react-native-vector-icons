package com.reactnativevectoricons.simple_line_icons

import com.facebook.react.bridge.ReactApplicationContext

class VectorIconsModule internal constructor(
    context: ReactApplicationContext,
) : VectorIconsSpec(context) {
    override fun getName(): String = NAME

    companion object {
        const val NAME = "VectorIconsSimpleLineIcons"
    }
}
