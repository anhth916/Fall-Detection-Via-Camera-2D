/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;


/**
 *
 * @author dylan
 */
public class data2 {
    int id;
    int user_id;
    String name;
    String data_time;

    public data2() {
    }

    public data2(int id, int user_id, String name, String data_time) {
        this.id = id;
        this.user_id = user_id;
        this.name = name;
        this.data_time = data_time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getData_time() {
        return data_time;
    }

    public void setData_time(String data_time) {
        this.data_time = data_time;
    }

    @Override
    public String toString() {
        return "data{" + "id=" + id + ", user_id=" + user_id + ", name=" + name + ", data_time=" + data_time + '}';
    }
    
}

