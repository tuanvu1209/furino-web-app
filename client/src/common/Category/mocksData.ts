interface CategoryModal {
  id: number;
  image: string;
  title: string;
  link: string;
}

export const data: CategoryModal[] = [
  {
    id: 1,
    image: 'https://res.cloudinary.com/dpjmvy4ij/image/upload/v1744093128/dining_gdp26q.jpg',
    title: 'Dinning',
    link: '/shop',
  },
  {
    id: 2,
    image: 'https://res.cloudinary.com/dpjmvy4ij/image/upload/v1744093126/bedroom_q4k1de.jpg',
    title: 'Bedroom',
    link: '/shop',
  },
  {
    id: 3,
    image: 'https://res.cloudinary.com/dpjmvy4ij/image/upload/v1744093126/living_p5bu3q.jpg',
    title: 'Living',
    link: '/shop',
  },
];
