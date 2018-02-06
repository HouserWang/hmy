package cn.itcast.service;

import java.util.List;

import cn.itcast.pojo.Model;
import cn.itcast.pojo.Model;


public interface ModelService {
	 void addModel(Model Model);
     void updateModel(Model Model);
     List<Model> showModel();
	 Model checkModel(String modelName);
}
