<template>
  <div>
    <s-filter :headers="filterItems" @filter="setFilter"></s-filter>
    <data-table
      :id-column="idColumn"
      :headers="headers"
      :items="items"
      :custom-filter="customFilter"
      :search="search"
    >
    </data-table>
  </div>
</template>

<script lang="ts">
import Vue, { PropType } from 'vue';
import { FilterItem } from '~/types/filterItem';
import { FilterCondition } from '~/types/filterCondition';
import { TableHeader } from '~/types/tableHeader';
import dataTable from '~/components/atoms/dataTable.vue';
import sFilter from '~/components/molucues/filter.vue';

export default Vue.extend({
  components: {
    dataTable,
    sFilter,
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
    headers: {
      type: Array as PropType<TableHeader[]>,
      required: true,
    },
    items: {
      type: Array as PropType<Object[]>,
      required: true,
    },
  },
  data() {
    return {
      conditions: [] as FilterCondition[],
      search: '',
    };
  },
  methods: {
    setFilter(condition: FilterCondition[]) {
      this.conditions = condition;
      this.search += 'a';
    },
    customFilter(value: any, search: string | null, item: Object) {
      if (!search) return true;
      let isShow = true;
      this.filterItems.forEach((v) => {
        let find = this.conditions.find((w) => v.name === w.name);
        if (!find) {
          return;
        }
        if (!find.value) {
          return;
        }
        console.log(find.value);
        if (v.objectType === 2) {
          if (item[v.key] !== find.value) {
            isShow = false;
            return;
          }
        }
        if (v.objectType === 1) {
          if (
            !item[v.key].toLowerCase().includes(find.value.toLowerCase())
          ) {
            isShow = false;
            return;
          }
        }
      });
      return isShow;
    },
  },
});
</script>
