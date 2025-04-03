import ButtonLink from '../ButtonLink/ButtonLink';

function LoginRequiredAlert() {
  return (
    <div className='h-[70vh] flex flex-col items-center justify-center text-red-400'>
      <h2 className='text-5xl font-medium text-center p-10'>
        Please log in to use this feature{' '}
      </h2>
      <ButtonLink sx={{background: 'black', fontSize: '30px', borderRadius: '5px'}} link={'/login'}>Login</ButtonLink>
    </div>
  );
}

export default LoginRequiredAlert;
