using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json.Linq;
using todos_Server.Models;

namespace todos_Server.Controllers {

  [ApiController]
  [Route ("api")]
  public class todosController : Controller {

    [Route ("getList")]
    [HttpGet]
    public Dictionary<string, Object> Get ([FromQuery] int page, [FromQuery] int size = 20) {
      long sum = TodoItem.getSumPage();
      IEnumerable<TodoItem> items = TodoItem.getAll (page, size);
      Dictionary<string, Object> obj = new Dictionary<string, Object>();
      obj.Add("sum", sum);
      obj.Add("list", items);
      return obj;
    }

    [Route ("insert")]
    [HttpPost]
    public string insertItem ([FromBody] object body) {
      JObject obj = JObject.Parse (Convert.ToString (body));
      string title = (string) obj["title"];
      DateTime expectTime = (DateTime) obj["expectTime"];
      return TodoItem.insertItem (title, expectTime);
    }

    [Route ("over")]
    [HttpPut]
    public string overItem ([FromBody] object body) {
      JObject obj = JObject.Parse (Convert.ToString (body));
      int id = (int) obj["id"];
      Console.WriteLine ("完成事项id:" + id);
      return TodoItem.overItem (id);
    }

    [Route ("delete")]
    [HttpDelete]
    public string deleteItem ([FromBody] object body) {
      JObject obj = JObject.Parse (Convert.ToString (body));
      int id = (int) obj["id"];
      Console.WriteLine ("删除事项id:" + id);
      return TodoItem.deleteItem (id);
    }
  }
}