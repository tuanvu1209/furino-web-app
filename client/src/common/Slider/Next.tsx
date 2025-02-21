import { IoIosArrowForward } from 'react-icons/io';
import { CustomArrowProps } from 'react-slick';

const CustomNextArrow: React.FC<CustomArrowProps> = ({ onClick, style }) => (
  <div
    className='absolute text-[#7A6A6E] z-10 right-0 md:right-5 top-1/2 transform -translate-y-1/2 hover:text-primary cursor-pointer w-[48px] h-[48px] justify-center items-center rounded-full bg-white shadow-sm'
    onClick={onClick}
    style={{ ...style, display: 'flex' }}
  >
    <IoIosArrowForward size={30} />
  </div>
);

export default CustomNextArrow;
