package web.game.pojo;

import javax.persistence.*;

@Table(name = "wg_publicid")
public class WgPublicid {
    @Id
    private Integer id;

    private Integer type;

    private Integer srverid;

    private Long lastid;
    
    @Transient
    private boolean dirty;
    
    
	public boolean isDirty() {
		return dirty;
	}

	public void setDirty(boolean dirty) {
		this.dirty = dirty;
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
    
    public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	/**
     * @return srverid
     */
    public Integer getSrverid() {
        return srverid;
    }

    /**
     * @param srverid
     */
    public void setSrverid(Integer srverid) {
        this.srverid = srverid;
    }

    /**
     * @return lastid
     */
    public Long getLastid() {
        return lastid;
    }

    /**
     * @param lastid
     */
    public void setLastid(Long lastid) {
        this.lastid = lastid;
    }
}