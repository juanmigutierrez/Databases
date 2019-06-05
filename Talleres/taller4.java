package test_db;

import java.util.Scanner;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class taller4 {
	public static void main(String[] args) {
		//Intenta establecer conexi�n
    	System.out.println("Estableciendo conexi�n...");
        try (Connection conexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/diap2db", "postgres", "postgres")){
        	System.out.println("Conexion con la base de datos establecida (PostgreSQL)");
        	Statement statement = conexion.createStatement();
        	
        	
        // Recibiendo string Usuario
        	Scanner scan= new Scanner(System.in);
        	System.out.println("Input the String:");
        	String unidad=scan.nextLine();
        	System.out.println(unidad);
        	// Punto 1b) al colocar 8888 or 'A'='A';
        	
        // Punto 1a)
        	System.out.println("Consultando la base de datos...");
        	//where id ='"+unidad+"';"
        	//Como se hace para poner mas atributos en escrito ?? PREGUNTA
        	ResultSet resultSet = statement.executeQuery("select nombres,apellidos,estudiante.id,nota "
        			+ "from estcursos join estudiante on estcursos.estid = estudiante.id where id ='"+unidad+"';");
        	System.out.println("Imprimiendo resultados...");
        // Que pasa cuando los atributos son el mismo ejemplo estcursos.id y esutidnate.id PREGUNTA
            System.out.printf("%-30.30s  %-30.30s %-30.30s%n", "Nombre", "Apellidos", "# nota");
            while (resultSet.next()) {
                System.out.printf("%-30.30s  %-30.30s  %-30.30s%n", resultSet.getString("nombres"), resultSet.getString("apellidos"),resultSet.getString("nota"));
            }
        //Punto 1c) PREGUNTAR NO FUNCIONA
            System.out.println("Input the String:");
            unidad=scan.nextLine();
        	System.out.println(unidad);
            PreparedStatement prepStatement = conexion.prepareStatement("select nombres,apellidos,estudiante.id,nota "
            		+ "from estcursos join estudiante on estcursos.estid = estudiante.id where id = ?");
        	prepStatement.setString(1, unidad);
        	resultSet = prepStatement.executeQuery();
        }catch (SQLException e) {
            System.out.println("Conexi�n fallida");
            e.printStackTrace();
        }
	}
}

