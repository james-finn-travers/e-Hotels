package com.project;

import java.sql.*;


public class ConnectionDB {

    /* Database connection settings, change dbName, dbusername, dbpassword */
//    private final String ipAddress = "127.0.0.1";
    private final String dbServerPort = "5432";
    private final String dbName = "postgres";
    private final String dbusername = "postgres";
    private final String dbpassword = "admin";


    private Connection con = null;

    /**
     * Establishes a connection with the database, initializes and returns
     * the Connection object.
     *
     * @return Connection, the Connection object
     * @throws Exception
     */
    public Connection getConnection() throws Exception {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost"
                     + ":" + dbServerPort + "/" + dbName, dbusername, dbpassword);
            return con;
        } catch (Exception e) {

            throw new Exception("Could not establish connection with the Database Server: "
                    + e.getMessage());
        }

    }

    /**
     * Close database connection. It is very important to close the database connection
     * after it is used.
     *
     * @throws SQLException
     */
    public void close() throws SQLException {
        try {
            if (con != null)
                con.close();
        } catch (SQLException e) {
            throw new SQLException("Could not close connection with the Database Server: "
                    + e.getMessage());
        }

    }

    public static void main(String[] args) {
        String sql = "SELECT * FROM Hotel;";

        ConnectionDB con = new ConnectionDB();
        try {
            Connection db = con.getConnection();
            Statement st = db.createStatement();
            st.executeUpdate("SET search_path = 'e-Hotel';");
            ResultSet rs = st.executeQuery(sql);

            ResultSetMetaData rsm = rs.getMetaData();

            int colCount = rsm.getColumnCount();

            while (rs.next()){
                for (int i = 1; i<=colCount; i++){
                    System.out.print(rs.getString(i));
                    System.out.print("\t");
                }
                System.out.println();
            }
            rs.close();
            st.close();
            con.close();

        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

    }
}