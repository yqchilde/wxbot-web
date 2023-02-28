<template>
  <h2 style="text-align: center;">插件指令合集</h2>
  <div style="padding: 20px" v-if="menuData !== null">
    <n-collapse accordion>
      <n-collapse-item v-for="item in menuData" :key="item.name" :name="item.name">
        <template #header>
          <n-text>
            插件别称 👉 [{{ item.alias }}]
          </n-text>
        </template>
        <template #header-extra>
          当前状态：
          <n-text v-if="item.curStatus" type="success">
            开启
          </n-text>
          <n-text v-else type="error">
            关闭
          </n-text>
        </template>
        <n-text type="info">
          <div>插件服务名：{{ item.name }}</div>
          <div>默认开启状态：{{ item.defStatus }}</div>
          <div>当前开启状态：{{ item.curStatus }}</div>
          <div>插件描述：{{ item.describe }}</div>
        </n-text>
      </n-collapse-item>
    </n-collapse>
  </div>
  <div style="padding: 20px" v-else>
    <n-result status="404" title="404 资源不存在" description="生活总归带点荒谬">
    </n-result>
  </div>
</template>
  
<script setup>
import { ref } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'
import { useMessage } from 'naive-ui'

const menuData = ref(null);
const router = useRouter();
const message = useMessage();
let origin = window.location.origin;
let wxid = router.currentRoute.value.query.wxid;

// 查询指定wxid菜单
axios.get(origin + '/wxbot/menu?wxid=' + wxid).then((item) => {
  if (item.data.code != 200) {
    return
  }
  if (item.data.data === null) {
    return
  }
  const sortedArr = item.data.data.sort((a, b) => a.priority - b.priority);
  menuData.value = sortedArr;
})
</script>
<style scoped></style>