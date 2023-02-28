<template>
    <n-layout embedded content-style="padding: 24px;" style="height: 100%;">
        <h2 style="margin-bottom: 10px;">
            👇 👇 👇 长按 👇 👇 👇
        </h2>
        <n-card hoverable style="width: 80%;">
            <img :src="memePicture"/>
        </n-card>
        <div class="save">
            👆 长按图片保存到手机 👆
        </div>
    </n-layout>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter();
const memePicture = ref(router.currentRoute.value.query.img);
</script>

<style scoped>
* {
    margin: 0 auto;
    text-align: center;
}
n-card {
    width: 20%;
}
img {
    display: block;
    width: 100%;
}
.save {
    margin: 0 auto;
    width: 70%;
    margin-top: 20px;
    font-size: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
</style>