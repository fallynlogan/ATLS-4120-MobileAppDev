package com.example.lab7

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun startGame(view: View) {
        val startText = findViewById<TextView>(R.id.textView)
        val editName = findViewById<EditText>(R.id.editTextName)
        val name = editName.text

        startText.setText("Hey there, " + name + "!")
        val imageSmile = findViewById<ImageView>(R.id.imageView)
        imageSmile.setImageResource(R.drawable.smile_icon)
    }
}