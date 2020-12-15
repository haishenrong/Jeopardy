package com.bmk;

//webstuff imports
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

//db imports?
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.bmk.ClueJDBCTemplate;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;

@Controller
public class JeopardyController {
	Clue bob;
	Clue billy;
	int target;
	boolean[] oO = new boolean[51];
	int count = 0;
	String[] names = new String[]{"Kevin", "Bryan", "Matthew"};
	boolean[] playButtons = new boolean[] {true, true, true};
	int[] scores = new int[] {0,0,0};
	String disabled = "00000000000000000000";
	String loadClues = "";
	ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
	ClueJDBCTemplate clueJDBCTemplate = (ClueJDBCTemplate) context.getBean("clueJDBCTemplate");
	
	@RequestMapping(value = "/start", method = RequestMethod.GET, params={"!replace", "!main"})
	public ModelAndView clue() {

		return new ModelAndView("clue", "command", new FiveClues());
	}

	@RequestMapping(value = "/addClue", method = RequestMethod.POST)
	public String addClue(@ModelAttribute("SpringWeb") FiveClues clue5, ModelMap model) {

		boolean exists = false;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TEST", "root", "");
			DatabaseMetaData dbm = con.getMetaData();
			// check if "clue" table is there
			ResultSet tables = dbm.getTables(null, null, "clue", null);
			if (tables.next()) {
				// System.out.println("------Records Creation--------");
				//exists = clueJDBCTemplate.create(clue.getCategory(), clue.getPrompt(), clue.getResponse(), clue.getDifficulty(),con);
			} else {

				String s = "CREATE TABLE Clue( " + "ID   INT NOT NULL AUTO_INCREMENT, "+ "CATEGORY VARCHAR(100) NOT NULL, "
						+ "PROMPT VARCHAR(255) NOT NULL, " + "RESPONSE  VARCHAR(100) NOT NULL, "+ "DIFFICULTY  INT NOT NULL, "
						+ "PRIMARY KEY (ID))";

				clueJDBCTemplate.execute(s);

				// System.out.println("------Records Creation--------");
				//exists = clueJDBCTemplate.create(clue.getCategory(), clue.getPrompt(), clue.getResponse(), clue.getDifficulty(), con);
			}
		} catch (SQLException ex1) {
			System.err.println(ex1);
		}
		clueJDBCTemplate.create(clue5.getCategory(), clue5.getPrompt1(), clue5.getResponse1(), 1);
		//System.out.println(clue5.getPrompt2()+" "+clue5.getResponse2());
		clueJDBCTemplate.create(clue5.getCategory(), clue5.getPrompt2(), clue5.getResponse2(), 2);
		clueJDBCTemplate.create(clue5.getCategory(), clue5.getPrompt3(), clue5.getResponse3(), 3);
		clueJDBCTemplate.create(clue5.getCategory(), clue5.getPrompt4(), clue5.getResponse4(), 4);
		clueJDBCTemplate.create(clue5.getCategory(), clue5.getPrompt5(), clue5.getResponse5(), 5);
		String verdict = "";
		if (exists) {
			//bob = clueJDBCTemplate.getClue(clue.getId());
			//bob = clue;
			verdict = "Record of ID Exists in Database: <br>Category = " + bob.getCategory()+ " <br>Prompt = " + bob.getPrompt() + "<br>Response = " + bob.getResponse()
			+ "<br>Difficulty = " + bob.getDifficulty() + "<br>ID = " + bob.getId();
		} else {
			verdict = "Clue was added to the database with the properties below:";
		}
		//billy = clue;
		model.addAttribute("verdict", verdict);
		model.addAttribute("category", clue5.getCategory());
		model.addAttribute("prompt", clue5.getPrompt1());
		model.addAttribute("response",clue5.getResponse1());
		//model.addAttribute("difficulty", clue5.getDifficulty());
		//model.addAttribute("id", clue5.getId());

		return "result";
	}
	
	@RequestMapping(value = "/clue", method = RequestMethod.GET, params={"replace", "!return"})
	public String replaceClue(@ModelAttribute("SpringWeb") Clue clue, ModelMap model) {
		//ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
		//ClueJDBCTemplate clueJDBCTemplate = (ClueJDBCTemplate) context.getBean("clueJDBCTemplate");
		try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TEST", "root", "");
		clueJDBCTemplate.update(billy.getId(), billy.getCategory(), billy.getPrompt(), billy.getResponse(), billy.getDifficulty());
		}catch (SQLException ex1) {
			System.err.println(ex1);
		}
		String verdict = "";
		verdict = "Clue was replaced by the properties below:";
		model.addAttribute("verdict", verdict);
		model.addAttribute("category", billy.getCategory());
		model.addAttribute("prompt", billy.getPrompt());
		model.addAttribute("response", billy.getResponse());
		model.addAttribute("difficulty", billy.getDifficulty());
		model.addAttribute("id", billy.getId());
		return "result";
	}
	@RequestMapping(value = "/clue", method = RequestMethod.GET, params={"main","!replace", "!return"})
	public String cancel() {
		return "redirect:/start";
	}
	@RequestMapping(value = "/addClue", method = RequestMethod.POST, params={"main","!replace", "!return"})
	public String main() {
		return "redirect:/start";
	}
	@RequestMapping(value = "/select", method = RequestMethod.GET, params={"return"})
	public String retMain() {
		oO = new boolean[51];
		count = 0;
		return "redirect:/start";
	}
	@RequestMapping(value = "/start", method = RequestMethod.GET, params={"!replace", "!return"})
	public ModelAndView start() {
		scores = new int[] {0,0,0};
		return new ModelAndView("start");
	}
	
	/*@RequestMapping(value = "/clue", method = RequestMethod.GET, params={"showAll","!replace", "!return"})
	public String showAll(ModelMap model) {
		ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
		ClueJDBCTemplate clueJDBCTemplate = (ClueJDBCTemplate) context.getBean("clueJDBCTemplate");
		List<Clue> allClue = clueJDBCTemplate.listClues();
		String masterList = "";
		for(Clue c : allClue)
		{
			masterList += "ID: "+c.getId()+" Category: "+c.getCategory()+" Prompt: "+c.getPrompt()+ " Response: "+c.getResponse()+"<br>";
			
		}
		model.addAttribute("masterList", masterList);
		return "allClues";
	}*/
	//show all clues
	@RequestMapping(value = "/start", method = RequestMethod.GET, params={"showAll","!replace", "!return"})
	public ModelAndView showAll() {
		return new ModelAndView("showAll");
	}
	@RequestMapping(value = "/start", method = RequestMethod.GET, params={"randStart","!replace", "!return"})
	public String randStart(Model model) {
		model.addAttribute("oO", oO);
		model.addAttribute("players", names);
		model.addAttribute("scores", scores);
		return "randGame";
	}
	@RequestMapping(value = "/start", method = RequestMethod.GET, params={"loadClues","!replace", "!return"})
	public ModelAndView loadClue(/*@RequestParam("clues") String clue/*, Model m*/) {
		//loadClues = clue;
		//m.addAttribute("message",loadClues);
	    return new ModelAndView("loadClues");
	}
	@RequestMapping(value = "/finishedLoading")
	public String loadClue(@RequestParam("clues") String clue, Model m) {
		Boolean b = clueJDBCTemplate.load(clue);
		if(b)
		{
			m.addAttribute("message","Entered into DB");
		}
		else
		{
			m.addAttribute("message","Failed");
		}
	    return "finishedLoading";
	}
	@RequestMapping(value = "/select", method = RequestMethod.GET, params = "playerSelect")
	public String returnGame(HttpServletRequest request, Model model) {
		String p = request.getParameter("playerSelect");
		//System.out.println("Hello"+p);
		//String val = request.getParameter("clueVal");
		//int value = request.getParameter(clues);
		if(count <25)
		{
			if(!p.contentEquals("return")) {
				for(int i = 0; i<names.length;i++)
				{
					if(names[i].equals(p.substring(0,p.length()-1)))
					{
						scores[i] = scores[i]+200*Integer.parseInt(p.substring(p.length()-1));
					}
				}
			}
			model.addAttribute("players", names);
			model.addAttribute("scores", scores);
			model.addAttribute("oO", oO);
			return "redirect:/start?randStart=Start+a+random+game";
		}
		if(count<50) {
			if(!p.contentEquals("return")) {
				for(int i = 0; i<names.length;i++)
				{
					if(names[i].equals(p.substring(0,p.length()-1)))
					{
						scores[i] = scores[i]+400*Integer.parseInt(p.substring(p.length()-1));
					}
				}
			}
			model.addAttribute("players", names);
			model.addAttribute("scores", scores);
			model.addAttribute("oO", oO);

			//model.addAttribute("clueKey",target);
			return"2-1";
		}
		else
		{
			if(!p.contentEquals("return")) {
				for(int i = 0; i<names.length;i++)
				{
					if(names[i].equals(p.substring(0,p.length()-1)))
					{
						scores[i] = scores[i]+400*Integer.parseInt(p.substring(p.length()-1));
					}
				}
			}
			model.addAttribute("players", names);
			model.addAttribute("scores", scores);
			model.addAttribute("oO", oO);
			return "1-2";
		}
		
	}
	// for all clue selects
	@RequestMapping(value = "selected", method = RequestMethod.GET, params = "clueSelect")
	public String oneOne(HttpServletRequest request, Model model) {
		target = Integer.parseInt(request.getParameter("clueSelect"));
		//disabled = disabled.substring(0,target)+'1'+disabled.substring(target+1);
		//model.addAttribute("disabled",disabled);
		//model.addAttribute("1",oO);
		model.addAttribute("players", names);
		model.addAttribute("scores", scores);
		count++;
		oO[target]=true;
		model.addAttribute("clueKey",target);
		playButtons = new boolean[] {true, true, true};
		model.addAttribute("playButtons", playButtons);
		return "1-1";
	}
	@RequestMapping(value = "/select", method = RequestMethod.GET, params = "playerWrong")
	public String stayClue(HttpServletRequest request, Model model) {
		String p = request.getParameter("playerWrong");
		model.addAttribute("clueKey",target);
		
		//System.out.println("Hello"+p);
		//String val = request.getParameter("clueVal");
		//int value = request.getParameter(clues);
		if(count <25)
		{
			if(!p.contentEquals("return")) {
				for(int i = 0; i<names.length;i++)
				{
					if(names[i].equals(p.substring(0,p.length()-1))&&playButtons[i]==true)
					{
						playButtons[i]=false;
						scores[i] = scores[i]-200*Integer.parseInt(p.substring(p.length()-1));
					}
				}
			}
			model.addAttribute("players", names);
			model.addAttribute("scores", scores);
			model.addAttribute("oO", oO);
			model.addAttribute("playButtons", playButtons);
			return "1-1";
		}
		else{
			if(!p.contentEquals("return")) {
				for(int i = 0; i<names.length;i++)
				{
					if(names[i].equals(p.substring(0,p.length()-1))&&playButtons[i]==true)
					{
						playButtons[i]=false;
						scores[i] = scores[i]-400*Integer.parseInt(p.substring(p.length()-1));
					}
				}
			}
			model.addAttribute("players", names);
			model.addAttribute("scores", scores);
			model.addAttribute("oO", oO);
			model.addAttribute("playButtons", playButtons);
			//model.addAttribute("clueKey",target);
			return"1-1";
		}
	}
	//Results after Final Jeopardy
	@RequestMapping(value = "select", method = RequestMethod.GET, params = "playerLock")
	public String endGame(HttpServletRequest request, Model model) {
		//String[] correct=request.getParameterValues("correct");;
		String correct;
		String[] wagers= request.getParameterValues("wager");
		for(int i = 0;i<names.length;i++)
		{
			correct = request.getParameter(names[i]+"correct");
			//System.out.println(correct[i]);
			if(correct==null)
				scores[i]=scores[i]-Integer.parseInt(wagers[i]);
			else
				scores[i]=scores[i]+Integer.parseInt(wagers[i]);
		}
		model.addAttribute("players", names);
		model.addAttribute("scores", scores);
	return "results";
	}
	


}