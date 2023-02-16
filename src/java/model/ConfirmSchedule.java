/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Time;

/**
 *
 * @author HaBui
 */
public class ConfirmSchedule {
    private int id;
    private int reservation_id;
    private int doctor_id;
    private int satff_id;
    private Time time_start;

    public ConfirmSchedule() {
    }

    public ConfirmSchedule(int id, int reservation_id, int doctor_id, int satff_id, Time time_start) {
        this.id = id;
        this.reservation_id = reservation_id;
        this.doctor_id = doctor_id;
        this.satff_id = satff_id;
        this.time_start = time_start;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReservation_id() {
        return reservation_id;
    }

    public void setReservation_id(int reservation_id) {
        this.reservation_id = reservation_id;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public int getSatff_id() {
        return satff_id;
    }

    public void setSatff_id(int satff_id) {
        this.satff_id = satff_id;
    }

    public Time getTime_start() {
        return time_start;
    }

    public void setTime_start(Time time_start) {
        this.time_start = time_start;
    }

    @Override
    public String toString() {
        return "ConfirmSchedule{" + "id=" + id + ", reservation_id=" + reservation_id + ", doctor_id=" + doctor_id + ", satff_id=" + satff_id + ", time_start=" + time_start + '}';
    }
    
    
    
    
    
    
}
