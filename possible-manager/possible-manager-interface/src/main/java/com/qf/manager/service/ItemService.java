package com.qf.manager.service;

import com.qf.common.pojo.dto.ItemResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.vo.TbItemCustom;

/**
 * 用于处理商品的业务逻辑层接口
 * User: DHC
 * Date: 2018/10/29
 * Time: 14:27
 * Version:V1.0
 */
public interface ItemService {
    /**
     * 带分页查询的商品查询
     * @param pageInfo
     * @return
     */
    ItemResult<TbItemCustom> listItemsByPage(PageInfo pageInfo);
}
