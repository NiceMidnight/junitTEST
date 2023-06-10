package com.gip.mapper;

import com.gip.pojo.Dict;

import java.util.List;

/**
 * @FileName DictMapper
 * @Description
 * @Author Tiamo_Null
 * @date 2023-06-01
 **/
public interface DictMapper {
    List<Dict> findAllProductDict();
    //List<Dict> findAllProductDictByIf(Dict dict);
    List<Dict> findAllEmployeeDict();
}
