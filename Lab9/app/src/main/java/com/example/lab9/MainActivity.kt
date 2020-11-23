package com.example.lab9

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.RadioButton
import com.google.android.material.snackbar.Snackbar
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private var selectedDistancePosition = 0
    private var mySkiSuggestion = SkiSuggestion()
    private var rideType : CharSequence = ""
    private var groomers = false
    private var park = false
    private var trees = false
    private var powder = false
    private val REQUEST_CODE = 1


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findMountainButton.setOnClickListener {
            selectedDistancePosition = spinner.selectedItemPosition
            val rideID = radioGroup.checkedRadioButtonId
            if (rideID == -1) {
                //val fillingSnackbar = Snackbar.make(root_layout, "Please select a filling", Snackbar.LENGTH_SHORT)
                //fillingSnackbar.show()
            } else {
                 rideType = findViewById<RadioButton>(rideID).text
                if (checkBox1.isChecked) {
                    groomers = true
                }
                if (checkBox2.isChecked) {
                    park = true
                }
                if (checkBox3.isChecked) {
                    trees = true
                }
                if (checkBox4.isChecked) {
                    powder = true
                }

                mySkiSuggestion.makeSuggestion(selectedDistancePosition, rideType, groomers, park, trees, powder)
                println(mySkiSuggestion.distance + " " + mySkiSuggestion.ride + " " + mySkiSuggestion.conditions)
                val intent = Intent(this, SuggestionActivity::class.java)
                intent.putExtra("distance", mySkiSuggestion.distance)
                intent.putExtra("type", mySkiSuggestion.ride)
                intent.putExtra("conditions", mySkiSuggestion.conditions.toBooleanArray())
                startActivityForResult(intent, REQUEST_CODE)

            }
        }
    }
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if((requestCode == REQUEST_CODE) && (resultCode == Activity.RESULT_OK)) {
            reviewTextView.setText(data?.let{data.getStringExtra("feedback")})
        }
    }

}