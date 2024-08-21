package com.vehicle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.user.DBconnect;
import com.vehicleApllication.*;


public class vehicleUtil {
	
	private static Connection con = null;
	private static ResultSet rs = null;
	private static Statement stmt = null;
	
	public static boolean addVehicle(vehicle v1) {
		String sql =" ";

		
		
			try {
				con = DBconnect.getConnection();
				stmt = con.createStatement();
				
			    String vType= v1.getvType();
			    String vModelName= v1.getvModelName();
			    String vBrand = v1.getvBrand();
			    int noOfSeats = v1.getNoOfSeats();
			    double price =v1.getPrice();
			    String ownerId =v1.getOwnerId();
			    String status= v1.getStatus();		    
			      sql = "INSERT INTO vehicle (vType, vModelName, vBrand, noOfSeats, price, ownerId,status) " +
			                     "VALUES ('" + vType + "', '" + vModelName + "', '" + vBrand + "', " +
			                     noOfSeats + ", " + price + ", '" + ownerId + "','"+status+"')";
			      
			        
			     
			      int rowsAffected = stmt.executeUpdate(sql);
			        
			        // Check if insertion was successful
			        if (rowsAffected > 0) {
			            return true;
			        } else {
			            return false;
			        }
				
				
			}catch(Exception e) {
				e.printStackTrace();
				return false;
			}
		

		}
	
	
	
	public static List<vehicle> getAllVehicleOfUser(String id) throws SQLException {
        List<vehicle> vehicles = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            con = DBconnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM vehicle WHERE ownerId = '" + id + "'";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int vehicleId = rs.getInt("id");
                String vType = rs.getString("vType");
                String vModelName = rs.getString("vModelName");
                String vBrand = rs.getString("vBrand");
                int noOfSeats = rs.getInt("noOfSeats");
                double price = rs.getDouble("price");
                String ownerId = rs.getString("ownerId");
                String status = rs.getString("status");
                vehicle vehicle = new vehicle(vType, vModelName, vBrand, noOfSeats, price, ownerId);
                vehicle.setId(vehicleId);
                vehicle.setStatus(status);
                vehicles.add(vehicle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return vehicles;
    }
	
	public static boolean makeUnavailable(String id) {
		try {
			
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			
			
			String sql = "UPDATE vehicle SET status='Unavailable' WHERE id=" + id;

		        
		     //System.out.println(sql);
		      int rowsAffected = stmt.executeUpdate(sql);
		      
		        // Check if insertion was successful
		      if (rowsAffected > 0) {
		         return true;
		     } else {
		           return false;
		     }
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	
	public static boolean makeAvailable(String id) {
		try {
			
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			
			
			String sql = "UPDATE vehicle SET status='available' WHERE id=" + id;

		        
		     //System.out.println(sql);
		      int rowsAffected = stmt.executeUpdate(sql);
		      
		        // Check if insertion was successful
		      if (rowsAffected > 0) {
		         return true;
		     } else {
		           return false;
		     }
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public static List<vehicle> getAvailableVehicles() throws SQLException {
        List<vehicle> vehicles = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            con = DBconnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM vehicle WHERE status = 'available'" ;
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int vehicleId = rs.getInt("id");
                String vType = rs.getString("vType");
                String vModelName = rs.getString("vModelName");
                String vBrand = rs.getString("vBrand");
                int noOfSeats = rs.getInt("noOfSeats");
                double price = rs.getDouble("price");
                String ownerId = rs.getString("ownerId");
                String status = rs.getString("status");
                vehicle vehicle = new vehicle(vType, vModelName, vBrand, noOfSeats, price, ownerId);
                vehicle.setId(vehicleId);
                vehicle.setStatus(status);
                vehicles.add(vehicle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return vehicles;
    }
	

}
