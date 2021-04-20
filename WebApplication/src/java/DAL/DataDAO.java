/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import entity.data;
import entity.data2;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author dylan
 */
public class DataDAO {
    public ArrayList<data2> getData(int id){
        ArrayList<data2> list = new ArrayList<>();
        try{
            String sql = "select * from data where use_id = ?";
            String dbUrl = "jdbc:mysql://127.0.0.1:3306/hopeteam";
            String username = "admin";
            String password = "password";
            Connection con = DriverManager.getConnection(dbUrl, username, password);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                data2 d = new data2();
                d.setId(rs.getInt(1));
                d.setUser_id(rs.getInt(2));
                d.setName(rs.getString(3));
                d.setData_time(rs.getString(4));
                list.add(d);
            }
        }
        catch(Exception e){
            System.out.println("not connect");
        }
        return list;
    }
    
    public static void main(String[] args) {
        DataDAO db = new DataDAO();
        ArrayList<data2> list = db.getData(2);
        for (data2 object : list) {
            System.out.println(object);
        }
    }
}
