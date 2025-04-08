interface BannerModal {
  id: number;
  image: string;
  title: string;
  supTitle: string;
  description: string;
  link: string;
}

export const data: BannerModal[] = [
  {
    id: 1,
    image: 'https://res.cloudinary.com/dpjmvy4ij/image/upload/v1744092885/banner_ywnyrv.jpg',
    title: 'Discover Our New Collection',
    supTitle: 'New Arrival',
    description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.',
    link: '/shop',
  },
  {
    id: 2,
    image: 'https://res.cloudinary.com/dpjmvy4ij/image/upload/v1744092885/background-1_erhwqk.jpg',
    title: 'Explore Our Summer Collection',
    supTitle: 'Summer Special',
    description:
      'Dive into our exclusive summer collection. Ut elit tellus, luctus nec ullamcorper mattis.',
    link: '/shop',
  },
  {
    id: 3,
    image: 'https://res.cloudinary.com/dpjmvy4ij/image/upload/v1744092884/background-2_y6bwms.jpg',
    title: 'Unveiling Our Winter Collection',
    supTitle: 'Winter Arrival',
    description:
      'Get ready for winter with our new collection. Ut elit tellus, luctus nec ullamcorper mattis.',
    link: '/shop',
  },
];