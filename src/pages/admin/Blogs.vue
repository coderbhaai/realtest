<template>
  <div class="q-pa-md">
    <a href="/admin/addBlog"><q-btn class="q-mb-lg" rounded glossy color="primary">Add Blog</q-btn></a>
    <q-table title="Blogs" :data="adminBlogs" :columns="columns" row-key="id" class="my-sticky-header-table" :pagination.sync="pagination">
      <template v-slot:header="props">
        <q-tr :props="props">
          <q-th v-for="col in props.cols" :key="col.name" :props="props">{{ col.label }}</q-th>
        </q-tr>
      </template>
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="id" :props="props">{{ props.row.id }}</q-td>
          <q-td key="title" :props="props">{{ props.row.title }}</q-td>
          <q-td key="coverImg" :props="props" class="previewImg"><img :src="'/images/blog/'+ props.row.image"/></q-td>
          <q-td key="url" :props="props">{{ props.row.url }}</q-td>
          <q-td key="updated_at" :props="props" v-html="refineDate(props.row.updated_at)"></q-td>
          <q-td><a :href="'/admin/updateBlog/'+props.row.id"><q-icon name="edit"/></a></q-td>
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
      name: 'adminBlogs',
      refineDate: refineDate,
      pagination: { rowsPerPage: 30 }, 
      columns: [
        { name: 'id', label: 'Sl No.', align: 'left', field: 'Edit', },
        { name: 'title', label: 'Title', align: 'left', field: 'title', sortable: true, },
        { name: 'coverImg', label: 'Cover Image', align: 'left', field: 'coverImg', sortable: true, },
        { name: 'url', label: 'Url', align: 'left', field: 'url', sortable: true, },
        { name: 'updated_at', label: 'Date', align: 'left', field: 'updated_at', sortable: true, },
      ],
    };
  },
  computed: {
    ...mapGetters(['adminBlogs']),
  },
  created() {
    this.$store.dispatch('adminBlogs');
  },
};
</script>
