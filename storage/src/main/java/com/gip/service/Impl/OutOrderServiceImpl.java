package com.gip.service.Impl;

import com.gip.mapper.OutOrderMapper;
import com.gip.pojo.OutOrder;
import com.gip.service.OutOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class OutOrderServiceImpl implements OutOrderService {
    @Autowired
    OutOrderMapper outOrderMapper;
    @Override
    public List<OutOrder> findAllOutOrder() {
        return outOrderMapper.findAllOutOrder();
    }

    @Override
    public List<OutOrder> findAllOutOrderByIf(OutOrder outOrder) {
        return outOrderMapper.findAllOutOrderByIf(outOrder);
    }

    @Override
    public int addOutOrder(OutOrder outOrder) {
        return outOrderMapper.addOutOrder(outOrder);
    }
}
