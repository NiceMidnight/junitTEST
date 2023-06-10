package com.gip.mapper;

import com.gip.pojo.InOrder;

import java.util.List;
import java.util.Map;

public interface InOrderMapper {
    List<InOrder> findAllInOrder();

    List<InOrder> findAllInOrderByIf(InOrder inOrder);

    int addInOrder(InOrder inOrder);

    //月进货报表使用方法
    List<InOrder> findInorderReport(InOrder inOrder);

    //查询本月的数据数量
    int countMonthData();
}
