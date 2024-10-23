package controller.sell;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import dao.sell.SalePageDao;


public class SellWriteController implements Controller {
   private static final Logger log = LoggerFactory.getLogger(SellWriteController.class);
   @Override
   public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      SalePageDao dao = SalePageDao.getInstance();
      
      log.info("::: categorylist-{} from -------------------------------------------------  :::",dao.getCategoriesVal());
      Map<String,String> map = new HashMap<>();
      List<String> list = new ArrayList<>();
      List<String> loc_list = new ArrayList<>();
      
      for(int i =0; i<dao.getCategoriesVal().size(); i++) {
         map.put(dao.getCategoriesCode().get(i).toString(), dao.getCategoriesVal().get(i).toString());
         log.info("::: code-{}  -------------------------------------------------  :::",map.get(dao.getCategoriesCode().get(i).toString()));
         list.add(map.get(dao.getCategoriesCode().get(i).toString()));
      }
      
      loc_list = dao.getLocation();
      log.info("::: loc {}",loc_list);


      request.setAttribute("cate", list);
      request.setAttribute("loc", loc_list);
      
      RequestDispatcher dispatcher = request.getRequestDispatcher("write.jsp");
      dispatcher.forward(request, response);
   }

}
