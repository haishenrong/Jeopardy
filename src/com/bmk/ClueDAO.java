package com.bmk;

import java.util.List;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public interface ClueDAO {

   public void setDataSource(DataSource ds);
   

   public boolean create(String category, String prompt, String response, Integer difficulty);
  

   public Clue getClue(Integer id);
   

   public List<Clue> listClues();
   
   public void execute(String s);

   public boolean tableExist(Connection conn, String tableName) throws SQLException;
   
   public void update(Integer cId, String category, String prompt, String response, Integer difficulty);
   
   public boolean load(String ls);
}