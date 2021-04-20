/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author dylan
 */
public class AccountDAO {
    
    public int checkAcc(String user, String pass){
        try{
            System.out.println(user + pass);
            String sql = "select * from account where username = ? and password = ?";
            String dbUrl = "jdbc:mysql://127.0.0.1:3306/hopeteam";
            String username = "admin";
            String password = "password";
            Connection con = DriverManager.getConnection(dbUrl, username, password);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                return rs.getInt(1);
            }
        }
        catch(Exception e){
            System.out.println("not connect");
        }
        return -1;
    }
    
    public int getid(String user, String pass){
        int check = checkAcc(user, pass);
        return check;
    }
    
    public static void main(String[] args) {
        AccountDAO db = new AccountDAO();
        System.out.println(db.checkAcc("Admin", "Admin"));
    }
}
