package uit.dao;

import java.util.ArrayList;

import uit.model.Category;

public interface CategoryDAO {
	// load danh sach danh muc cha
	public ArrayList<Category> getListParentCategory();
	
	//load danh sach danh muc con
	public ArrayList<Category> getListSubCategory(String ID_Category);
}
