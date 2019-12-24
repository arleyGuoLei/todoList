<template>
  <div id="app">
    <el-container>
      <el-header>
        待办事项
      </el-header>
      <el-main>
        <insert-form @insertSuccess="insertSuccess" />
        <item-table ref="table" />
      </el-main>
      <el-footer class="footer">
        © 计科B163班 郭磊 20160701433 - ASP.NET 课设
      </el-footer>
    </el-container>
  </div>
</template>

<script>
import InsertForm from './components/InsertForm'
import ItemTable from './components/ItemTable'

export default {
  name: 'App',
  components: {
    ItemTable,
    InsertForm
  },
  data() {
    return {
    }
  },
  mounted() {
  },
  methods: {
    insertSuccess() {
      this.$refs.table.getData()
    }
  }
}
</script>
<style>
.el-header{
  text-align: center;
  font-size: 32px;
  font-weight: 600;
  margin-top: 30px;
  line-height: 60px;
  height: 60px;
}
.footer {
  margin-top: 10px;
  text-align: center;
}
</style>
