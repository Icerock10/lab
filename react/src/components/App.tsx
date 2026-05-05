import { useFetch } from './use-fetch.hook.ts';

type Post = {
  title: string;
};

const App = () => {
  const { data, isLoading } = useFetch<Post>({
    url: 'https://jsonplaceholder.typicode.com/todos/1',
  });

  return (
    <>
      <p>{isLoading ? 'Loading' : data?.title}</p>
    </>
  );
};

export { App };
