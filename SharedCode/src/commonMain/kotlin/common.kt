package org.kotlin.mpp.mobile

import kotlin.properties.Delegates

expect fun platformName(): String

fun createApplicationScreenMessage() : String {
    return "Kotlin Rocks on ${platformName()}"
}

fun reverseString(input: String): String {
    return input.reversed()
}


fun getFullThumborURL(baseUrl: String?, imgRelativePath: String, width: Int = 0, height: Int = 0): String {
    val PRE_PATH = "/unsafe"
    if (baseUrl != null && !imgRelativePath.startsWith("https://") && !imgRelativePath.startsWith("http://")) {
        val sb = StringBuilder(baseUrl)
        sb.append(PRE_PATH)
        if (width > 0 && height > 0) {
            sb.append("/")
            sb.append(width)
            sb.append("x")
            sb.append(height)
        }
        sb.append(imgRelativePath)
        return sb.toString()
    } else {
        return imgRelativePath
    }
}

fun String.globalFun(): String {
    return "to much fun!!!"
}

class CrossTest(val viewModelDidUpdate: () -> Unit) {
    val testString: String by Delegates.observable("") { _, _, _ ->
        viewModelDidUpdate()
    }
    val numberOfSections: Int by Delegates.observable(1234) { _, _, _ ->
        viewModelDidUpdate()
    }
}