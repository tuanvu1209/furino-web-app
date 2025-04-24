import { Lock } from 'lucide-react';
import ButtonLink from '../ButtonLink/ButtonLink';

function LoginRequiredAlert() {
  return (
    <div className="h-[70vh] flex flex-col items-center justify-center text-center px-4">
      <Lock className="w-12 h-12 text-gray-500 mb-4" />
      <h2 className="text-2xl font-semibold text-gray-800 mb-2">
        You need to log in to access this feature
      </h2>
      <p className="text-gray-500 mb-6">
        Please sign in to continue using this feature.
      </p>
      <ButtonLink
        sx={{
          background: 'black',
          fontSize: '16px',
          borderRadius: '8px',
          padding: '10px 24px',
          color: 'white',
          transition: 'all 0.3s',
        }}
        link="/login"
      >
        Login
      </ButtonLink>
    </div>
  );
}

export default LoginRequiredAlert;
