package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.Items;

public interface ItemsService {

	List<Items> findAll();

	Items findByID(Integer id);

	void saveOrUpdate(Items items);

	void deleteByID(Integer id);

}
