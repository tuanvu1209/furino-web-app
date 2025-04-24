import { ThemeProvider } from '@emotion/react';
import React from 'react';
import ReactDOM from 'react-dom/client';
import { Toaster } from 'react-hot-toast';
import { Provider } from 'react-redux';
import { BrowserRouter } from 'react-router-dom';
import Routers from './Routers/Routers.tsx';
import './index.css';
import { store } from './store/root/config.store.ts';
import { theme } from './utils/hooks/theme.tsx';
import { ConfirmProvider } from './common/ConfirmContext/ConfirmContext.tsx';

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <Provider store={store}>
      <ThemeProvider theme={theme}>
        <BrowserRouter>
          <ConfirmProvider>
            <Toaster />
            <Routers />
          </ConfirmProvider>
        </BrowserRouter>
      </ThemeProvider>
    </Provider>
  </React.StrictMode>
);
