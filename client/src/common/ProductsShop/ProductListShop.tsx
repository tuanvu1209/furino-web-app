import InfiniteScroll from 'react-infinite-scroll-component';
import noProduct from '../../assets/images/noProducts.png';
import { ProductProp } from '../../types/product';
import { ProductItem, ProductSkeleton } from '../index';

function ProductListShop({
  products,
  limit,
  status,
  loadMoreData,
  hasMore = false,
}: {
  products: ProductProp[];
  limit: number;
  status: string;
  loadMoreData?: () => void;
  hasMore?: boolean;
}) {
  if (
    status === 'failed' ||
    (status === 'succeeded' && products?.length === 0)
  ) {
    return (
      <img
        className='mx-auto'
        src={noProduct}
        alt='No products'
      />
    );
  }

  return (
    <div>
      <InfiniteScroll
        dataLength={products.length}
        next={loadMoreData ? loadMoreData : () => {}}
        hasMore={hasMore}
        loader={
          status === 'loading' && (
            <div className='grid gap-[20px] grid-cols-2 mt-[20px] md:grid-cols-3 lg:grid-cols-4 md:p-4'>
              <ProductSkeleton limit={2} />
            </div>
          )
        }
        // endMessage={
        //   status === 'succeeded' &&
        //   loadMoreData && (
        //     <p className='md:hidden text-center mt-[10px]'>No more products</p>
        //   )
        // }
      >
        <div className='grid gap-x-[10px] gap-y-[24px] grid-cols-2 md:grid-cols-3 lg:grid-cols-4 justify-center'>
          {(status === 'loading' && window.innerWidth > 600) ||
          (status === 'loading' && products.length === 0) ? (
            <ProductSkeleton limit={limit} />
          ) : (
            products?.map((item) => (
              <ProductItem
                key={item.productId}
                item={item}
              />
            ))
          )}
        </div>
      </InfiniteScroll>
    </div>
  );
}

export default ProductListShop;
