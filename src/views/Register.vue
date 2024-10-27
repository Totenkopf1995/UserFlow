<template>
  <div class="min-h-screen flex items-start justify-center mt-20 ">
    <form @submit.prevent="registerUser" class="w-full max-w-lg bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="name">
            Name
          </label>
          <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white"
                 v-model="name" type="text" id="name" placeholder="Jorge" required>
          <p class="text-red-500 text-xs italic">Please fill in this field.</p>
        </div>
        <div class="w-full md:w-1/2 px-3">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="email">
            Email
          </label>
          <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                 v-model="email" type="email" id="email" placeholder="Jorge@email.com" required>
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full px-3">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="password">
            Password
          </label>
          <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                 v-model="password" type="password" id="password" placeholder="******************" required>
          <p class="text-gray-600 text-xs italic">Make it as long and as crazy as you want</p>
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-2">
        <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
          <div class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-city">

            <button
                type="submit"
                class="relative inline-flex items-center justify-center p-0.5 mb-2 me-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-green-400 to-blue-600 group-hover:from-green-400 group-hover:to-blue-600 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-green-200 dark:focus:ring-green-800">
            <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
            Register
            </span>
            </button>

            <p v-if="error" class="error">{{ error }}</p> <!--Error handling-->
          </div>
        </div>
        <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
          <div class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-zip">

            <button
                type="button"
                @click="cancel()" class="relative inline-flex items-center justify-center p-0.5 mb-2 me-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-pink-500 to-orange-400 group-hover:from-pink-500 group-hover:to-orange-400 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-pink-200 dark:focus:ring-pink-800">
            <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
            Cancel
            </span>
            </button>

            <p v-if="error" class="error">{{ error }}</p> <!--Error handling-->
          </div>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import Swal from "sweetalert2"; // Alerts

export default {
  name: 'UserRegisterForm',
  data() {
    return {
      name: '',
      email: '',
      password: '',
      error: null
    }
  },
  methods: {
    async cancel() { // Cancel button
      // The commented clean the form
      // this.name = '';
      // this.email = '';
      // this.password = '';
      // this.error = null;
      this.$router.push({ name: 'list' }); // Sends us to the list of users
    },
    async registerUser() {
      try {
        const response = await fetch('http://localhost:3000/users', { // POST request to the back
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ // Register name, email, password
            user: {
              name: this.name,
              email: this.email,
              password: this.password,
            }
          })
        });
        if (response.ok) {
          await Swal.fire({ // Log Alert
            position: "top-end",
            icon: "success",
            title: "Successful registration",
            showConfirmButton: false,
            timer: 1500
          });
          this.$router.push({ name: 'list' }); // sends us to the list
        } else {
          await Swal.fire({ // Error alert when registering by duplicate mail
            icon: "error",
            title: "Oops...",
            text: "User registration failed!",
          });
        }
      } catch (error) {
        this.error = error.message;
      }
    }
  }
}
</script>
