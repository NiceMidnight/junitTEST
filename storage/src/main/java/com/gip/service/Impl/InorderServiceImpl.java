package com.gip.service.Impl;

import com.gip.mapper.InOrderMapper;
import com.gip.pojo.InOrder;
import com.gip.service.InorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class InorderServiceImpl implements InorderService {
    @Autowired
    InOrderMapper inOrderMapper;
    @Override
    public List<InOrder> findAllInOrder() {
        return inOrderMapper.findAllInOrder();
    }

    @Override
    public List<InOrder> findAllInOrderByIf(InOrder inOrder) {
        return inOrderMapper.findAllInOrderByIf(inOrder);
    }

    @Override
    public int addInOrder(InOrder inOrder) {
        return inOrderMapper.addInOrder(inOrder);
    }

    @Override
    public List<InOrder> findInorderReport(InOrder inOrder) {
        return inOrderMapper.findInorderReport(inOrder);
    }

    @Override
    public int countMonthData() {
        return inOrderMapper.countMonthData();
    }
}
