import { Button } from '@mui/material';
import { motion } from 'framer-motion';
import React from 'react';
import { useNavigate } from 'react-router-dom';
import CheckCircleIcon from '@mui/icons-material/CheckCircle';

const OrderSuccessPage = () => {
  const navigate = useNavigate();

  return (
    <div className="flex flex-col justify-center items-center h-screen bg-white text-center px-4">
      <motion.div
        initial={{ scale: 0 }}
        animate={{ scale: 1 }}
        transition={{ duration: 0.6, type: 'spring' }}
        className="text-green-500 mb-6"
      >
        <CheckCircleIcon style={{ fontSize: 100 }} />
      </motion.div>

      <motion.h1
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.3, duration: 0.5 }}
        className="text-2xl font-semibold mb-2"
      >
        Order Confirmed!
      </motion.h1>

      <motion.p
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.4, duration: 0.5 }}
        className="text-gray-600"
      >
        Thank you for your purchase!
      </motion.p>

      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.6 }}
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

const MemoizedOrderSuccessPage = React.memo(OrderSuccessPage);
export default MemoizedOrderSuccessPage;
