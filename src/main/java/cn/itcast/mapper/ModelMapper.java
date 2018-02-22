package cn.itcast.mapper;

import java.util.List;

import cn.itcast.pojo.Model;
import cn.itcast.pojo.Model;
import com.baomidou.mybatisplus.mapper.BaseMapper;


public interface ModelMapper extends BaseMapper<Model>{
     public void addModel(Model Model);
     public void updateModel(Model Model);
     public List<Model> showModel();
     public Model checkModel(String modelName);
}
