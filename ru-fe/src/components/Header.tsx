import { FunctionComponent } from 'preact';
import { useLocation } from 'preact-iso';
import { useState, useEffect } from 'preact/hooks';
import { API_BASE_URL } from '../config';

export const Header: FunctionComponent = () => {
  const { url } = useLocation();
  const [avatarUrl, setAvatarUrl] = useState<string | null>(null);

  useEffect(() => {
    setAvatarUrl(`${API_BASE_URL}/api/avatar`);
  }, []);

  return (
    <header class="header">
      <div class="logo">
        {avatarUrl && (
          <img 
            src={avatarUrl} 
            alt="Avatar" 
            class="avatar" 
            onError={() => setAvatarUrl('/default-avatar.png')}
          />
        )}
      </div>
      <nav class="main-nav">
        <a href="/blog" class={url === '/blog' ? 'active' : ''}>blog</a>
        <a href="/about" class={url === '/about' ? 'active' : ''}>about</a>
        <a href="/contact" class={url === '/contact' ? 'active' : ''}>Contact</a>
      </nav>
    </header>
  );
};