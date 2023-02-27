<template>
    <div style="padding: 20px">
        <n-result status="404" title="大！大！啊" description="这么大" size="huge">
            <template #footer>
                <n-button @click="jumpMenuView">查看插件指令合集</n-button>
            </template>
        </n-result>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const router = useRouter();

// 跳转到菜单页面
function jumpMenuView() {
    router.push("menu")
}
</script>

<style scoped></style>