package com.qf.manager.service.impl;

import com.qf.common.pojo.dto.ItemResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.dao.TbItemCustomMapper;
import com.qf.manager.pojo.po.TbItem;
import com.qf.manager.pojo.vo.TbItemCustom;
import com.qf.manager.service.ItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: DHC
 * Date: 2018/10/29
 * Time: 14:30
 * Version:V1.0
 */
@Service
public class ItemServiceImpl implements ItemService {
    //要使用接口，不需要使用具体实现（log4j logback）
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private TbItemCustomMapper itemCustomDao;

    @Override
    public ItemResult<TbItemCustom> listItemsByPage(PageInfo pageInfo) {
        ItemResult<TbItemCustom> result = new ItemResult<TbItemCustom>();
        //查询成功的情况
        result.setCode(0);
        result.setMsg("success");
        try {
            long count = itemCustomDao.countItems();
            result.setCount(count);
            List<TbItemCustom> data = itemCustomDao.listItemsByPage(pageInfo);
            result.setData(data);
        } catch (Exception e) {
            //查询发生异常时的情况
            result.setCode(1);
            result.setMsg("failed");
            //查询发生异常时将进行日志输出(输出到控制台还是到日志文件,由logback.xml决定)
            logger.error(e.getMessage(), e);
        }
        return result;
    }
}
