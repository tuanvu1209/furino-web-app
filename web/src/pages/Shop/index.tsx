import Breadcrumb from '../../common/Breadcrumb/Breadcrumb';
import Commit from '../../common/Commit/Commit';
import Products from './Products';

function Shop() {
  return (
    <>
      <Breadcrumb
        title='Shop'
        part='shop'
      />
      <Products />
      <Commit />
    </>
  );
}

export default Shop;
