package com.vehicleApllication;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.user.DBconnect;
import com.user.user;
import com.vehicle.vehicle;

public class applicationUtil {
	private static Connection con = null;
	private static ResultSet rs = null;
	private static Statement stmt = null;
	
	public static boolean insertData(application application1) {
	String sql =" ";
	
		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			
		    String vType= application1.getvType();
		    String vModelName= application1.getvModelName();
		    String vBrand = application1.getvBrand();
		    int noOfSeats = application1.getNoOfSeats();
		    double price =application1.getPrice();
		    String ownerId =application1.getOwnerId();
		    String status= application1.getStatus();		    
		      sql = "INSERT INTO regapplication (vType, vModelName, vBrand, noOfSeats, price, ownerId,status) " +
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
	
	public static List<application> getAllRegistartionsOfUser(String idn) throws SQLException {
	    List<application> applications = new ArrayList<>();
	    
	    try {
	    	con=DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM regapplication WHERE ownerId='"+idn+"'";
			rs = stmt.executeQuery(sql);
			 while (rs.next()) {
		            int id = rs.getInt("id");
		            String vType = rs.getString("vType");
		            String vModelName = rs.getString("vModelName");
		            String vBrand = rs.getString("vBrand");
		            int noOfSeats = rs.getInt("noOfSeats");
		            Double price = rs.getDouble("price");
		            String status = rs.getString("status");
		            application regAppli = new application(vType, vModelName, vBrand, noOfSeats, price,idn);
		            regAppli.setStatus(status);
		            regAppli.setId(id);
		            applications.add(regAppli);
		        }
	    }catch(Exception e) {
			e.printStackTrace();
		}
	    
	    
	    
	 
	    return applications;
	}
	
	public static List<application> getAllRegistartions() throws SQLException {
	    List<application> applications = new ArrayList<>();
	    
	    try {
	    	con=DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM regapplication WHERE status='not reviewed yet'";
			rs = stmt.executeQuery(sql);
			 while (rs.next()) {
		            int id = rs.getInt("id");
		            String vType = rs.getString("vType");
		            String vModelName = rs.getString("vModelName");
		            String vBrand = rs.getString("vBrand");
		            int noOfSeats = rs.getInt("noOfSeats");
		            Double price = rs.getDouble("price");
		            String ownerId =rs.getString("ownerId");
		            String status = rs.getString("status");
		            application regAppli = new application(vType, vModelName, vBrand, noOfSeats, price,ownerId);
		            regAppli.setStatus(status);
		            regAppli.setId(id);
		            applications.add(regAppli);
		        }
	    }catch(Exception e) {
			e.printStackTrace();
		}
   
	 
	    return applications;
	}
	
	public static vehicle getRegistrationFromId(String idn) throws SQLException {

	    
	    try {
	    	con=DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM regapplication WHERE id='"+idn+"'";
			rs = stmt.executeQuery(sql);
			 while (rs.next()) {
		            int id = rs.getInt("id");
		            String vType = rs.getString("vType");
		            String vModelName = rs.getString("vModelName");
		            String vBrand = rs.getString("vBrand");
		            int noOfSeats = rs.getInt("noOfSeats");
		            Double price = rs.getDouble("price");
		            String ownerId = rs.getString("ownerId");
		            vehicle v1 = new vehicle(vType, vModelName, vBrand, noOfSeats, price,ownerId);
		            return v1;
		        }
	    }catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	    
	    
	    
	 
	   
	}
	
	public static boolean approveApplication(String id) {
		
		try {
			
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			
			
		    String sql = "UPDATE regapplication set status='approved' where id="+id;
		        
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
	
	
	public static boolean deleteApllication(String applicationId) {
	    try {
            con = DBconnect.getConnection();
            String sql = "DELETE FROM regapplication WHERE id ="+applicationId;
            stmt = con.prepareStatement(sql);
            
          //System.out.println(sql);
		      int rowsAffected = stmt.executeUpdate(sql);
		        
		        // Check if insertion was successful
		      if (rowsAffected > 0) {
		         return true;
		     } else {
		           return false;
		     }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
		
		
		
	}


}}
