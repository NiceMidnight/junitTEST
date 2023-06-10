package com.gip.mapper;

import com.gip.pojo.Inventory;

import java.util.List;

public interface InventoryMapper {
    //取出库存
    Inventory findInventoryByIf(Inventory inventory);
    //更新库存
    int updateInventory(Inventory inventory);
    //查询全部库存
    List<Inventory> findAllInventory();
    //带条件查询
    List<Inventory> findAllInventoryByIf(Inventory inventory);
}
