<template>
  <div>
    <img :src="require(`../assets/images/Home/${currentImage}`)" alt="Image Carousel" />
  </div>
</template>

<script>
export default {
  data() {
    return {
      images: ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg"],
      currentIndex: 0,
      intervalId: null,
      intervalDuration: 3000, // Adjust this value for the time between image changes in milliseconds
    };
  },
  computed: {
    currentImage() {
      return this.images[this.currentIndex];
    },
  },
  mounted() {
    // Start the auto-play interval when the component is mounted
    this.startAutoPlay();
  },
  methods: {
    startAutoPlay() {
      // Set up the auto-play interval
      this.intervalId = setInterval(() => {
        this.nextImage();
      }, this.intervalDuration);
    },
    stopAutoPlay() {
      // Stop the auto-play interval
      clearInterval(this.intervalId);
    },
    nextImage() {
      // Increment the currentIndex to switch to the next image
      this.currentIndex = (this.currentIndex + 1) % this.images.length;
    },
  },
  beforeUnmount() {
    // Stop the auto-play interval when the component is destroyed
    this.stopAutoPlay();
  },
};
</script>

<style scoped>
/* Add any additional styling as needed */
</style>
