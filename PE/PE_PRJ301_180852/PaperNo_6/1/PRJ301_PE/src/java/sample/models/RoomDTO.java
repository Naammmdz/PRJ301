/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.models;

/**
 *
 * @author Naammm
 */
public class RoomDTO {
    private String id;
    private String name;
    private String description;
    private float price;
    private float area;
    private boolean status;

    public RoomDTO() {
    }

    public RoomDTO(String id, String name, String description, float price, float area, boolean status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.area = area;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "RoomDTO{" + "id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", area=" + area + ", status=" + status + '}';
    }
    
    
}
