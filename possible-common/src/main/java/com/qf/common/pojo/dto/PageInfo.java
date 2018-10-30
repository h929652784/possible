package com.qf.common.pojo.dto;

/**
 * User: DHC
 * Date: 2018/10/29
 * Time: 14:06
 * Version:V1.0
 */
public class PageInfo {
    private int page;
    private int limit;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getOffset() {
        return (page - 1) * limit;
    }

}
