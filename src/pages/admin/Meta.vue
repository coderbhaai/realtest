<template>
  <div class="q-pa-md">
    <div v-if="showAddForm"><q-btn @click="hideForm()" class="q-mb-lg" rounded glossy color="accent">Hide Form</q-btn></div>
    <div v-else><q-btn @click="showForm()" class="q-mb-lg" rounded glossy color="primary">Add Meta</q-btn></div>
    <div v-if="showAddForm">
      <q-form class="q-gutter-md q-mb-lg" @submit="addSubmit">
        <div class="row">
          <div class="col-6 q-pr-lg"><q-input v-model="url" label="URL" :rules="[...rules.required]"/></div>
          <div class="col-6 q-pr-lg"><q-input v-model="title" label="Title" :rules="[...rules.required]"/></div>
          <div class="col-12 q-pr-lg"><q-input v-model="description" label="Description" :rules="[...rules.required]"/></div>
        </div>
        <div><q-btn label="Submit" type="submit" color="primary" class="q-mr-lg" /></div>
      </q-form>
    </div>
    <q-dialog v-model="medium" persistent transition-show="scale" transition-hide="scale">
      <q-card style="width: 70vw; max-width: 80vw;">
        <q-card-section class="modalHead"><div class="text-h6">Update Video</div><q-btn flat label="Close" color="primary" v-close-popup @click="resetData()"/></q-card-section>
        <q-card-section class="q-pt-none">
          <q-form class="q-gutter-md" @submit="updateSubmit">
            <div class="row">
              <div class="col-6 q-pr-lg"><q-input v-model="url" label="URL" :rules="[...rules.required]"/></div>
              <div class="col-6 q-pr-lg"><q-input v-model="title" label="Title" :rules="[...rules.required]"/></div>
              <div class="col-12 q-pr-lg"><q-input v-model="description" label="Description" :rules="[...rules.required]"/></div>
            </div>
            <div class="text-center"><q-btn label="Submit" type="submit" color="primary" class="q-mr-lg"/></div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
    <q-table title="Meta Tags" :data="adminMetas" :columns="columns" row-key="id" class="my-sticky-header-table" :pagination.sync="pagination">
      <template v-slot:header="props"><q-tr :props="props"><q-th v-for="col in props.cols" :key="col.name" :props="props">{{ col.label }}</q-th></q-tr></template>
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="id" :props="props">{{ props.row.id }}</q-td>
          <q-td key="url" :props="props">{{ props.row.url }}</q-td>
          <q-td key="title" :props="props">{{ props.row.title }}</q-td>
          <q-td key="description" :props="props">{{ props.row.description }}</q-td>
          <q-td key="updated_at" :props="props" v-html="refineDate(props.row.updated_at)"></q-td>
          <q-td>
            <q-icon name="edit" @click="updateDialog(props.row)"/>
            <!-- <img @click="updateDialog(props.row)" src="/images/icons/edit.svg" class="edit"/> -->
            </q-td>
        </q-tr>
      </template>
    </q-table>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import {rules, refineDate} from '../../store/functions'

export default {
  data() {
    return {
      rules : rules,
      refineDate: refineDate,
      id: '',
      url: '',
      title: '',
      description: '',
      showAddForm: false,
      medium: false,
      columns: [
        { name: 'id', label: 'Sl No.', align: 'left', field: 'Edit', },
        { name: 'url', label: 'URL', align: 'left', field: 'url', sortable: true, },
        { name: 'title', label: 'Title', align: 'left', field: 'title', sortable: true, },
        { name: 'description', label: 'Description', align: 'left', field: 'description', sortable: true, },
        { name: 'updated_at', label: 'Date', align: 'left', field: 'updated_at', sortable: true, },
        { name: 'id', label: 'Edit', align: 'left', field: 'id', sortable: true, },
      ],
      pagination: { rowsPerPage: 30 },
    };
  },
  methods: {
    // ...mapActions(['adminMetas']),
    
    showForm() {
      this.showAddForm = true;
    },
    hideForm() {
      this.showAddForm = false;
    },
    addSubmit(e) {
      e.preventDefault();
      const data = {
        url: this.url,
        title: this.title,
        description: this.description,
      };
      this.$store.dispatch('addMeta', data);
      this.resetData();
    },
    resetData() {
      this.id = '';
      this.url = '';
      this.title = '';
      this.description = '';
      this.showAddForm = false;
      this.medium = false;
    },
    updateDialog(data) {
      this.id = data.id;
      this.url = data.url;
      this.title = data.title;
      this.description = data.description;
      this.medium = true;
    },
    updateSubmit(e) {
      e.preventDefault();
      const data = {
        id: this.id,
        url: this.url,
        title: this.title,
        description: this.description
      };
      this.$store.dispatch('updateMeta', data);
      this.resetData();
    },
  },
  computed: {
    ...mapGetters(['adminMetas']),
  },
  created() {
    this.$store.dispatch('adminMetas');
  },
};
</script>
