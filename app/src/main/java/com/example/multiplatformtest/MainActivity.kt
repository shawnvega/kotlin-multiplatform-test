package com.example.multiplatformtest

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import kotlinx.android.synthetic.main.activity_main.*
import org.kotlin.mpp.mobile.CrossTest
import org.kotlin.mpp.mobile.createApplicationScreenMessage
import org.kotlin.mpp.mobile.getFullThumborURL
import java.lang.Exception

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<TextView>(R.id.main_text).text = createApplicationScreenMessage()
        button.setOnClickListener {
            processInput()
        }
    }

    fun processInput() {
        val baseUrl = textInputUrlBase.text.toString()
        val relativeUrl = textInputUrlRelative.text.toString()
        val widthText = textInputWidth.text
        val heightText = textInputHeight.text
        try {
            val width = widthText.toString().toInt()
            val height = heightText.toString().toInt()
            main_text.text = getFullThumborURL(baseUrl, relativeUrl, width, height)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    companion object {
        const val THUMBOR_BASE_URL = "https://img.te2.io"
    }
}
