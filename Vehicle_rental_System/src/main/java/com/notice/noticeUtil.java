package com.notice;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.booking.booking;
import com.user.DBconnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class noticeUtil {
	private static Connection con = null;
	private static ResultSet rs = null;
	private static Statement stmt = null;
	
	public static boolean addNotice(notice1 n1) {
		 try {       
    		 con = DBconnect.getConnection();
    		 stmt = con.createStatement();
		
		        // SQL query to insert a new booking
    		  String sql = "INSERT INTO notice (message,visibility) VALUES ('" + n1.getMessage() + "', '" + 
                      n1.getVisibility() + "')";
		
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
	
	public static List<notice1> getAllNotices(){
		List<notice1> noticeList = new ArrayList<>();
        
        try {
        	con=DBconnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "SELECT * FROM notice";
    		rs = stmt.executeQuery(sql);
    		 while (rs.next()) {
    			 	int idint = rs.getInt("id");
    			 	//String userId = rs.getString("userid");
    	            String msg = rs.getString("message");
    	            String visibility = rs.getString("visibility");
    	  ;
    	           
    	            String id = String.valueOf(idint);
    	            // Create  notice object
    	            notice1 n1=new notice1(msg);
    	            n1.setId(idint);
    	            n1.setVisibility(visibility);
    	            
    	   
    	            noticeList.add(n1);
    	        }
        }catch(Exception e) {
    		e.printStackTrace();
    	}
        return noticeList;
		
	}
	
	public static boolean deleteNoticeById(String id) {
		 
		 try {
		        con = DBconnect.getConnection();
		        stmt = con.createStatement();
		        String sql = "Delete from notice where id=" + id;
		   	 		

		        // Execute the update query
		        int rowsAffected = stmt.executeUpdate(sql);

		        // If the number of rows affected is greater than 0, update was successful
		        return rowsAffected > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		        return false; // Return false if an exception occurs
		    } finally {
		        try {
		            if (stmt != null) {
		                stmt.close();
		            }
		            if (con != null) {
		                con.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
	}
	
	public static boolean updateNotice(notice1 n1,String id) {
		 
		 try {
		        con = DBconnect.getConnection();
		        stmt = con.createStatement();
		        String sql = "update notice set message='"+n1.getMessage() +"' where id="+ id;
		   	 		

		        // Execute the update query
		        int rowsAffected = stmt.executeUpdate(sql);

		        // If the number of rows affected is greater than 0, update was successful
		        return rowsAffected > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		        return false; // Return false if an exception occurs
		    } finally {
		        try {
		            if (stmt != null) {
		                stmt.close();
		            }
		            if (con != null) {
		                con.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
	}
	
	
	
}
