import org.sql2o.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;

public abstract class Matter {

  public boolean endangered;
  public int id;
  public String name;
  public String health;
  public String age;


  public String getName() {
    return name;
  }

  public int getId() {
    return id;
  }

}
