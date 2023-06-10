package com.gip.service.Impl;

import com.gip.mapper.DictMapper;
import com.gip.pojo.Dict;
import com.gip.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @FileName DictServiceImpl
 * @Description
 * @Author Tiamo_Null
 * @date 2023-06-01
 **/
@Service
@Transactional
public class DictServiceImpl implements DictService {
    @Autowired
    DictMapper dictMapper;
    @Override
    public List<Dict> findAllProductDict(){
        return dictMapper.findAllProductDict();
    }

    @Override
    public List<Dict> findAllEmployeeDict() {
        return dictMapper.findAllEmployeeDict();
    }
//    @Override
//    public List<Dict> findAllProductDictByIf(Dict dict){
//        return dictMapper.findAllProductDictByIf(dict);
//    }
}
