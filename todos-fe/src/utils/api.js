import request from './request'

export function getList(page, size) {
  return request({
    url: '/getList',
    method: 'get',
    params: {
      page,
      size
    }
  })
}

export function deleteItem(id) {
  return request({
    url: '/delete',
    method: 'delete',
    data: {
      id
    }
  })
}

export function overItem(id) {
  return request({
    url: '/over',
    method: 'PUT',
    data: {
      id
    }
  })
}
