import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
} from '@mui/material';
import React, { createContext, useContext, useState } from 'react';

type ConfirmOptions = {
  message: string;
};

type ConfirmContextType = {
  confirm: (options: ConfirmOptions) => Promise<boolean>;
};

const ConfirmContext = createContext<ConfirmContextType | null>(null);

// eslint-disable-next-line react-refresh/only-export-components
export const useConfirm = () => {
  const ctx = useContext(ConfirmContext);
  if (!ctx) throw new Error('useConfirm must be used within ConfirmProvider');
  return ctx.confirm;
};

export const ConfirmProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [isOpen, setIsOpen] = useState(false);
  const [message, setMessage] = useState('');
  const [resolvePromise, setResolvePromise] =
    useState<(value: boolean) => void>();

  const confirm = (options: ConfirmOptions) => {
    setMessage(options.message);
    setIsOpen(true);
    return new Promise<boolean>((resolve) => {
      setResolvePromise(() => resolve);
    });
  };

  const handleClose = (result: boolean) => {
    setIsOpen(false);
    resolvePromise?.(result);
  };

  return (
    <ConfirmContext.Provider value={{ confirm }}>
      {children}
      {isOpen && (
        <React.Fragment>
          <Dialog
            open={isOpen}
            onClose={() => handleClose(false)}
            aria-labelledby='alert-dialog-title'
            aria-describedby='alert-dialog-description'
          >
            {/* <DialogTitle id='alert-dialog-title'>{title}</DialogTitle> */}
            <DialogContent>
              <DialogContentText id='alert-dialog-description'>
                {message}
              </DialogContentText>
            </DialogContent>
            <DialogActions>
              <Button onClick={() => handleClose(false)}>Disagree</Button>
              <Button
                variant='contained'
                onClick={() => handleClose(true)}
                autoFocus
              >
                Agree
              </Button>
            </DialogActions>
          </Dialog>
        </React.Fragment>
      )}
    </ConfirmContext.Provider>
  );
};
