package web.game.pojo;

import javax.persistence.*;

@Table(name = "wg_main")
public class WgMain {
    @Id
    private Integer id;
    
    private Integer sid;

    private Long time;

    private Integer open;
    
    @Transient
    private boolean dirty;
    
    public boolean isDirty() {
		return dirty;
	}

	public void setDirty(boolean dirty) {
		this.dirty = dirty;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	/**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return time
     */
    public Long getTime() {
        return time;
    }

    /**
     * @param time
     */
    public void setTime(Long time) {
        this.time = time;
    }

    /**
     * @return open
     */
    public Integer getOpen() {
        return open;
    }

    /**
     * @param open
     */
    public void setOpen(Integer open) {
        this.open = open;
    }
}