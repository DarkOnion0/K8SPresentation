<template>
  <footer
    v-if="
      $slidev.nav.currentLayout !== 'cover' &&
      $slidev.nav.currentLayout !== 'end'
    "
    class="absolute top-0 right-0 p-2 text-gray-300"
  >
    {{ $slidev.nav.currentPage }}/{{ $slidev.nav.total }}
  </footer>
</template>
