/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.......,
 */
package model;


public class MaxillofacialRecord {
    private int id;
    private String upper;
    private String lower;
    private String dental;
    private Type type;
    private String code;

    public MaxillofacialRecord() {
    }

    public MaxillofacialRecord(int id, String upper, String lower, String dental, Type type, String code) {
        this.id = id;
        this.upper = upper;
        this.lower = lower;
        this.dental = dental;
        this.type = type;
        this.code = code;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUpper(String upper) {
        this.upper = upper;
    }

    public void setLower(String lower) {
        this.lower = lower;
    }

    public void setDental(String dental) {
        this.dental = dental;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getId() {
        return id;
    }

    public String getUpper() {
        return upper;
    }

    public String getLower() {
        return lower;
    }

    public String getDental() {
        return dental;
    }

    public Type getType() {
        return type;
    }

    public String getCode() {
        return code;
    }

    @Override
    public String toString() {
        return "MaxillofacialRecord{" + "id=" + id + ", upper=" + upper + ", lower=" + lower + ", dental=" + dental + ", type=" + type + ", code=" + code + '}';
    }
    
}
