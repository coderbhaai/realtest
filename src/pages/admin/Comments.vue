<template>
    <div class="q-pa-md">
        <q-table title="Comments" :data="adminComments" :columns="columns" row-key="id" class="fixedHeader" :pagination.sync="pagination">
            <template v-slot:header="props"><q-tr :props="props" class="xxx"><q-th v-for="col in props.cols" :key="col.name" :props="props">{{ col.label }}</q-th></q-tr></template>
            <template v-slot:body="props">
                <q-tr :props="props">
                    <q-td key="id" :props="props">{{ props.row.id }}</q-td>
                    <q-td key="user" :props="props">{{ props.row.user }}<br/>{{ props.row.email }}</q-td>
                    <q-td><a :href="'/blog/'+props.row.url" target="_blank">{{ props.row.title }}</a></q-td>
                    <q-td key="status" :props="props">
                        <!-- <q-toggle v-model="props.row.status==1 ? true : false" color="primary" @input="changeStatus(props.row.id, props.row.status)"></q-toggle> -->
                    </q-td>
                    <q-td key="updated_at" :props="props" v-html="refineDate(props.row.updated_at)"></q-td>
                    <q-td><q-icon name="edit" @click="updateDialog(props.row)"/></q-td>
                </q-tr>
            </template>
        </q-table>
        <q-dialog v-model="medium" persistent transition-show="scale" transition-hide="scale">
            <q-card style="width: 70vw; max-width: 80vw;">
                <q-card-section class="modalHead"><div class="text-h6">Update Lead</div><q-btn flat label="Close" color="primary" v-close-popup @click="resetData()"/></q-card-section>
                <q-card-section class="q-pt-none">
                    <q-form class="q-gutter-md" @submit="updateSubmit">
                        <div class="row">
                            <div class="col-6 q-pr-lg"><q-input v-model="user" label="User" readonly/></div>
                            <div class="col-6 q-pr-lg"><q-input v-model="email" label="Email" readonly/></div>
                            <div class="col-12 q-pr-lg"><q-input v-model="comment" label="Comment"/></div>
                        </div>
                        <div class="text-center"><q-btn label="Submit" type="submit" color="primary" class="q-mr-lg"/></div>
                    </q-form>
                </q-card-section>
            </q-card>
        </q-dialog>
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
                id : '',
                user : '',
                email : '',
                comment : '',
                status : '',
                medium: false,
                columns: [
                    { name: 'id', label: 'Sl No.', align: 'left', field: 'Edit', },
                    { name: 'user', label: 'User', align: 'left', field: 'user', sortable: true, },
                    { name: 'title', label: 'Blog', align: 'left', field: 'itle', sortable: true, },
                    { name: 'status', label: 'Status', align: 'left', field: 'status', sortable: true, },
                    { name: 'updated_at', label: 'Date', align: 'left', field: 'updated_at', sortable: true, },
                    { name: 'id', label: 'Edit', align: 'left', field: 'id', sortable: true, },
                ],
                pagination: { rowsPerPage: 30 },
            };
        },
        methods: {
            resetData() {
                this.id = '';
                this.user = '';
                this.email = '';
                this.comment = '';
                this.status = '';
                this.medium = false;
            },
            updateDialog(data) {
                this.id = data.id;
                this.user = data.user;
                this.email = data.email;
                this.comment = data.comment;
                this.medium = true;
            },
            updateSubmit(e) {
                e.preventDefault();
                const data = {
                    id: this.id,
                    comment: this.comment
                };
                this.$store.dispatch('updateComment', data);
                this.resetData();
            },
            changeStatus(id, status){
                if(status == 0){ var change = 1 }else{ var change = 0}
                const data = {
                    id: id,
                    status: change,
                };
                this.$store.dispatch('changeCommentStatus', data);
            },
        },
        computed: {
            ...mapGetters(['adminComments']),
        },
        created() {
            this.$store.dispatch('adminComments');
        },
    };
</script>
<style>
</style>
