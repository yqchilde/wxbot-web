<script setup>
// import {h, onMounted, ref} from 'vue'
</script>

<template>
  <n-loading-bar-provider>
  <n-message-provider>
    <n-notification-provider>
      <n-dialog-provider>
        <router-view></router-view>
      </n-dialog-provider>
    </n-notification-provider>
  </n-message-provider>
</n-loading-bar-provider>
</template>

<style scoped>
/* header {
  line-height: 1.5;
} */

/* .logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
} */
</style>
