<template>
  <div class="min-h-screen flex items-start justify-center mt-20 ">
    <form @submit.prevent="updateUser" class="w-full max-w-lg bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="name">
            Name
          </label>
          <input
              class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white"
              v-model="name"
              type="text"
              id="name"
              placeholder="Name"
              required
          />
          <p class="text-red-500 text-xs italic" v-if="error">{{ error }}</p> <!--Validate Error-->
        </div>
        <div class="w-full md:w-1/2 px-3">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="email">
            Email
          </label>
          <input
              class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
              v-model="email"
              type="email"
              id="email"
              placeholder="Email"
              required
          />
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-2">
        <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">

          <!--Update button-->
          <button
              type="submit"
              class="relative inline-flex items-center justify-center p-0.5 mb-2 me-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-green-400 to-blue-600 group-hover:from-green-400 group-hover:to-blue-600 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-green-200 dark:focus:ring-green-800">
            <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
              Update
            </span>
          </button>

        </div>
        <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">

          <!--Cancel button-->
          <button
              type="button"
              @click="cancel()" class="relative inline-flex items-center justify-center p-0.5 mb-2 me-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-pink-500 to-orange-400 group-hover:from-pink-500 group-hover:to-orange-400 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-pink-200 dark:focus:ring-pink-800">
            <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
              cancel
            </span>
          </button>

        </div>
      </div>
    </form>
  </div>
</template>

<script>
import Swal from "sweetalert2"; // We import alerts

export default {
  name: 'UserUpdateForm',
  data() {
    return {
      name: '',
      email: '',
      error: null,
    }
  },
  async created() {
    const userId = this.$route.params.id;
    await this.fetchUser(userId);
  },
  methods: {
    async fetchUser(id) {
      try {
        const response = await fetch(`http://localhost:3000/users/${id}`); // GEt application back
        if (response.ok) {
          const user = await response.json();
          this.name = user.name;// Add user data
          this.email = user.email;// Add user data
        } else {
          this.error = "User could not load.";
        }
      } catch (error) {
        this.error = error.message;
      }
    },

    async updateUser() {
      const updatedUserData = { name: this.name, email: this.email }; // Take the user's data

      try {
        const userId = this.$route.params.id; // Get the user's id
        const response = await fetch(`http://localhost:3000/users/${userId}`, { // PATCH request back
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ user: updatedUserData })
        });

        if (response.ok) {
          // alert
          await Swal.fire({
            title: "¡Up-to-date!",
            text: "User has been updated.",
            icon: "success"
          });
          this.$router.push({ name: 'list' });
        } else {
          this.error = `Failure to update the user.`;
          await Swal.fire({
            title: "Error!",
            text: this.error,
            icon: "error"
          });
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
    // Update cancellation button
    cancel() {
      // The commented cleans the form without leaving it
      // this.name = '';
      // this.email = '';
      // this.password = '';
      // this.error = null;
      this.$router.push({ name: 'list' }); // Sends us to the user list
    }
  }
}
</script>