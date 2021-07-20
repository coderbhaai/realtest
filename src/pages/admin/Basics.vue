<template>
  <div class="q-pa-md">
    <div v-if="showAddForm"><q-btn @click="hideForm()" class="q-mb-lg" rounded glossy color="accent">Hide Form</q-btn></div>
    <div v-else><q-btn @click="showForm()" class="q-mb-lg" rounded glossy color="primary">Add Basic</q-btn></div>
    <div v-if="showAddForm">
      <q-form class="q-gutter-md q-mb-lg" @submit="addSubmit">
        <div class="row">
          <div class="col-4 q-pr-lg"><q-select emit-value v-model="type" :options="basicOptions" option-value="name" option-label="name" label="Type" :rules="[...rules.required]" @input="typeSelected()"/></div>
          <div class="col-4 q-pr-lg" v-if="this.type"><q-input v-model="name" label="Name" :rules="[...rules.required]"/></div>
          <div class="col-4 q-pr-lg" v-if="this.type=='Category' || this.type=='Tag'"><q-input v-model="tab1" label="URL" :rules="[...rules.required]"/></div>
          <div class="col-4 q-pr-lg" v-if="this.type=='Amenities'"><q-file v-model="pic" label="Upload Icon" :rules="[...rules.required]"/></div>
          <div class="col-4 q-pr-lg" v-if="this.type=='Why'"><q-input v-model="tab1" label="Short line" :rules="[...rules.required]"/></div>
        </div>
        <div><q-btn label="Submit" type="submit" color="primary" class="q-mr-lg" /></div>
      </q-form>
    </div>

    <q-dialog v-model="medium" persistent transition-show="scale" transition-hide="scale">
      <q-card style="width: 70vw; max-width: 80vw;">
        <q-card-section class="modalHead"><div class="text-h6">Update Basic</div><q-btn flat label="Close" color="primary" v-close-popup @click="resetData()"/></q-card-section>
        <q-card-section class="q-pt-none">
          <q-form class="q-gutter-md" @submit="updateSubmit">
            <div class="row">
              <div class="col-4 q-pr-lg"><q-select emit-value v-model="type" :options="basicOptions" option-value="name" option-label="name" label="Type" :rules="[...rules.required]" readonly/></div>
              <div class="col-4 q-pr-lg"><q-input v-model="name" label="Name" :rules="[...rules.required]"/></div>
              <div class="col-4 q-pr-lg" v-if="this.type=='Category' || this.type=='Tag'"><q-input v-model="tab1" label="URL" :rules="[...rules.required]"/></div>
              <div class="col-4 q-pr-lg" v-if="this.type=='Amenities'"><q-file v-model="pic" label="Upload Icon"/></div>
            </div>
            <div class="text-center"><q-btn label="Submit" type="submit" color="primary" class="q-mr-lg" /></div>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

    <q-table title="Basics" :data="adminBasics" :columns="columns" row-key="id" :filter="filter" class="my-sticky-header-table" :pagination.sync="pagination">
      <template v-slot:header="props"><q-tr :props="props"><q-th v-for="col in props.cols" :key="col.name" :props="props">{{ col.label }}</q-th></q-tr></template>
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="id" :props="props">{{ props.row.id }}</q-td>
          <q-td key="type" :props="props">{{ props.row.type }}</q-td>
          <q-td key="name" :props="props">{{ props.row.name }}</q-td>
          <q-td key="tab1" :props="props" v-if="props.row.type==='Amenities'" class="previewImg"><img :src="'/images/amenities/'+props.row.mediaImage"/></q-td>
          <!-- <q-td key="tab1" :props="props" v-else>{{ props.row.tab1 }}</q-td> -->
          <q-td key="tab2" :props="props">{{ props.row.tab2 }}</q-td>
          <q-td key="tab3" :props="props">{{ props.row.tab3 }}</q-td>
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
      type: '',
      name: '',
      tab1: '',
      tab2: '',
      tab3: '',
      mediaId: '',
      mediaImage: '',
      pic:'',
      oldPic: '',
      showAddForm: false,
      medium: false,
      filter: '',
      pagination: { rowsPerPage: 30 },
      columns: [
        { name: 'id', label: 'Sl No.', align: 'left', field: 'Edit', },
        { name: 'type', label: 'Type', align: 'left', field: 'type', sortable: true, },
        { name: 'name', label: 'Name', align: 'left', field: 'name', sortable: true, },
        { name: 'tab1', label: 'Tab 1', align: 'left', field: 'tab1', sortable: true, },
        { name: 'tab2', label: 'Tab2', align: 'left', field: 'tab2', sortable: true, },
        { name: 'tab3', label: 'Tab 3', align: 'left', field: 'tab3', sortable: true, },
        { name: 'updated_at', label: 'Date', align: 'left', field: 'updated_at', sortable: true, },
        { name: 'id', label: 'Edit', align: 'left', field: 'id', sortable: true, },
      ],
    };
  },
  methods: {
    showForm() {
      this.showAddForm = true;
    },
    hideForm() {
      this.showAddForm = false;
    },
    typeSelected() {
      this.name = '';
      this.tab1 = '';
      this.tab2 = '';
      this.tab3 = '';
      this.pic = '';
    },
    addSubmit(e) {
      e.preventDefault();
      const data = new FormData();
      data.append('file', this.pic);
      data.append('type', this.type);
      data.append('name', this.name);
      data.append('tab2', this.tab2);
      data.append('tab3', this.tab3);
      if(this.type=="Category" || this.type=="Tag"){
        data.append('tab1', this.tab1.replace(/ /g,"-").toLowerCase());
      }else{
        data.append('tab1', this.tab1);
      }
      this.$store.dispatch('addBasic', data);
      // this.resetData();
    },
    resetData() {
      this.id = null;
      this.type = null;
      this.name = null;
      this.tab1 = null;
      this.tab2 = null;
      this.tab3 = null;
      this.pic = '';
      this.oldPic = '';
      this.showAddForm = false;
      this.medium = false;
    },
    updateDialog(data) {
      this.id = data.id;
      this.type = data.type;
      this.name = data.name;
      this.tab2 = data.tab2;
      this.tab3 = data.tab3;
      this.medium = true;
      if(data.type=='Amenities'){
        this.oldPic = data.tab1;
        this.mediaId = data.mediaId
        this.mediaImage = data.mediaImage
      }else{
        this.tab1 = data.tab1;
      }
    },
    updateSubmit(e) {
      e.preventDefault();
      const data = new FormData();
      data.append('id', this.id);
      data.append('file', this.pic);
      data.append('oldPic', this.oldPic);
      data.append('type', this.type);
      data.append('name', this.name);
      data.append('tab2', this.tab2);
      data.append('tab3', this.tab3);
      data.append('mediaId', this.mediaId);
      data.append('mediaImage', this.mediaImage);
      if(this.type=="Category" || this.type=="Tag"){
        data.append('tab1', this.tab1.replace(/ /g,"-").toLowerCase());
      }else{
        data.append('tab1', this.tab1);
      }
      // const data = {
      //   id: this.id,
      //   type: this.type,
      //   name: this.name,
      //   tab2: this.tab2,
      //   tab3: this.tab3,
      //   pic: this.pic,
      //   oldPic: this.oldPic
      // };
      // if(this.type=="Category" || this.type=="Tag"){
      //   data.tab1 = this.tab1.replace(/ /g,"-").toLowerCase()
      // }
      // if(this.type != "Amenities" && this.type != "Category" && this.type != "Tag") {
      //   data.tab1 = this.tab1
      // }
      this.$store.dispatch('updateBasic', data);
      this.resetData();
    },
  },
  computed: {
    ...mapGetters(['adminBasics', 'basicOptions']),
  },
  created() {
    this.$store.dispatch('adminBasics');
  },
};
</script>
