<template>
  <div>
    <filter :headers="filterItems" :items="condition"></filter>
    <data-table :id-column="idColumn" :headers="headers" :items="items">
    </data-table>
  </div>
</template>

<script lang="ts">
import Vue, { PropType } from 'vue';
import { FilterItem } from '~/types/filterItem';
import { FilterCondition } from '~/types/FilterCondition';
import { TableHeader } from '~/types/tableHeader';
import dataTable from '~/components/atoms/dataTable.vue';
import filter from '~/components/molucues/filter.vue';

export default Vue.extend({
  components: {
    dataTable,
    filter,
  },
  props: {
    idColumn: {
      type: String,
      required: false,
      default: 'id',
    },
    filterItems: {
      type: Array as PropType<FilterItem[]>,
      required: true,
    },
    condition: {
      type: Array as PropType<FilterCondition[]>,
      required: true,
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
