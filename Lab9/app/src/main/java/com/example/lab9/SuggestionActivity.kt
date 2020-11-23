package com.example.lab9

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.content_suggestion.*

class SuggestionActivity : AppCompatActivity() {
    private var distance : String? =null
    private var rideType : String? = null
    private var rideConditions : BooleanArray? = null
    private var resortUrl : String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_suggestion)
        setSupportActionBar(findViewById(R.id.toolbar))

        distance = intent.getStringExtra("distance")
        rideType = intent.getStringExtra("type")
        rideConditions = intent.getBooleanArrayExtra("conditions")

        println("$distance $rideType $rideConditions")
        makeSuggestion()

        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener {
            loadWebsite()
        }
    }

    fun loadWebsite() {
        var intent = Intent()
        intent.action = Intent.ACTION_VIEW
        intent.data = resortUrl?.let { Uri.parse(resortUrl) }

        if(intent.resolveActivity(packageManager) != null) {
            startActivity(intent)
        }
    }

    private fun makeSuggestion() {
        var suggestion = ""
        println("in make suggestion")
        if(distance == "20 miles") {
            suggestion = "Eldora"
            resortUrl = "https://www.eldora.com/"
        } else if (distance == "50 miles") {
            suggestion = "Loveland"
            resortUrl = "https://skiloveland.com/"
        } else if (distance == "100 miles") {
            suggestion = "Winter Park"
            resortUrl = "https://www.winterparkresort.com/"
        } else if (distance == "200 miles") {
            suggestion = "Steamboat"
            resortUrl = "https://www.steamboat.com/"
        } else if (distance == "300+ miles") {
            suggestion = "Telluride"
            resortUrl = "https://tellurideskiresort.com/"
        }

        var trails = ""
        val groomers = rideConditions?.get(0)
        val park = rideConditions?.get(1)
        val trees = rideConditions?.get(2)
        val powder = rideConditions?.get(3)
        if(suggestion == "Eldora"){
            when(groomers) {
                true -> trails += "Corona, "
            }
            when(park) {
                true -> trails += "Sundance, "
            }
            when(trees) {
                true -> trails += "Salto Glades, "
            }
            when(powder) {
                true -> trails += "Liftline, "
            }

        } else if (suggestion == "Loveland") {
            when(groomers) {
                true -> trails += "Richard's Run, "
            }
            when(park) {
                true -> trails += "Tempest, "
            }
            when(trees) {
                true -> trails += "Catwalk Trees, "
            }
            when(powder) {
                true -> trails += "Wild Child, "
            }

        } else if (suggestion == "Winter Park") {
            when(groomers) {
                true -> trails += "Sleeper, "
            }
            when(park) {
                true -> trails += "Ash Cat, "
            }
            when(trees) {
                true -> trails += "Eldorado, "
            }
            when(powder) {
                true -> trails += "South Basin, "
            }

        } else if (suggestion == "Steamboat") {
            when(groomers) {
                true -> trails += "Sunset, "
            }
            when(park) {
                true -> trails += "Yoo Hoo, "
            }
            when(trees) {
                true -> trails += "Christmas Tree Bowl, "
            }
            when(powder) {
                true -> trails += "The Ridge, "
            }

        } else if (suggestion == "Telluride") {
            when(groomers) {
                true -> trails += "Polar Queen, "
            }
            when(park) {
                true -> trails += "Hoot Brown, "
            }
            when(trees) {
                true -> trails += "Prospect Woods, "
            }
            when(powder) {
                true -> trails += "Gold Hill 1, "
            }

        }
        val text = "You should go $rideType at $suggestion and lap $trails because it is close to $distance away!"
        mountainSuggestionTextview.text = text
        println(trails)
        println(text)
    }


    override fun onBackPressed() {
        val data = Intent()
        data.putExtra("feedback", feedbackEditText.text.toString())
        setResult(Activity.RESULT_OK, data) //must be set before super.onBackPressed()
        super.onBackPressed()
        finish()
    }
}