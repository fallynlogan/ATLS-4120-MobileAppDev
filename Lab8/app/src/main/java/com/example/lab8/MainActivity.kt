package com.example.lab8

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.RadioButton
import android.widget.TextView
import com.google.android.material.snackbar.Snackbar
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun checkAnswer(view: View) {
        var answer:CharSequence = ""
        var wordList = ""
        val answerID = radioGroup.checkedRadioButtonId
        val num1 = 16
        val num2 = 9
        if(answerID == -1)
        {
            //snackbar
            val answerSnackbar = Snackbar.make(root_layout, "Please select an answer for the question", Snackbar.LENGTH_SHORT)
            answerSnackbar.show()
        } else {
            answer = findViewById<RadioButton>(answerID).text
            if(checkBox1.isChecked)
            {
                wordList += " " + checkBox1.text
            }
            if(checkBox2.isChecked)
            {
                wordList += " " + checkBox2.text
            }
            if(checkBox3.isChecked)
            {
                wordList += " " + checkBox3.text
            }
            if(checkBox4.isChecked)
            {
                wordList += " " + checkBox4.text
            }
            if(wordList.isNotEmpty())
            {
                //https://stackoverflow.com/questions/5858307/charsequence-to-int
                if(num1 - num2 == Integer.parseInt(answer.toString())) {
                    val noun = spinner.selectedItem
                    val verb = if(switch1.isChecked)
                    {
                        "married"
                    } else {
                        "catapulted"
                    }
                    questionTextView.text = "You had $num1 $wordList $noun, then you $verb $num2  and only had $answer"
                } else {
                    val correctSnackbar = Snackbar.make(root_layout, "Answer incorrect, please try again.", Snackbar.LENGTH_SHORT)
                    correctSnackbar.show()
                }
            }
            else
            {
                val noun = spinner.selectedItem
                val verb = if(switch1.isChecked)
                {
                    "married"
                } else {
                    "catapulted"
                }
                questionTextView.text = "You had $num1 $noun, then you $verb $num2 and only had $answer"
            }


        }
    }
}