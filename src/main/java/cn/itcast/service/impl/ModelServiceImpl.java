package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import cn.itcast.pojo.Model;
import org.springframework.stereotype.Service;

import cn.itcast.mapper.ModelMapper;
import cn.itcast.service.ModelService;
@Service
public class ModelServiceImpl implements ModelService {

	@Resource
	private ModelMapper modelmapper;
	public void addModel(Model Model) {
		modelmapper.addModel(Model);

	}

	 
	public void updateModel(Model Model) {
		// TODO Auto-generated method stub

	}

 
	 


	@Override
	public Model checkModel(String modelName) {
		return modelmapper.checkModel(modelName);
	}


	@Override
	public List<Model> showModel() {
		return modelmapper.showModel();
		 
		
	}

}
