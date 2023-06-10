package com.gip.service;

import com.gip.pojo.InOrder;
import com.gip.pojo.Inventory;

import java.util.List;

public interface InventoryService {
    //取出库存
    Inventory findInventoryByIf(Inventory inventory);
    //更新库存
    int updateInventory(Inventory inventory);
    //查询全部库存
    List<Inventory> findAllInventory();
    //带条件
    List<Inventory> findAllInventoryByIf(Inventory inventory);

}
