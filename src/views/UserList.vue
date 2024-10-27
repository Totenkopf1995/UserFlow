<template>
  <div class="min-h-screen flex items-start justify-center">
    <div class="max-w-5xl w-full p-4 bg-white shadow-lg rounded-lg mt-12">
      <h1 class="text-2xl font-bold mb-4">List of Users</h1>
      <!--Finder and export buttons-->
      <div class="flex justify-end mb-4">
        <input v-model="search" type="text" placeholder="To find..." class="border border-gray-300 p-2 rounded-md w-full max-w-xs mr-2"/>

        <button
            @click="exportData('csv')"
            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-md mr-2">
          Export CSV
        </button>

        <button
            @click="exportData('excel')"
            class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-md mr-2">
          Export Excel
        </button>

        <button
            @click="exportData('pdf')"
            class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded-md">
          Export PDF
        </button>

      </div>
      <table class="min-w-full bg-white">
        <thead>
        <tr>
          <th class="py-2">
            Name
          </th>
          <th class="py-2">
            Email
          </th>
          <th class="py-2">
            Actions
          </th>
        </tr>
        </thead>

        <tbody>
        <tr v-for="user in filteredUsers" :key="user.id"> <!--Iterating users with their id-->
          <!--Print name and email-->
          <td class="py-2">{{ user.name }}</td>
          <td class="py-2">{{ user.email }}</td>
          <td class="py-2 space-x-6">

          <!--Buttons to update and remove users from the list-->
            <button
                @click="deleteUser(user.id)"
                class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded-md">
              Erase
            </button>

            <button
                @click="updateUser(user.id)"
                class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-md">
              Update
            </button>

          </td>
        </tr>
        </tbody>

      </table>

      <p v-if="!users.length">Empty List.</p> <!--Check for users-->
      <p v-if="error" class="error">{{ error }}</p>

    </div>
  </div>
</template>

<script>
// Libraries to export documents
import Papa from 'papaparse';
import * as XLSX from 'xlsx';
import jsPDF from 'jspdf';
import 'jspdf-autotable';
import Swal from "sweetalert2"; // Alerts

export default {
  data() {
    return {
      users: [],
      search: '',
      error: null
    }
  },
  computed: {
    // Filter users in the search engine
    filteredUsers() {
      return this.users.filter(user =>
          user.name.toLowerCase().startsWith(this.search.toLowerCase()) || // Convert to lowercase, filter from the first letter
          user.email.toLowerCase().startsWith(this.search.toLowerCase())
      );
    }
  },
  async created() {
    await this.fetchUsers();
  },
  methods: {
    async fetchUsers() {
      try {
        const response = await fetch('http://localhost:3000/users'); // GET request to the back, with await waiting response
        if (response.ok) {
          this.users = await response.json();
        } else {
          this.error = "Failed to fetch users.";
        }
      } catch (error) {
        this.error = error.message;
      }
    },

    async updateUser(id) {
      this.$router.push({ name: 'update', params: { id: id } }); // Update button from the list sends us to the update form
    },

    async deleteUser(id) {
      try {
        // Alert with await waiting user response
        const result = await Swal.fire({
          title: "¿Are you sure?",
          text: "¡You won't be able to reverse this!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "¡Yes, delete it!"
        });

        if (result.isConfirmed) {
          const response = await fetch(`http://localhost:3000/users/${id}`, {method: 'DELETE'}); // DELETE Request With User ID at the Back

          if (response.ok) {
            this.users = this.users.filter(user => user.id !== id); // Filter the user by their ID
            await Swal.fire({ // Alert when deleting the user
              title: "¡Deleted!",
              text: "The user has been deleted.",
              icon: "success"
            });
          } else {
            this.error = `Failed to delete user: ${id}.`;
            await Swal.fire({
              title: "Error!",
              text: this.error,
              icon: "error"
            });
          }
        }
      } catch (error) {
        this.error = error.message;
        await Swal.fire({
          title: "Error!",
          text: this.error,
          icon: "error"
        });
      }
    },

    exportData(format) {
      const exportData = this.users.map(user => ({ // Only name and email will be exported
        name: user.name,
        email: user.email
      }));

      if (format === 'csv') {
        const csv = Papa.unparse(exportData);
        const blob = new Blob([csv], {type: 'text/csv;charset=utf-8;'});
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.setAttribute('download', 'users.csv');
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);

      } else if (format === 'excel') {
        const ws = XLSX.utils.json_to_sheet(exportData);
        const wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, 'Users');
        XLSX.writeFile(wb, 'users.xlsx');

      } else if (format === 'pdf') {
        const doc = new jsPDF();
        doc.autoTable({
          head: [['Name', 'Email']],
          body: exportData.map(user => [user.name, user.email])
        });
        doc.save('users.pdf');
      }
    }
  }
}
</script>