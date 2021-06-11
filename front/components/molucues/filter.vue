<template>
  <v-row>
    <v-col v-for="(header, index) in headers" :key="header.name">
      <v-text-field
        v-if="header.objectType == 1"
        v-model="condition[index].value"
        :placeholder="header.name"
        @input="filter"
      >
      </v-text-field>
      <v-select
        v-else
        v-model="select"
        :label="header.name"
        :items="header.combos.items"
        :item-text="header.combos.valueName"
        :item-value="header.combos.keyName"
        @change="filter(header)"
        return-object
        clearable
      />
    </v-col>
  </v-row>
</template>
<script lang="ts">
import Vue, { PropType } from 'vue';
import { FilterItem } from '~/types/filterItem';
import { FilterCondition } from '~/types/filterCondition';

export default Vue.extend({
  props: {
    headers: {
      type: Array as PropType<FilterItem[]>,
      required: true,
    },
  },
  data() {
    return {
      condition: [] as FilterCondition[],
      select: '',
    };
  },
  created() {
    this.headers.forEach((v) => {
      this.condition.push({
        name: v.name,
      } as FilterCondition);
    });
  },
  methods: {
    filter(header: FilterItem) {
      if (header.objectType === 2) {
        let ref = this.condition.find((v) => v.name === header.name);
        if (!ref) {
          return;
        }
        if (!this.select) {
          ref.value = '';
        } else {
          ref.value = this.select[header.combos.valueName];
        }
      }
      this.$emit('filter', this.condition);
    },
  },
});
</script>
