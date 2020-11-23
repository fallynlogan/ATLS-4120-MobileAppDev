package com.example.lab9

data class SkiSuggestion(var ride: String = "", var distance: String = "", var conditions: MutableList<Boolean> = arrayListOf()) {
    fun makeSuggestion(position:Int, rideType: CharSequence, groomers: Boolean, park: Boolean, trees: Boolean, powder: Boolean) {
        setDistance(position)
        setRideType(rideType)
        setConditions(groomers, park, trees, powder)
    }

    private fun setConditions(groomers: Boolean, park: Boolean, trees: Boolean, powder: Boolean) {
        val list: MutableList<Boolean> = conditions.toMutableList()
        list.add(groomers)
        list.add(park)
        list.add(trees)
        list.add(powder)
        conditions = list
    }

    private fun setRideType(rideType: CharSequence) {
        ride = rideType.toString()
    }

    private fun setDistance(position: Int) {
        distance = when(position) {
            0 -> "20 miles"
            1 -> "50 miles"
            2 -> "100 miles"
            3 -> "200 miles"
            4 -> "300+ miles"
            else -> "miles"
        }
    }



}