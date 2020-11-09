package com.bmk;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class ClueMapper implements RowMapper<Clue> {
   public Clue mapRow(ResultSet rs, int rowNum) throws SQLException {
      Clue clue = new Clue();
      clue.setId(rs.getInt("id"));
      clue.setCategory(rs.getString("category"));
      clue.setPrompt(rs.getString("prompt"));
      clue.setResponse(rs.getString("response"));
      clue.setDifficulty(rs.getInt("difficulty"));
      
      return clue;
   }
}