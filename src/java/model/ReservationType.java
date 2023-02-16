/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Duc Anh
 */
public class ReservationType {

    private Reservation reservation_id;
    private Type Type_id;

    public ReservationType() {
    }

    public ReservationType(Reservation reservation_id, Type Type_id) {
        this.reservation_id = reservation_id;
        this.Type_id = Type_id;
    }

    public Reservation getReservation_id() {
        return reservation_id;
    }

    public void setReservation_id(Reservation reservation_id) {
        this.reservation_id = reservation_id;
    }

    public Type getType_id() {
        return Type_id;
    }

    public void setType_id(Type Type_id) {
        this.Type_id = Type_id;
    }

    @Override
    public String toString() {
        return "ReservationType{" + "reservation_id=" + reservation_id + ", Type_id=" + Type_id + '}';
    }

}
