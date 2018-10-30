package com.qf.manager.dao;

import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.vo.TbItemCustom;

import java.util.List;

/**
 * User: DHC
 * Date: 2018/10/29
 * Time: 14:51
 * Version:V1.0
 */
public interface TbItemCustomMapper {
    /**
     *
     * @return
     */
    long countItems();

    /**
     *
     * @param pageInfo
     * @return
     */
    List<TbItemCustom> listItemsByPage(PageInfo pageInfo);
}
