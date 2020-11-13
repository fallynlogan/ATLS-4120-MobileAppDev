package com.example.funi

import android.text.Editable

data class QuizScreen(var name:CharSequence = "", var gradeLevel:String = "", var subject:String = "") {
    fun quiz(position:Int, text:String, quizSubject: CharSequence)
    {
        setName(text)
        setSubject(quizSubject)
        setGradeLevel(position)
    }

    private fun setName(text:String)
    {
        name = text
    }

    private fun setGradeLevel(position:Int)
    {
        when(position) {
            0 -> gradeLevel = "pre-school"
            1 -> gradeLevel = "kindergarten"
            2 -> gradeLevel = "1st grade"
            3 -> gradeLevel = "2nd grade"
            4 -> gradeLevel = "3rd grade"
            else -> gradeLevel = "grade"
        }
    }

    private fun setSubject(quizSubject:CharSequence)
    {
        when(quizSubject) {
            "Math" -> subject = "Math"
            "Reading" -> subject = "Reading"
        }
    }

}