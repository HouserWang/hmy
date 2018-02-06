package cn.itcast.mapper;

import java.util.List;

import cn.itcast.pojo.Model;
import cn.itcast.pojo.Model;

 

public interface ModelMapper {
     public void addModel(Model Model);
     public void updateModel(Model Model);
     public List<Model> showModel();
     public Model checkModel(String modelName);
}
