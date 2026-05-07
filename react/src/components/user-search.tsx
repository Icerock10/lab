import { useState, useEffect, useRef } from 'react';

type User = {
  name: string;
  email: string;
  id: number;
};

function debounce<T>(fn: (...args: T[]) => void, delay: number) {
  let timer: ReturnType<typeof setTimeout> | null = null;
  return function (...args: T[]) {
    if (timer) clearTimeout(timer);
    timer = setTimeout(() => fn(...args), delay);
  };
}

const Usersearch = () => {
  const [searchValue, setSearchValue] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>('');
  const [users, setUsers] = useState<User[]>([]);
  const onChange = (event: React.BaseSyntheticEvent) => {
    setSearchValue(event.target.value);
  };
  const controllerRef = useRef<null | AbortController>(null);

  const getUsers = async (value: string, signal: AbortSignal) => {
    try {
      setIsLoading(true);
      const response = await fetch('https://jsonplaceholder.typicode.com/users', {
        signal,
      });
      const data: User[] = await response.json();
      const filteredUsers = data
        .filter((user) => user.name.toLowerCase().includes(value.toLowerCase()))
        .toSorted((a, b) => a.name.localeCompare(b.name));
      setUsers(filteredUsers);
    } catch (error: unknown) {
      if (error instanceof DOMException) {
        return;
      }
      setError(JSON.stringify(error));
    } finally {
      setIsLoading(false);
    }
  };

  const debouncedGetUsers = useRef(
    debounce(
      ({ value, signal }: { value: string; signal: AbortSignal }) => getUsers(value, signal),
      1500,
    ),
  );

  useEffect(() => {
    controllerRef.current = new AbortController();
    debouncedGetUsers.current({ value: searchValue, signal: controllerRef.current?.signal });
    return () => {
      controllerRef.current?.abort();
    };
  }, [searchValue, debouncedGetUsers]);

  return (
    <div>
      <input type='text' onChange={onChange} value={searchValue} />
      {isLoading ? (
        <div>Loading</div>
      ) : (
        <div>
          {users.length > 0
            ? users.map((user) => <p key={user.id}>{user.name}</p>)
            : 'No users found'}
        </div>
      )}
      <div>{error}</div>
    </div>
  );
};

export { Usersearch };
