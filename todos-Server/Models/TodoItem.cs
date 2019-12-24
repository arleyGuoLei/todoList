using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using MySql.Data.MySqlClient;

namespace todos_Server.Models {
  public class TodoItem {
    static string ITEM_ID = "id";
    static string TITLE = "title";
    static string IS_COMPLETE = "isComplete";
    static string CREATE_TIME = "createTime";
    static string OVER_TIME = "overTime";
    static string EXPECT_TIME = "expectTime";

    int id;
    string title;
    string isComplete;
    DateTime? createTime;
    DateTime? overTime;
    DateTime? expectTime;

    public int Id {
      get => id;
      set => id = value;
    }

    public string Title {
      get => title;
      set => title = value;
    }

    public Boolean IsComplete {
      get { return isComplete == "true" ? true : false; }
      set { if (value == true) { isComplete = "true"; } else { isComplete = "false"; } }
    }

    public DateTime? CreateTime {
      get => createTime;
      set => createTime = value;
    }

    public DateTime? OverTime {
      get => overTime;
      set => overTime = value;
    }

    public DateTime? ExpectTime {
      get => expectTime;
      set => expectTime = value;
    }

    public static List<TodoItem> getAll (int page, int size = 20) {
      List<TodoItem> todoItems = new List<TodoItem> ();
      DBConnection db = DBConnection.Instance ();
      if (db.IsConnect ()) {
        try {
          Console.WriteLine ("Connecting to MySQL...");
          string sql = "SELECT * FROM todoList.items ORDER BY id DESC LIMIT " + (page - 1) * size + "," + size;
          Console.WriteLine ("sql is => " + sql);
          MySqlCommand cmd = new MySqlCommand (sql, db.Connection);
          MySqlDataReader rdr = cmd.ExecuteReader ();

          while (rdr.Read ()) {
            Console.WriteLine (rdr[0] + " - " + rdr[1]);
            TodoItem item = new TodoItem ();
            item.id = (int) rdr[ITEM_ID];
            item.title = (string) rdr[TITLE];
            item.isComplete = (string) rdr[IS_COMPLETE];
            item.createTime = (DateTime) rdr[CREATE_TIME];
            if (Convert.IsDBNull (rdr[OVER_TIME])) {
              item.overTime = null;
            } else {
              item.overTime = (DateTime) rdr[OVER_TIME];
            }
            if (Convert.IsDBNull (rdr[EXPECT_TIME])) {
              item.expectTime = null;
            } else {
              item.expectTime = (DateTime) rdr[EXPECT_TIME];
            }
            todoItems.Add (item);
          }
          rdr.Close ();

        } catch (Exception ex) {
          Console.WriteLine (ex.ToString ());
        }
      }
      return todoItems;
    }

    public static long getSumPage() {
      DBConnection db = DBConnection.Instance ();
      long sum = 0;
      if (db.IsConnect ()) {
        try {
          Console.WriteLine ("Connecting to MySQL...");
          string sql = "SELECT COUNT(*) AS nums FROM todoList.items";
          Console.WriteLine ("sql is => " + sql);
          MySqlCommand cmd = new MySqlCommand (sql, db.Connection);
          sum = (long)cmd.ExecuteScalar(); 
          db.Close();
        } catch (Exception ex) {
          Console.WriteLine (ex.ToString ());
          return sum;
        }
      }
      return sum;
    }

    public static string insertItem (string title, DateTime expectTime) {
      DBConnection db = DBConnection.Instance ();
      if (db.IsConnect ()) {
        try {
          Console.WriteLine ("Connecting to MySQL...");
          string sql = "INSERT INTO todoList.items (title,expectTime,createTime) VALUES (\"" +
            title + "\",\"" +
            expectTime.ToString ("yyyy-MM-dd HH:mm:ss") + "\",\"" +
            DateTime.Now.ToString ("yyyy-MM-dd HH:mm:ss") + "\")";
          Console.WriteLine ("sql is => " + sql);
          MySqlCommand cmd = new MySqlCommand (sql, db.Connection);
          MySqlDataReader rdr = cmd.ExecuteReader ();
          rdr.Close ();
        } catch (Exception ex) {
          Console.WriteLine (ex.ToString ());
          return "{\"state\": -1, \"err\": \"" + ex.Message.ToString () + "\"}";
        }
      }
      return "{\"state\":0}";
    }

    public static string overItem (int id) {
      DBConnection db = DBConnection.Instance ();
      if (db.IsConnect ()) {
        try {
          Console.WriteLine ("Connecting to MySQL...");
          string sql = "UPDATE todoList.items SET isComplete=\"true\", overTime=\""
            + DateTime.Now.ToString ("yyyy-MM-dd HH:mm:ss") + "\""
            + "WHERE id=" + id;
          Console.WriteLine ("sql is => " + sql);
          MySqlCommand cmd = new MySqlCommand (sql, db.Connection);
          MySqlDataReader rdr = cmd.ExecuteReader ();
          rdr.Close ();
        } catch (Exception ex) {
          Console.WriteLine (ex.ToString ());
          return "{\"state\": -1, \"err\": \"" + ex.Message.ToString () + "\"}";
        }
      }
      return "{\"state\":0}";
    }

    public static string deleteItem (int id) {
      DBConnection db = DBConnection.Instance ();
      if (db.IsConnect ()) {
        try {
          Console.WriteLine ("Connecting to MySQL...");
          string sql = "DELETE FROM todoList.items WHERE id=" + id;
          Console.WriteLine ("sql is => " + sql);
          MySqlCommand cmd = new MySqlCommand (sql, db.Connection);
          MySqlDataReader rdr = cmd.ExecuteReader ();
          rdr.Close ();
        } catch (Exception ex) {
          Console.WriteLine (ex.ToString ());
          return "{\"state\": -1, \"err\": \"" + ex.Message.ToString () + "\"}";
        }
      }
      return "{\"state\":0}";
    }

  }
}