package com.qf.manager.web;

import com.qf.common.pojo.dto.ItemResult;
import com.qf.common.pojo.dto.PageInfo;
import com.qf.manager.pojo.vo.TbItemCustom;
import com.qf.manager.pojo.vo.TbItemQuery;
import com.qf.manager.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * User: DHC
 * Date: 2018/10/25
 * Time: 15:28
 * Version:V1.0
 */
@Controller
public class ManagerIndexAction {
    @Autowired
    private ItemService itemService;
    @GetMapping("/{path}")
    public String index1(@PathVariable String path) {
        return path;
    }

    @GetMapping("/pages/{path}")
    public String index2(@PathVariable String path) {
        return "pages/" + path;
    }

    @GetMapping("/pages/{path1}/{path2}")
    public String index3(@PathVariable String path1, @PathVariable String path2) {
        return "pages/" + path1 + "/" + path2;
    }

    @ResponseBody
    @GetMapping("/items")
    public ItemResult<TbItemCustom> listItemsByPage(PageInfo pageInfo,TbItemQuery query){
        return itemService.listItemsByPage(pageInfo,query);
    }

    @ResponseBody
    @PostMapping("/items/batch")
    public int batchItems(@RequestParam("ids[]") List<Long> ids){
        return itemService.batchItems(ids);
    }
}
