package cn.itcast.controller;

import cn.itcast.pojo.Topic;
import com.baomidou.mybatisplus.plugins.Page;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

public class BaseController<T> {
    protected Page<T> newPage(HttpServletRequest request) {
        String current = request.getParameter("current");
        String size = request.getParameter("size");
        return new Page<>(Objects.isNull(current) ? 1 : Integer.parseInt(current), Objects.isNull(size) ? 10 : Integer.parseInt(size));
    }
}
