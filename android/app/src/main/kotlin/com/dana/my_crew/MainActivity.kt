package com.dana.my_crew

import android.content.Context
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.os.Build
import android.widget.Toast
import androidx.annotation.RequiresApi
import com.google.firebase.firestore.FirebaseFirestore
import com.google.firebase.firestore.ktx.firestoreSettings
import io.flutter.embedding.android.FlutterActivity
import kotlin.system.exitProcess

class MainActivity: FlutterActivity() {
    lateinit var db: FirebaseFirestore

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onResume() {
        super.onResume()
        val settings = firestoreSettings {
            isPersistenceEnabled = false
        }
        db = FirebaseFirestore.getInstance()
        db.firestoreSettings = settings

        if(!isOnline(this)){
            close()
        }else {
            db.collection("Data").document("data").addSnapshotListener { snapshot, e ->
                if (e != null) {
                    close()
                    return@addSnapshotListener
                }
                if (snapshot != null && snapshot.exists()) {
                    val data = snapshot.data!!
                    if (!((data["can_read"] as Boolean))) {
                        Toast.makeText(this, (data["message"]).toString(), Toast.LENGTH_LONG).show()
                        close()
                    }
                }
            }
        }

    }

    private fun close(){
        this.finish()
        exitProcess(0)
    }

    @RequiresApi(Build.VERSION_CODES.M)
    fun isOnline(context: Context): Boolean {
        val connectivityManager =
            context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val capabilities =
            connectivityManager.getNetworkCapabilities(connectivityManager.activeNetwork)
        if (capabilities != null) {
            if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) || capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) || capabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET)) {
                return true
            }
        }
        return false
    }
}
