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
public class Type {

    int id;
    String type_name;

    public Type() {
    }

    public Type(int id, String type_name) {
        this.id = id;
        this.type_name = type_name;
    }

    public int getId() {
        return id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    @Override
    public String toString() {
        return "Type{" + "id=" + id + ", type_name=" + type_name + '}';
    }


    
}
