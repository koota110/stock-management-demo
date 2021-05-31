<template>
  <v-row>
    <v-col v-for="(i, header) in headers" :key="header.name">
      <v-text-filed v-if="header.objectType == 1" v-model="items[i].value">
      </v-text-filed>
      <v-select
        v-model="items[i].value"
        :label="header.name"
        :items="header.combo.items"
        item-text="header.combo.valueName"
        item-value="header.combo.keyName"
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
    items: {
      type: Array as PropType<FilterCondition[]>,
      required: true,
    },
  },
});
</script>
