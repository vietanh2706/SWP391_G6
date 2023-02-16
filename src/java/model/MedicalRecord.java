/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class MedicalRecord {

    private int id;
    private int doctor_id;
    private int reservation_id;
    private int physical_id;
    private int internal_id;
    private int eye_id;
    private int ent_id;
    private int maxillofacial_id;
    private String diag;
    private String conclusion;
    private String code;
    private int status;

    public MedicalRecord() {
    }

    public MedicalRecord(int id, int doctor_id, int reservation_id, int physical_id, int internal_id, int eye_id, int ent_id, int maxillofacial_id, String diag, String conclusion, String code, int status) {
        this.id = id;
        this.doctor_id = doctor_id;
        this.reservation_id = reservation_id;
        this.physical_id = physical_id;
        this.internal_id = internal_id;
        this.eye_id = eye_id;
        this.ent_id = ent_id;
        this.maxillofacial_id = maxillofacial_id;
        this.diag = diag;
        this.conclusion = conclusion;
        this.code = code;
        this.status = status;
    }

    public MedicalRecord(int doctor_id, int reservation_id, int physical_id, int internal_id, int eye_id, int ent_id, int maxillofacial_id, String diag, String conclusion, String code, int status) {
        this.doctor_id = doctor_id;
        this.reservation_id = reservation_id;
        this.physical_id = physical_id;
        this.internal_id = internal_id;
        this.eye_id = eye_id;
        this.ent_id = ent_id;
        this.maxillofacial_id = maxillofacial_id;
        this.diag = diag;
        this.conclusion = conclusion;
        this.code = code;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public int getReservation_id() {
        return reservation_id;
    }

    public void setReservation_id(int reservation_id) {
        this.reservation_id = reservation_id;
    }

    public int getPhysical_id() {
        return physical_id;
    }

    public void setPhysical_id(int physical_id) {
        this.physical_id = physical_id;
    }

    public int getInternal_id() {
        return internal_id;
    }

    public void setInternal_id(int internal_id) {
        this.internal_id = internal_id;
    }

    public int getEye_id() {
        return eye_id;
    }

    public void setEye_id(int eye_id) {
        this.eye_id = eye_id;
    }

    public int getEnt_id() {
        return ent_id;
    }

    public void setEnt_id(int ent_id) {
        this.ent_id = ent_id;
    }

    public int getMaxillofacial_id() {
        return maxillofacial_id;
    }

    public void setMaxillofacial_id(int maxillofacial_id) {
        this.maxillofacial_id = maxillofacial_id;
    }

    public String getDiag() {
        return diag;
    }

    public void setDiag(String diag) {
        this.diag = diag;
    }

    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "MedicalRecord{" + "id=" + id + ", doctor_id=" + doctor_id + ", reservation_id=" + reservation_id + ", physical_id=" + physical_id + ", internal_id=" + internal_id + ", eye_id=" + eye_id + ", ent_id=" + ent_id + ", maxillofacial_id=" + maxillofacial_id + ", diag=" + diag + ", conclusion=" + conclusion + ", code=" + code + ", status=" + status + '}';
    }
   

}
