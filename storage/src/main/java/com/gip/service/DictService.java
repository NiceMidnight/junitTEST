package com.gip.service;

import com.gip.pojo.Dict;

import java.util.List;

/**
 * @FileName DictService
 * @Description
 * @Author Tiamo_Null
 * @date 2023-06-01
 **/
public interface DictService {
    List<Dict> findAllProductDict();
    //List<Dict> findAllProductDictByIf(Dict dict);
    List<Dict> findAllEmployeeDict();
}
