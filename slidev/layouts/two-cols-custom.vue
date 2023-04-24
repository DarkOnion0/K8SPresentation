<!--
  Usage:

```md
---
layout: two-cols
---

# Left

This shows on the left

::right::

# Right

This shows on the right
```

-->

<script setup lang="ts">
const props = defineProps({
  class: {
    type: String,
  },
});
</script>

<template>
  <div
    class="slidev-layout two-columns w-full h-full grid grid-cols-[75%_1fr] gap-x-5"
  >
    <div class="col-left" :class="props.class">
      <slot />
    </div>
    <div
      class="col-right flex flex-col items-center justify-around"
      :class="props.class"
    >
      <slot name="right" />
    </div>
  </div>
</template>
