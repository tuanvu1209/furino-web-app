import { createTheme } from '@mui/material';

export const theme = createTheme({
  typography: {
    fontFamily: 'Assistant, sans-serif',
  },
  components: {
    MuiButton: {
      styleOverrides: {
        root: {
          fontSize: '16px',
          fontWeight: 400,
          padding: '16px',
          textTransform: 'capitalize',
        },
        outlined: {
          border: '1px solid black',
          color: 'black',
          '&:hover': {
            color: 'white',
            backgroundColor: 'black',
            borderColor: 'black',
          },
        },
      },
    },
  },
  palette: {
    primary: {
      main: '#000',
    },
  },
});
