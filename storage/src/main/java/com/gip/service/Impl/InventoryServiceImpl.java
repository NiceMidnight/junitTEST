package com.gip.service.Impl;

import com.gip.mapper.InOrderMapper;
import com.gip.mapper.InventoryMapper;
import com.gip.pojo.InOrder;
import com.gip.pojo.Inventory;
import com.gip.service.InorderService;
import com.gip.service.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class InventoryServiceImpl implements InventoryService {
    @Autowired
    InventoryMapper inventoryMapper;

    @Override
    public Inventory findInventoryByIf(Inventory inventory) {
        return inventoryMapper.findInventoryByIf(inventory);
    }

    @Override
    public int updateInventory(Inventory inventory) {
        return inventoryMapper.updateInventory(inventory);
    }

    @Override
    public List<Inventory> findAllInventory() {
        return inventoryMapper.findAllInventory();
    }

    @Override
    public List<Inventory> findAllInventoryByIf(Inventory inventory) {
        return inventoryMapper.findAllInventoryByIf(inventory);
    }


}
