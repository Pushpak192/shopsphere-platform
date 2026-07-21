package com.shopsphere.auth.controller;

import com.shopsphere.auth.dto.AuthenticationResponse;
import com.shopsphere.auth.dto.LoginRequest;
import com.shopsphere.auth.dto.RegisterRequest;
import com.shopsphere.auth.service.AuthenticationService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthenticationService authenticationService;

    @PostMapping("/register")
    public AuthenticationResponse register(
            @RequestBody @Valid RegisterRequest request) {

        return authenticationService.register(request);

    }

    @PostMapping("/login")
    public AuthenticationResponse login(
            @RequestBody @Valid LoginRequest request) {

        return authenticationService.login(request);

    }

}
