package com.bmk;

import java.util.*;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;

public class ClueJDBCTemplate implements ClueDAO {
	private DataSource dataSource;
	private SimpleJdbcCall jdbcCall;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("getRecord");
	}
/*
	public boolean create(Integer id, String category, String prompt, String response, Integer difficulty, Connection con) {
		boolean exists = false;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM clue WHERE id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			int n = 0;
			if (rs.next()) {
				n = rs.getInt(1);
			}
			if (n == 0) {
				JdbcTemplate jdbcTemplateObject = new JdbcTemplate(dataSource);
				String SQL = "insert into clue (id, category, prompt, response, difficulty) values (?, ?, ?, ?, ?)";

				jdbcTemplateObject.update(SQL, id, category, prompt, response, difficulty);
				//System.out.println("Created Record prompt = " + prompt + " response = " + response);
				return exists;
			}
			else
			{
				exists = true;
				return exists;
				//System.out.println("Record of prompt Exists: " + prompt + ". Try adding initials of last names. Or Bryan with an \"i\".");
			}
		} catch (

		SQLException ex1) {
			System.err.println(ex1);
		}
		return exists;
	}
*/
	public boolean create(String category, String prompt, String response, Integer difficulty)
	{
		String SQL = "insert into clue (category, prompt, response, difficulty) values (?, ?, ?, ?)";
		JdbcTemplate jdbcTemplateObject = new JdbcTemplate(dataSource);
		jdbcTemplateObject.update(SQL, category, prompt, response, difficulty);
		return false;
	}
	public Clue getClue(Integer id) {

		SqlParameterSource in = new MapSqlParameterSource().addValue("in_id", id);
		Map<String, Object> out = jdbcCall.execute(in);

		Clue clue = new Clue();
		clue.setId(id);
		clue.setCategory((String) out.get("out_category"));
		clue.setPrompt((String) out.get("out_prompt"));
		clue.setResponse((String) out.get("out_response"));
		clue.setDifficulty((Integer) out.get("out_difficulty"));
		return clue;
	}

	public List<Clue> listClues() {
		JdbcTemplate jdbcTemplateObject = new JdbcTemplate(dataSource);
		String SQL = "select * from Clue";
		List<Clue> clues = jdbcTemplateObject.query(SQL, new ClueMapper());
		return clues;
	}

	public void execute(String s) {
		JdbcTemplate jdbcTemplateObject = new JdbcTemplate(dataSource);
		jdbcTemplateObject.execute(s);
	}

	public boolean tableExist(Connection conn, String tableName) throws SQLException {
		boolean tExists = false;
		try (ResultSet rs = conn.getMetaData().getTables(null, null, tableName, null)) {
			while (rs.next()) {
				String tName = rs.getString("TABLE_NAME");
				if (tName != null && tName.equals(tableName)) {
					tExists = true;
					break;
				}
			}
		}
		return tExists;
	}
	
	public void update(Integer cId, String category, String prompt, String response, Integer difficulty) {
		JdbcTemplate jdbcTemplateObject = new JdbcTemplate(dataSource);
		String SQL = "Update clue SET Category = ?, Prompt = ?, Response = ?, Difficulty = ?  WHERE id = ?";
		
		jdbcTemplateObject.update(SQL,cId, category, prompt, response,difficulty);
		return;
	}

	public boolean load(String ls)
	{
		int curPos = 0;
		int nextPos = 0;
		String category="";
		String prompt="";
		String response="";
		Integer difficulty=0;
		char test = '~';
		JdbcTemplate jdbcTemplateObject = new JdbcTemplate(dataSource);
		while(curPos<ls.length())
		{
			//cat searching
			while(nextPos<ls.length()&&!(ls.charAt(nextPos)== test))
			{
				nextPos++;
			}
			if(nextPos >= ls.length())
				return false;
			category = ls.substring(curPos, nextPos);
			nextPos++;
			curPos = nextPos;
			//prompt searching
			while(nextPos<ls.length()&&!(ls.charAt(nextPos)!= '~'))
			{
				nextPos++;
			}
			if(nextPos >= ls.length())
				return false;
			prompt = ls.substring(curPos, nextPos);
			nextPos++;
			curPos = nextPos;
			//response searching
			while(nextPos<ls.length()&&(ls.charAt(nextPos)== '~'))
			{
				nextPos++;
			}
			if(nextPos >= ls.length())
				return false;
			response = ls.substring(curPos, nextPos);
			nextPos++;
			curPos = nextPos;
			// Difficulty searching
			while(nextPos<ls.length()&&!(ls.charAt(nextPos)== '~'))
			{
				nextPos++;
			}
			if(nextPos >= ls.length())
				return false;
			System.out.println(curPos+" "+nextPos+ " "+ls.substring(curPos, nextPos));
			difficulty = Integer.valueOf(ls.substring(curPos, nextPos));
			nextPos++;
			curPos = nextPos;
			
			String SQL = "insert into clue (category, prompt, response, difficulty) values (?, ?, ?, ?)";
			jdbcTemplateObject.update(SQL, category, prompt, response, difficulty);
		}
		

		
		return true;
	}
}
