package com.etech.momo_payment

internal object MomoPaymentResults {

    fun error(status: Int): Map<String, Any> {
        return HashMap<String, Any>().apply {
            put("isSuccess", false)
            put("status", status)
        }
    }

    fun success(token: String, phonenumber: String): Map<String, Any> {
        return HashMap<String, Any>().apply {
            put("isSuccess", true)
            put("status", 0)
            put("token", token)
            put("phonenumber", phonenumber)
        }
    }
}