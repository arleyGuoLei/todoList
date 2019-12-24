<template>
  <el-row :gutter="20" class="insert-box">
    <el-col :span="12">
      <el-input type="text" placeholder="请输入需要新增的待办事项" maxlength="255" show-word-limit></el-input>
    </el-col>
    <el-col :span="6">
      <el-date-picker
        type="datetime"
        placeholder="请选择预计完成时间"
        align="right"
        :picker-options="pickerOptions"
      ></el-date-picker>
    </el-col>
    <el-col :span="6">
      <el-button type="primary">新增事项</el-button>
    </el-col>
  </el-row>
</template>

<script>
export default {
  name: "InsertItem",
  props: {},
  data() {
    return {
      pickerOptions: {
        shortcuts: [
          {
            text: "今天",
            onClick(picker) {
              picker.$emit("pick", new Date());
            }
          },
          {
            text: "昨天",
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24);
              picker.$emit("pick", date);
            }
          },
          {
            text: "一周前",
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit("pick", date);
            }
          }
        ]
      }
    };
  }
};
</script>

<style scoped>
.insert-box {
  height: 100px;
  background-color: red;
}
</style>
