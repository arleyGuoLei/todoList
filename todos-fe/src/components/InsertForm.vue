<template>
  <div style="overflow: hidden;width:80%;margin: 20px auto;">
    <el-button style="float: right;" @click="openForm">
      新增事项
    </el-button>
    <el-dialog title="新增待办事项" :visible.sync="dialogFormVisible" width="584px" top="28vh">
      <el-form :model="form">
        <el-form-item label="事项内容" :label-width="formLabelWidth">
          <el-input v-model="form.title" class="form-input" autocomplete="off" placeholder="请输入需要新增的待办事项" maxlength="255" show-word-limit />
        </el-form-item>
        <el-form-item label="预期完成" :label-width="formLabelWidth">
          <el-date-picker
            v-model="form.expectTime"
            class="form-input"
            type="datetime"
            placeholder="请选择预计完成时间"
            align="right"
            :picker-options="pickerOptions"
          />
        </el-form-item>
        <el-form-item style="text-align: center;margin-bottom: -10px;">
          <el-button type="primary" @click="insertItem">
            创建事项
          </el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import { insertItem } from './../utils/api'
import { Message } from 'element-ui'

export default {
  name: 'InsertForm',
  props: {},
  data() {
    return {
      pickerOptions: {
        shortcuts: [
          {
            text: '今天',
            onClick(picker) {
              picker.$emit('pick', new Date())
            }
          },
          {
            text: '明天',
            onClick(picker) {
              const date = new Date()
              date.setTime(date.getTime() + 3600 * 1000 * 24)
              picker.$emit('pick', date)
            }
          },
          {
            text: '一周后',
            onClick(picker) {
              const date = new Date()
              date.setTime(date.getTime() + 3600 * 1000 * 24 * 7)
              picker.$emit('pick', date)
            }
          }
        ]
      },
      form: {
        title: '',
        expectTime: ''
      },
      dialogFormVisible: false,
      formLabelWidth: '80px'
    }
  },
  methods: {
    openForm() {
      this.dialogFormVisible = true
    },
    insertItem() {
      const { title, expectTime } = this.form
      if (title !== '' && expectTime !== '') {
        insertItem(title, expectTime).then(res => {
          if (res.state === 0) {
            this.form = {
              title: '',
              expectTime: ''
            }
            this.dialogFormVisible = false
            this.$emit('insertSuccess')
            Message({
              type: 'success',
              message: '新增事项成功'
            })
          } else {
            Message({
              type: 'error',
              message: '服务器错误, 请重试'
            })
          }
        })
      } else {
        Message({
          type: 'warning',
          message: '请填写事项内容和预期完成时间'
        })
      }
    }
  }
}
</script>

<style scoped>
.form-input {
  width: 440px !important;
}
</style>
