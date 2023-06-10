package com.gip.service;

import com.gip.pojo.OutOrder;

import java.util.List;

public interface OutOrderService {
    List<OutOrder> findAllOutOrder();
    List<OutOrder> findAllOutOrderByIf(OutOrder outOrder);
    int addOutOrder(OutOrder outOrder);

}
