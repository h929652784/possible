package com.qf.manager.dao;

import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.vo.TbItemCustom;
import com.qf.manager.pojo.vo.TbItemQuery;
import org.apache.ibatis.annotations.Param;

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
    long countItems(@Param("query") TbItemQuery query);

    /**
     *
     * @param pageInfo
     * @return
     */
    List<TbItemCustom> listItemsByPage(@Param("pageInfo") PageInfo pageInfo,@Param("query") TbItemQuery query);
}
