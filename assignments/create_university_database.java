import java.sql.*;
import java.io.*;
import java.util.Scanner;

public class university
{

    /**
     * Method that outputs my name
     */
    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Driver loaded");

        // Connect to a database
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/university" , "root", "password");
        System.out.println("Database connected");
        String choice = "";
        while (choice != "q") {
            System.out.println("QUERY OPTIONS");
            System.out.println("(a) Display the titles of all courses");
            System.out.println("(b) Display the list of all departments");
            System.out.println("(c) Display the section ID, course ID, and course title of all sections");
            System.out.println("(d) Display the course sections offered in Spring 2017");
            System.out.println("(e) Display the names of students and their majors");
            System.out.println("(q) Quit");

            Scanner reader = new Scanner(System.in);
            System.out.println("Type in your choice");
            choice = reader.next();

            if (choice == "a") {
                Statement stmt = connection.createStatement();
                String query = "select title " + "from course ";

                ResultSet rset;
                try {
                    rset = stmt.executeQuery(query);
                } catch (SQLException e) {
                    System.out.println("could not execute query ");
                    while (e != null) {
                        System.out.println("Message  :" + e.getMessage());
                        e = e.getNextException();
                    }
                    stmt.close();
                    return;
                }
                System.out.println("Title of All Courses");
                System.out.println("--------------------------------------------------\n");
                if (rset.next()) {
                    System.out.println(rset.getString(1));
                }
                stmt.close();
            } else if (choice == "b") {
                Statement stmt = connection.createStatement();
                String query = "select dept_name " + "from department ";

                ResultSet rset;
                try {
                    rset = stmt.executeQuery(query);
                } catch (SQLException e) {
                    System.out.println("could not execute query ");
                    while (e != null) {
                        System.out.println("Message  :" + e.getMessage());
                        e = e.getNextException();
                    }
                    stmt.close();
                    return;
                }
                System.out.println("The List of All Departments");
                System.out.println("--------------------------------------------------\n");
                if (rset.next()) {
                    System.out.println(rset.getString(1));
                }
                stmt.close();
            } else if (choice == "c") {
                Statement stmt = connection.createStatement();
                String query = "select section_id, section.course_id, title " + "from section " + " join course on section.course_id = course.course_id " + "group by section_id";
                ResultSet rset;
                try {
                    rset = stmt.executeQuery(query);
                } catch (SQLException e) {
                    System.out.println("could not execute query ");
                    while (e != null) {
                        System.out.println("Message  :" + e.getMessage());
                        e = e.getNextException();
                    }
                    stmt.close();
                    return;
                }
                System.out.println("Section ID     Course ID        Title   ");
                System.out.println("--------------------------------------------------\n");
                if (rset.next()) {
                    System.out.println(rset.getInt(1));
                    System.out.println(rset.getString(1));
                    System.out.println(rset.getString(2));

                }
                stmt.close();
            } else if (choice == "d") {
                Statement stmt = connection.createStatement();
                String query = "select section_id, course_id " + "from section " + " join course on section.course_id = course.course_id " + "where section.term_id = 'SP17'";

                ResultSet rset;
                try {
                    rset = stmt.executeQuery(query);
                } catch (SQLException e) {
                    System.out.println("could not execute query ");
                    while (e != null) {
                        System.out.println("Message  :" + e.getMessage());
                        e = e.getNextException();
                    }
                    stmt.close();
                    return;
                }
                System.out.println("Section ID      Course ID");
                System.out.println("--------------------------------------------------\n");
                if (rset.next()) {
                    System.out.println(rset.getString(1));
                    System.out.println(rset.getString(2));
                }
                stmt.close();
            } else if (choice == "e") {
                Statement stmt = connection.createStatement();
                String query = "select last_name, first_name, major_desc " + "from student " + " join major on student.major_id = major.major_id";

                ResultSet rset;
                try {
                    rset = stmt.executeQuery(query);
                } catch (SQLException e) {
                    System.out.println("could not execute query ");
                    while (e != null) {
                        System.out.println("Message  :" + e.getMessage());
                        e = e.getNextException();
                    }
                    stmt.close();
                    return;
                }
                System.out.println("Last Name      First Name                 Major");
                System.out.println("--------------------------------------------------\n");
                if (rset.next()) {
                    System.out.println(rset.getString(1));
                    System.out.println(rset.getString(2));
                    System.out.println(rset.getString(3));
                }
                stmt.close();
            } else if (choice == "q") {
                System.exit(0);
            }
            reader.close();
        }
        // Close the connection
         connection.close();
    }

}
