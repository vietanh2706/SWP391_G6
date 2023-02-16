/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common;

import java.util.logging.Logger;

/**
 *
 * @author tiendang
 */
public class CBLog {
    public static final String TAG = "BOOKING-DOCTOR";
    
    public static void normalLog(String msg) {
        Logger.getLogger(TAG).info(msg);
    }
    
    public static void warningLog(String msg) {
        Logger.getLogger(TAG).warning(msg);
    }
}
