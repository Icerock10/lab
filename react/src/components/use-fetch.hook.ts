import { useEffect, useState } from 'react';

type UseFetchPayload = {
  url: string;
};

const useFetch = <T>({ url }: UseFetchPayload) => {
  const [data, setData] = useState<T | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string>('');

  useEffect(() => {
    const controller = new AbortController();

    const callApi = async () => {
      try {
        setIsLoading(true);
        const response = await fetch(url, { signal: controller.signal }); // связывает AbortController с конкретным fetch
        const dataJson = await response.json();
        setData(dataJson);
      } catch (error: unknown) {
        setError(JSON.stringify(error));
      } finally {
        setIsLoading(false);
      }
    };

    callApi();

    return () => {
      controller.abort(); // отменяет fetch когда компонент размонтируется, чтобы не было setState на мёртвый компонент.
    };
  }, [url]);

  return { data, isLoading, error };
};

export { useFetch };
