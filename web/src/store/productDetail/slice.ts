import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';

import { BASE_URL } from '../../utils/constants/strapi';
import { ipaCall } from '../../utils/hooks/apiCall';
import type { RootState } from '../root/config.store';
import {
  ProductDetailInitialState,
  ProductDetailState,
  ProductsDetailState,
} from './types';

const initialState: ProductDetailInitialState = {
  product: {
    data: {
      productId: 0,
      name: '',
      price: 0,
      description: '',
      productCategories: [],
      productGeneralImages: [],
      productImages: [],
      productInventories: [],
    },
    status: 'idle',
    error: null,
  },
  productSuggestion: {
    data: [],
    status: 'idle',
    error: null,
  },
  status: {
    add: 'idle',
    delete: 'idle',
  },
};

// slice
export const productDetailSlice = createSlice({
  name: 'productDetails',
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(productDetailActions.getProduct.pending, (state) => {
        state.product.status = 'loading';
      })
      .addCase(productDetailActions.getProduct.fulfilled, (state, action) => {
        state.product.status = 'succeeded';
        state.product.data = action.payload;
      })
      .addCase(productDetailActions.getProduct.rejected, (state, action) => {
        state.product.status = 'failed';
        state.product.error = action.payload as string;
      })
      .addCase(productDetailActions.getProductSuggestions.pending, (state) => {
        state.productSuggestion.status = 'loading';
      })
      .addCase(
        productDetailActions.getProductSuggestions.fulfilled,
        (state, action) => {
          state.productSuggestion.status = 'succeeded';
          state.productSuggestion.data = action.payload;
        }
      )
      .addCase(
        productDetailActions.getProductSuggestions.rejected,
        (state, action) => {
          state.productSuggestion.status = 'failed';
          state.productSuggestion.error = action.payload as string;
        }
      )
  },
});

// Actions
export const productDetailActions = {
  getProduct: createAsyncThunk(
    `${productDetailSlice.name}/getProduct`,
    async (productId: number, thunkAPI) => {
      try {
        const product = await ipaCall(
          'GET',
          `${BASE_URL}products/${productId}`,
          false
        );
        return product;
      } catch (e: any) {
        return thunkAPI.rejectWithValue(e.message.toString());
      }
    }
  ),
  getProductSuggestions: createAsyncThunk(
    `${productDetailSlice.name}/getProductSuggestions`,
    async (productId: number, thunkAPI) => {
      try {
        const product = await ipaCall('GET', `${BASE_URL}products`, false, {
          productId,
          limit: 4,
          page: 1,
        });
        return product;
      } catch (e: any) {
        return thunkAPI.rejectWithValue(e.message.toString());
      }
    }
  ),
};

// Selectors
export const selectProduct = (state: RootState): ProductDetailState =>
  state.productDetails.product;
export const selectProductSuggestion = (
  state: RootState
): ProductsDetailState => state.productDetails.productSuggestion;

// Reducer
export default productDetailSlice.reducer;
