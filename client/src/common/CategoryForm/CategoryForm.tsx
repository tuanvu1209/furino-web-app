import { Button, Checkbox, FormControlLabel, FormGroup } from '@mui/material';
import './style.scss';

function CategoryForm({
  data,
  onChange,
  checked,
  productStatus,
  itemRef,
  onReset,
  handleBackDrawer,
}: {
  data: any;
  checked: any;
  onChange: any;
  itemRef: any;
  productStatus: any;
  onReset: any;
  handleBackDrawer?: any;
}) {
  return (
    <div
      ref={itemRef}
      className='min-w-[300px] md:absolute top-0 bg-white z-[100] md:border md:shadow-sm availability-form'
    >
      <div className='text-sm px-4 flex justify-end md:border-b items-center'>
        <Button
          onClick={onReset}
          sx={{
            textDecoration: 'underLine',
            display: { xs: 'none', md: 'hidden' },
          }}
        >
          Reset
        </Button>
      </div>
      <div className='md:px-4 md:py-2'>
        <Button
          sx={{
            padding: '16px 0',
            display: { xs: 'flex', md: 'none' },
            width: '100%',
            justifyContent: 'start',
            gap: '8px',
          }}
          onClick={handleBackDrawer}
        >
          <svg
            xmlns='http://www.w3.org/2000/svg'
            width='20'
            height='20'
            viewBox='0 0 20 20'
            fill='none'
          >
            <path
              d='M8.46398 5.80958C8.43258 5.73335 8.38282 5.66606 8.31912 5.61371C8.25543 5.56137 8.17978 5.52558 8.09891 5.50955C8.01804 5.49351 7.93446 5.49772 7.85561 5.52181C7.77676 5.54589 7.70509 5.58909 7.64698 5.64758L3.64698 9.64758C3.60041 9.69402 3.56347 9.7492 3.53826 9.80994C3.51306 9.87069 3.50008 9.93581 3.50008 10.0016C3.50008 10.0673 3.51306 10.1325 3.53826 10.1932C3.56347 10.254 3.60041 10.3091 3.64698 10.3556L7.64698 14.3556C7.74086 14.4495 7.8682 14.5022 8.00098 14.5022C8.13375 14.5022 8.26109 14.4495 8.35498 14.3556C8.44886 14.2617 8.50161 14.1344 8.50161 14.0016C8.50161 13.8688 8.44886 13.7415 8.35498 13.6476L5.20798 10.5016H16.001C16.1336 10.5016 16.2608 10.4489 16.3545 10.3551C16.4483 10.2614 16.501 10.1342 16.501 10.0016C16.501 9.86897 16.4483 9.74179 16.3545 9.64802C16.2608 9.55426 16.1336 9.50158 16.001 9.50158H5.20798L8.35498 6.35558C8.42523 6.28563 8.4731 6.19637 8.49251 6.09915C8.51191 6.00193 8.50198 5.90114 8.46398 5.80958Z'
              fill='#333030'
            />
          </svg>
          Category
        </Button>
        <FormGroup>
          {data.data.map((item: any) => (
            <FormControlLabel
              key={item.categoryId}
              control={
                <Checkbox
                  disabled={productStatus === 'loading'}
                  checked={checked.includes(item.categoryId)}
                  onChange={(_, checked) =>
                    onChange({ categoryId: item.categoryId, checked })
                  }
                />
              }
              label={`${item.name}`}
            />
          ))}
        </FormGroup>
      </div>
    </div>
  );
}

export default CategoryForm;
