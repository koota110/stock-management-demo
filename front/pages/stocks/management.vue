<template>
  <div>
    <data-table id-column="id" :headers="headers" :items="items"></data-table>
  </div>
</template>
<script lang="ts">
import Vue from 'vue'
import dataTable from '~/components/organisms/dataTableWithFilter.vue'
import {Stock} from '~/types/stocks'

export default Vue.extend({
  components:{
    dataTable
  },
  data(){
    return{
      stocks: [] as Stock[],
      headers: [
        {
          value: 'id',
          text: 'ID'
        },
        {
          value: 'name',
          text: '在庫名'
        },
        {
          value: 'amout',
          text: '残量'
        },
        {
          value: 'purchaseDate',
          text: '仕入れ日'
        },
        {
          value: 'expirationDate',
          text: '消費期限'
        },
        {
          value: 'remarks',
          text: '備考'
        },
      ],
      filterHeader:[
        {
          objectType: 2,
          name: '在庫名',
          combos:{
            items: [{id: 1, name:'トマト'},{id: 2, name:'キュウリ'},{id: 3, name:'ベーコン'}],
            keyName: 'id',
            valueName: 'name'
          }
        },
        {
          objectType: 1,
          name: '在庫名',
          combos:{}
        }
      ],
      condition:[
        {
          name: '',
          value: '',
          begin: new Date(),
          end: new Date()
        },
        {
          name: '',
          value: '',
          begin: new Date(),
          end: new Date()
        }
      ]
    };
  }
})
</script>
