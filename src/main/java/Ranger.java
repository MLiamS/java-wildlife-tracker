import org.sql2o.*;
import java.util.ArrayList;
import java.util.List;

public class Ranger extends Matter {

  public Ranger(String name, int id) {
    this.name = name;
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public int getId() {
    return id;
  }

  @Override
  public boolean equals(Object otherRanger) {
    if(!(otherRanger instanceof Ranger)) {
      return false;
    } else {
      Ranger newRanger = (Ranger) otherRanger;
      return this.getName().equals(newRanger.getName());
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO rangers (name) VALUES (:name);";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", this.name)
        .executeUpdate()
        .getKey();
    }
  }
}
