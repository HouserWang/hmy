package cn.itcast.service.impl;

import java.util.List;

import cn.itcast.dao.ItemsMapper;
import cn.itcast.domain.Items;
import cn.itcast.service.ItemsService;
 
public class ItemsServiceImpl implements ItemsService {
	
	 
	private ItemsMapper itemsMapper;
	
	public List<Items> findAll() {
		List<Items> list = 	itemsMapper.findAll();
		return list;
	}

	public Items findByID(Integer id) {
		Items items = itemsMapper.selectByPrimaryKey(id);
		return items;
	}

	public void saveOrUpdate(Items items) {
		
		itemsMapper.updateByPrimaryKey(items);
		
	}

	public void deleteByID(Integer id) {
		itemsMapper.deleteByPrimaryKey(id);
	}

}
