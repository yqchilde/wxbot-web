<template>
  <h2 style="text-align: center;">插件指令合集</h2>
  <div style="padding: 20px" v-if="menuData !== null && menuData.length > 0">
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
        <div>
          <n-table :single-line="false">
            <tbody>
              <tr>
                <td class="td1">服务名</td>
                <td>{{ item.name }}</td>
              </tr>
              <tr>
                <td class="td1">默认状态</td>
                <td>{{ item.defStatus }}</td>
              </tr>
              <tr>
                <td class="td1">当前状态</td>
                <td>{{ item.curStatus }}</td>
              </tr>
              <tr>
                <td class="td1">帮助</td>
                <td style="white-space: pre-wrap;">{{ item.describe }}</td>
              </tr>
            </tbody>
          </n-table>
        </div>
      </n-collapse-item>
    </n-collapse>
  </div>
  <div style="padding: 20px" v-else-if="menuData !== null && menuData.length === 0">
    <n-result status="404" title="404 资源不存在" description="生活总归带点荒谬">
    </n-result>
  </div>
</template>
  
<script setup>
import { ref } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const menuData = ref(null);
const router = useRouter();
let origin = window.location.origin;
let wxid = router.currentRoute.value.query.wxid;

// 查询指定wxid菜单
axios.get(origin + '/wxbot/menu?wxid=' + wxid).then((item) => {
  if (item.data.code != 200) {
    menuData.value = [];
    return
  }
  if (item.data.data === null) {
    menuData.value = [];
    return
  }
  const sortedArr = item.data.data.sort((a, b) => a.priority - b.priority);
  menuData.value = sortedArr;
})
</script>
<style scoped>
.td1 {
  width: 25%;
}
</style>