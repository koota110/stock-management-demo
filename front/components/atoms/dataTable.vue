<template>
  <v-data-table
    :headers="headers"
    :items="items"
    class="elevation-1"
    :items-per-page="-1"
    fixed-header
    :item-key="idColumn"
    :sort-by="idColumn"
  >
  </v-data-table>
</template>
<script lang="ts">
import Vue, { PropType } from 'vue';
import { TableHeader } from '~/types/tableHeader';

export default Vue.extend({
  props: {
    idColumn: {
      type: String,
      required: false,
      default: 'id',
    },
    headers: {
      type: Array as PropType<TableHeader[]>,
      required: true,
    },
    items: {
      type: Array as PropType<Object[]>,
      required: true,
    },
  },
});
</script>
