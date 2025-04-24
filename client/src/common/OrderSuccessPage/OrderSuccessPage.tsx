import { Button } from '@mui/material';
import { motion } from 'framer-motion';
import React from 'react';
import { useNavigate } from 'react-router-dom';

// Dán SVG component này vào cùng file hoặc import riêng nếu bạn tách nó ra
const AnimatedCheckmark = () => (
  <svg width="120" height="120" viewBox="0 0 120 120" fill="none">
    <motion.circle
      cx="60"
      cy="60"
      r="55"
      stroke="#2baf2b"
      strokeWidth="10"
      initial={{ pathLength: 0 }}
      animate={{ pathLength: 1 }}
      transition={{ duration: 0.8 }}
    />
    <motion.path
      d="M40 65L55 80L85 50"
      stroke="#2baf2b"
      strokeWidth="10"
      strokeLinecap="round"
      strokeLinejoin="round"
      initial={{ pathLength: 0 }}
      animate={{ pathLength: 1 }}
      transition={{ duration: 0.6, delay: 0.8 }}
    />
  </svg>
);

const OrderSuccessPage = () => {
  const navigate = useNavigate();

  return (
    <div className="flex flex-col justify-center items-center h-screen bg-white text-center px-4">
      <div className="mb-6">
        <AnimatedCheckmark />
      </div>

      <motion.h1
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 1, duration: 0.5 }}
        className="text-2xl font-semibold mb-2"
      >
        Order Confirmed!
      </motion.h1>

      <motion.p
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 1.1, duration: 0.5 }}
        className="text-gray-600"
      >
        Thank you for your purchase!
      </motion.p>

      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 1.3 }}
      >
        <Button
          sx={{
            textTransform: 'none',
            color: 'white',
            backgroundColor: '#2baf2b',
            mt: 4,
            px: 4,
            py: 1.5,
            borderRadius: 2,
            fontWeight: 500,
            fontSize: 16,
            '&:hover': {
              backgroundColor: '#259425',
              transform: 'scale(1.03)',
              transition: '0.3s ease',
            },
          }}
          onClick={() => navigate('/shop', { replace: true })}
        >
          Continue Shopping
        </Button>
      </motion.div>
    </div>
  );
};

export default React.memo(OrderSuccessPage);
