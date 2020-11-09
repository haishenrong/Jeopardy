package com.bmk;

public class Clue {
	private String response;
	private String prompt;
	private String category;
	private Integer id;
	private Integer difficulty;

	public void setResponse(String response) {
		this.response = response;
	}

	public String getResponse() {
		return response;
	}

	public void setPrompt(String prompt) {
		this.prompt = prompt;
	}

	public String getPrompt() {
		return prompt;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategory() {
		return category;
	}
	public void setDifficulty(Integer difficulty) {
		this.difficulty = difficulty;
	}

	public Integer getDifficulty() {
		return difficulty;
	}
}