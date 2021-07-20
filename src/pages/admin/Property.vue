<template>
  <div class="q-pa-md">
    <a href="/admin/addProperty"><q-btn class="q-mb-lg" rounded glossy color="primary">Add Property</q-btn></a>
    <q-table title="Blogs" :data="adminProperty" :columns="columns" row-key="id" class="my-sticky-header-table" :pagination.sync="pagination">
      <template v-slot:header="props">
        <q-tr :props="props">
          <q-th v-for="col in props.cols" :key="col.name" :props="props">{{ col.label }}</q-th>
        </q-tr>
      </template>
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="id" :props="props">{{ props.row.id }}</q-td>
          <q-td key="name" :props="props"><a :href="'/property/'+props.row.url" target="_blank">{{ props.row.name }}</a></q-td>
          <q-td key="status" :props="props">
            <!-- <q-toggle v-model="props.row.status==1 ? true : false" color="primary" @input="changeStatus(props.row.id, props.row.status)"></q-toggle> -->
          </q-td>
          <q-td key="price" :props="props">{{props.row.price}} | {{props.row.discount}}</q-td>
          <q-td key="units" :props="props">{{props.row.units}}</q-td>
          <q-td key="updated_at" :props="props" v-html="refineDate(props.row.updated_at)"></q-td>
          <q-td><a :href="'/admin/updateProperty/'+props.row.id"><q-icon name="edit"/></a></q-td>
        </q-tr>
      </template>
    </q-table>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import { refineDate } from '../../store/functions'

export default {
  data() {
    return {
      name: 'adminProperty',
      refineDate: refineDate,
      pagination: { rowsPerPage: 30 }, 
      columns: [
        { name: 'id', label: 'Sl No.', align: 'left', field: 'Edit', },
        { name: 'name', label: 'Name', align: 'left', field: 'name', sortable: true, },
        { name: 'status', label: 'Status', align: 'left', field: 'status', sortable: true, },
        { name: 'price', label: 'Price | Discount', align: 'left', field: 'price', sortable: true, },
        { name: 'units', label: 'Units', align: 'left', field: 'units', sortable: true, },
        { name: 'updated_at', label: 'Date', align: 'left', field: 'updated_at', sortable: true, },
      ],
    };
  },
  methods: {
    changeStatus(id, status){
      if(status == 0){ var change = 1 }else{ var change = 0}
      const data = {
        id: id,
        status: change,
      };
      this.$store.dispatch('changePropertyStatus', data);
    },
  },
  computed: {
    ...mapGetters(['adminProperty']),
  },
  created() {
    this.$store.dispatch('adminProperty');
  },
};
</script>
