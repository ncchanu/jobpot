package index;

import java.io.Serializable;

public class bean_index implements Serializable{
    
    private String type_s;
    private String title_s;
    private String company_s;
    
    public String getType_s() {
        return type_s;
    }

    public void setType_s(String type_s) {
        this.type_s = type_s;
    }

    public String getTitle_s() {
        return title_s;
    }

    public void setTitle_s(String title_s) {
        this.title_s = title_s;
    }

    public String getCompany_s() {
        return company_s;
    }

    public void setCompany_s(String company_s) {
        this.company_s = company_s;
    }

}