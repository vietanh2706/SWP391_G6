/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class Service {
 
    private int id;
    private String name;
    private String description;
    private User doctor_id;
    private String image;

    public Service(int id, String name, String description, User doctor_id, String image) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.doctor_id = doctor_id;
        this.image = image;
    }

   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(User doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Service{" + "id=" + id + ", name=" + name + ", description=" + description + ", doctor_id=" + doctor_id + ", image=" + image + '}';
    }

    
}
