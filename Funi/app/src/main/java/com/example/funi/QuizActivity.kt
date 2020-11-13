 package com.example.funi

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import kotlinx.android.synthetic.main.activity_quiz.*

 class QuizActivity : AppCompatActivity() {
    private var name : String? = null
    private var subject : CharSequence? = null
    private var gradeLevel : String? = null
    private var quiz : Quiz? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_quiz)

        name = intent.getStringExtra("playerName")
        subject = intent.getCharSequenceExtra("subject")
        gradeLevel = intent.getStringExtra("gradeLevel")

        name?.let { Log.i("name received", it)}
        subject?.let { Log.i("subject received", it.toString())}
        gradeLevel?.let {Log.i("gradeLevel received", it)}
        makeQuiz()
    }

    fun makeQuiz() {
        when(subject) {
            "Reading" -> when (gradeLevel) {
                "pre-school" -> quiz = PreschoolReadingQuiz()
                "kindergarten" -> quiz = KindergartenReadingQuiz()
                "1st grade" -> quiz = FirstgradeReadingQuiz()
                "2nd grade" -> quiz = SecondgradeReadingQuiz()
                "3rd grade" -> quiz = ThirdgradeReadingQuiz()
                else -> quiz = Quiz()
            }
            "Math" -> when (gradeLevel) {
                "pre-school" -> quiz = PreschoolMathQuiz()
                "kindergarten" -> quiz = KindergartenMathQuiz()
                "1st grade" -> quiz = FirstgradeMathQuiz()
                "2nd grade" -> quiz = SecondgradeMathQuiz()
                "3rd grade" -> quiz = ThirdgradeMathQuiz()
                else -> quiz = Quiz()
            }
        }
    }
}