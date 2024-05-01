package com.study.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    //    private PasswordEncoder passwordEncoder;
    private final BCryptPasswordEncoder encoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if (username.equals("son")) {
            String encoded = encoder.encode("son7");
            return new User("son", encoded, List.of(
                    new SimpleGrantedAuthority("user")
            ));
        } else if (username.equals("lee")) {
            String encoded = encoder.encode("lee9");
            return new User("lee", encoded, List.of(new SimpleGrantedAuthority("admin"),
                    new SimpleGrantedAuthority("user")));
        } else {
            throw new UsernameNotFoundException(username + " not found");
        }
        // User(유저이름, 패스워드, 권한)
        // 인증 : authentication 로그인 했나 안했나
        // 권한 : authorization 로그인하고 어떤 경로에 갈수 있나 없나, 권한에 따라 일을 결정해주는 것
        // 한 유저가 여러 권한을 가질 수 있다
    }
}
