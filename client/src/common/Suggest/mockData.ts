import { product1 } from '../../assets/images';

interface SuggestModal {
  id: number;
  image: string;
  title: string;
  category: string;
  link: string;
}

export const data: SuggestModal[] = [
  {
    id: 1,
    image: 'https://res.cloudinary.com/dpjmvy4ij/image/upload/v1744093126/bedroom_q4k1de.jpg',
    title: 'Inner',
    category: 'Bed Room',
    link: '/shop',
  },
  {
    id: 2,
    image: 'https://res.cloudinary.com/dpjmvy4ij/image/upload/v1744093126/living_p5bu3q.jpg',
    title: 'Comfort',
    category: 'Living Room',
    link: '/shop',
  },
  {
    id: 3,
    image: 'https://res.cloudinary.com/dpjmvy4ij/image/upload/v1744093128/dining_gdp26q.jpg',
    title: 'Culinary',
    category: 'Kitchen',
    link: '/shop',
  },
  {
    id: 4,
    image: product1,
    title: 'Work',
    category: 'Office',
    link: '/shop',
  },
];
