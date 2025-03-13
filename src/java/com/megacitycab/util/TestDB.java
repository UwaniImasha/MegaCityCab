import com.megacitycab.util.DBConnection;
import java.sql.Connection;

public class TestDB {
    public static void main(String[] args) {
        try {
            Connection con = DBConnection.getConnection();
            if (con != null) {
                System.out.println("Database Connected Successfully!");
            } else {
                System.out.println("Database Connection Failed!");
            }
        } catch (Exception e) {
            e.printStackTrace();  // Print any errors
        }
    }
}
