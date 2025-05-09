import express from 'express';
import { productController } from '../controllers/index';

const router = express.Router();

router.get('/', productController.getProducts);
router.get('/getCount', productController.getCount);
router.get('/discount', productController.getProductsWithDiscount);
router.get('/latest', productController.getLatestProducts);
router.get('/:productId', productController.getProductById);
router.get('/search/:keyword', productController.searchProduct);

router.patch('/', productController.updateProduct);
router.post('/', productController.insertProduct);
router.post('/getCarts', productController.getCarts);
router.delete('/:productId', productController.deleteProduct);

export default router;
