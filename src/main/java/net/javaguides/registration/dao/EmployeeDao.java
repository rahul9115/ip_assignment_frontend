package net.javaguides.registration.dao;
import net.javaguides.registration.model.Employee;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class EmployeeDao {
	public int registerEmployee() throws ClassNotFoundException {
        /**
		String INSERT_USERS_SQL = "INSERT INTO employees" +
            "  (id, first_name, last_name, username, password, address, contact) VALUES " +
            " (?, ?, ?, ?, ?,?,?);";
		**/
		String SELECT_USERS_SQL="Select * from employee";
        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try {
        	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip_assignment?useSSL=false", "root", "rahul9115");
        	Statement s = connection.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM employee");

            // or alternatively, if you don't know ahead of time that
            // the query will be a SELECT...

            while (rs.next()) {
                // Retrieve by column name
                System.out.print("ID: " + rs.getString("emailID"));
                System.out.print(", firstname: " + rs.getString("firstName"));
                System.out.print(", lastname: " + rs.getString("lastName"));
                System.out.println(", DOB: " + rs.getString("dateOfBirth"));
             }
             rs.close();
            // Step 2:Create a statement using connection object
        		//PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_SQL)) {
            /**
        	preparedStatement.setInt(1, 1);
            preparedStatement.setString(2, employee.getFirst_name());
            preparedStatement.setString(3, employee.getLast_name());
            preparedStatement.setString(4, employee.getUsername());
            preparedStatement.setString(5, employee.getPassword());
            preparedStatement.setString(6, employee.getAddress());
            preparedStatement.setString(7, employee.getContact());
			**/
            //System.out.println("output"+preparedStatement);
            // Step 3: Execute the query or update query
            //result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
