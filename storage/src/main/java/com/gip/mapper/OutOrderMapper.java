package com.gip.mapper;

import com.gip.pojo.InOrder;
import com.gip.pojo.OutOrder;

import java.util.List;

public interface OutOrderMapper {
    List<OutOrder> findAllOutOrder();
    List<OutOrder> findAllOutOrderByIf(OutOrder outOrder);
    int addOutOrder(OutOrder outOrder);
}
