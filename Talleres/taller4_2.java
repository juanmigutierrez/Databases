package test_db;

import java.util.Scanner;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class taller4_2 {
	public static void main(String[] args) {
		//Intenta establecer conexi�n
    	System.out.println("Estableciendo conexi�n...");
        try (Connection conexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/taller3", "postgres", "postgres")){
        	System.out.println("Conexion con la base de datos establecida (PostgreSQL)");
        	Statement statement = conexion.createStatement();
        }catch (SQLException e) {
            System.out.println("Conexi�n fallida");
            e.printStackTrace();
        }
	}
}