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
public class account {
    int id;
    String usename;
    String password;

    public account() {
    }

    public account(int id, String usename, String password) {
        this.id = id;
        this.usename = usename;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsename() {
        return usename;
    }

    public void setUsename(String usename) {
        this.usename = usename;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "account{" + "id=" + id + ", usename=" + usename + ", password=" + password + '}';
    }
    
}
