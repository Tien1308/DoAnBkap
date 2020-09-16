package uit.model;

public class Category {
	private String ID_Category;
	private String Name_Category;
	private String Parent_Category;

	public Category() {
		super();

	}

	public Category(String iD_Category, String name_Category, String parent_Category) {
		super();
		this.ID_Category = iD_Category;
		this.Name_Category = name_Category;
		this.Parent_Category = parent_Category;
	}

	public String getID_Category() {
		return ID_Category;
	}

	public void setID_Category(String iD_Category) {
		this.ID_Category = iD_Category;
	}

	public String getName_Category() {
		return Name_Category;
	}

	public void setName_Category(String name_Category) {
		this.Name_Category = name_Category;
	}

	public String getParent_Category() {
		return Parent_Category;
	}

	public void setParent_Category(String parent_Category) {
		this.Parent_Category = parent_Category;
	}

}
