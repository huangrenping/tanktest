package web.game.util;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
 
import org.junit.Test;
 
import junit.framework.TestCase;

public class InitDataTest extends TestCase {
      private String url = "jdbc:mysql://121.40.182.51:3306/gamea?useUnicode=true&amp;characterEncoding=utf-8";
      private String driver = "com.mysql.jdbc.Driver"; 
      private String userName = "sgage";
      private String password = "youxiqun123";
      String filePathIn = "D://webgame.sql";
  
      @Test
      public void test() {
          
          try {
              execute(filePathIn);
          } catch (Exception e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          }
      }
      
      /*
       * 读取sql文件,获取sql语句
       * 返回所有sql语句的list集合
       * */
      private List<String> loadSql(String sqlFile) throws Exception {
          List<String> sqlList = new ArrayList<String>();
          /*
           * 读取文件的内容并写道StringBuffer中去
           * */
          InputStream sqlFileIn = new FileInputStream(sqlFile);
          StringBuffer sqlSb = new StringBuffer();
          byte[] buff = new byte[sqlFileIn.available()];
          int byteRead = 0;
          while((byteRead = sqlFileIn.read(buff)) != -1) {
              sqlSb.append(new String(buff, 0, byteRead));
          }
          /*
           * windows下换行是/r/n，Linux下是/n，
           * 此处需要根据导出的sql文件进行具体的处理，我在处理的时候
           * 也遇到了很多的问题，如果我这个不行可以在网上找找别的解析方法
           * */
          String sqlArr[] = sqlSb.toString().split("(;\\s*\\rr\\n)|(;\\s*\\n)");
          for(int i = 0; i<sqlArr.length; i++) {
              String sql = sqlArr[i].replaceAll("--.*", "").trim();
              if(!"".equals(sql)) {
                  sqlList.add(sql);
              }
          }
          return sqlList;
          
      }
      
      /*
       * 传入文件执行sql语句
       * 
       * */
      private void execute(String sqlFile) throws SQLException {
          Statement stmt = null;
          List<String> sqlList = new ArrayList<String>();
          Connection conn = getConnection();
          try {
              sqlList = loadSql(sqlFile);
              conn.setAutoCommit(false);
              stmt = conn.createStatement();
              for (String sql : sqlList) {
                  //System.out.println(sql);
                  stmt.addBatch(sql);
              }
              int[] rows = stmt.executeBatch();
              //System.out.println("Row count:" + Arrays.toString(rows));
              conn.commit();
              //System.out.println("数据更新成功");
          } catch (Exception e) {
              e.printStackTrace();
              conn.rollback();
          }finally{
              stmt.close();
              conn.close();
          }
          
      }
      
      /*
      * 获取sql连接
      * */
     private Connection getConnection(){
         Connection conn = null;
         try {
             Class.forName(driver);
             conn = DriverManager.getConnection(url, userName, password);
             if(!conn.isClosed()) {
                 //System.out.println("数据库连接成功!");
             }
         } catch (Exception e) {
             e.printStackTrace();
         }
         return conn;
     }
 }
 
