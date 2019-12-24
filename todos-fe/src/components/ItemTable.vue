<template>
  <div>
    <el-table ref="filterTable" v-loading="loading" :data="tableData" class="table" border>
      <el-table-column type="index" label="序号" width="50" />
      <el-table-column prop="title" label="事项内容" />
      <el-table-column prop="createTime" width="180" label="创建时间" />
      <el-table-column prop="expectTime" width="180" label="预计完成" />
      <el-table-column prop="overTime" width="180" label="实际完成时间" />
      <el-table-column
        prop="isComplete"
        label="状态"
        width="68"
        :filters="[
          { text: '完成', value: '完成' },
          { text: '待做', value: '待做' }
        ]"
        :filter-method="filterTag"
        filter-placement="bottom-end"
      >
        <template slot-scope="scope">
          <el-tag
            :type="scope.row.isComplete === true ? 'primary' : 'success'"
            disable-transitions
          >
            {{ scope.row.isComplete ? "完成": "待做" }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="144" fixed="right">
        <template slot-scope="scope">
          <el-button size="mini" :disabled="scope.row.isComplete" @click="handleOver(scope.row.id)">
            完成
          </el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.row.id)">
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      class="pagination"
      :current-page.sync="currentPage"
      :page-sizes="[5, 10, 20, 50]"
      :page-size="pageSize"
      layout="sizes, prev, pager, next"
      :total="total"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
    />
  </div>
</template>

<script>
import { deleteItem, overItem, getList } from './../utils/api'
import { MessageBox, Message } from 'element-ui'

export default {
  name: 'ItemTable',
  data() {
    return {
      currentPage: 1,
      pageSize: 10,
      list: [],
      total: 0,
      loading: true
    }
  },
  computed: {
    tableData: function() {
      console.log(this.list)
      return this.list
    }
  },
  mounted() {
    this.getData(this.currentPage, this.pageSize)
  },
  methods: {
    handleSizeChange(val) {
      this.pageSize = val
      this.currentPage = 1
      this.getData(1, val)
    },
    handleCurrentChange(val) {
      this.getData(val, this.pageSize)
    },
    filterTag(value, row) {
      if (value === '完成') {
        return row.isComplete
      } else {
        return !row.isComplete
      }
    },
    handleOver(id) {
      MessageBox.confirm('将完成此事项, 不可撤销, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        overItem(id).then(res => {
          if (res.state === 0) {
            this.getData(this.currentPage, this.pageSize)
            Message({
              type: 'success',
              message: '已完成事项'
            })
          } else {
            console.log(res)
            Message({
              type: 'error',
              message: '服务器错误, 请重试'
            })
          }
        })
      }).catch(() => {
        Message({
          type: 'info',
          message: '取消完成事项'
        })
      })
    },
    handleDelete(id) {
      MessageBox.confirm('此操作将删除待办事项, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteItem(id).then(res => {
          if (res.state === 0) {
            this.getData(this.currentPage, this.pageSize)
            Message({
              type: 'success',
              message: '删除成功!'
            })
          } else {
            console.log(res)
            Message({
              type: 'error',
              message: '服务器错误, 请重试'
            })
          }
        })
      }).catch(() => {
        Message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    getData(page = 1, size = 10) {
      this.loading = true
      getList(page, size).then(data => {
        const { sum = 0, list = [] } = data
        this.list = list
        this.total = sum
      }).finally(res => {
        this.loading = false
      })
    }
  }
}
</script>

<style scoped>
.table {
  width: 80%;
  margin: 0 auto;
}
.pagination{
  width: 80%;
  text-align: center;
  margin: 20px auto 0 auto;
}
</style>
