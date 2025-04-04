import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: true,         // Cho phép truy cập từ Docker container
    port: 3000,
    strictPort: true,
    watch: {
      usePolling: true, // Quan trọng cho hot reload trong Docker
    }
  }
})
