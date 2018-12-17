package com.all.model;

import org.springframework.stereotype.Repository;

@Repository
public class StoreReviewCount {

	private String store_code;
	private String store_count;

	public StoreReviewCount() {
	}

	public StoreReviewCount(String store_code, String store_count) {
		super();
		this.store_code = store_code;
		this.store_count = store_count;
	}

	public String getStore_code() {
		return store_code;
	}

	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}

	public String getStore_count() {
		return store_count;
	}

	public void setStore_count(String store_count) {
		this.store_count = store_count;
	}
}
