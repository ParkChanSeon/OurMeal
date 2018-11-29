package com.all.model;

import java.util.*;

public class ArticlePage {
	
	private int total;
	private int currentPage;
	private List<FreeArticle> content;
	private int totalPage;
	private int startPage;
	private int endPage;
	
	public ArticlePage() {}
	
	public ArticlePage(int total, int currentPage, int size, List<FreeArticle> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		if(total == 0) {
			totalPage = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPage = total / size;
			if(total % size > 0) {
				totalPage++;
			}
			int modval = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if(modval == 0) startPage -= 5;
			
			endPage = startPage + 4;
			if(endPage > totalPage) endPage = totalPage;
		}
	}
	
	public int getTotal() {
		return total;
	}
	
	public boolean hasNoArticle() {
		return total == 0;
	}
	
	public boolean hasArticle() {
		return total > 0;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	
	public List<FreeArticle> getContent() {
		return content;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}

}
