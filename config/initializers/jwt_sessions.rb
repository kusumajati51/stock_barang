JWTSessions.algorithm   = "RS256"
JWTSessions.private_key = OpenSSL::PKey::RSA.generate(2048)
JWTSessions.public_key  = JWTSessions.private_key.public_key
JWTSessions.jwt_options.verify_iss = true
JWTSessions.jwt_options.verify_sub = true
JWTSessions.jwt_options.verify_iat = true
JWTSessions.jwt_options.verify_aud = true
JWTSessions.access_exp_time = 160*1000*1000*1000*1000 # 1 hour in seconds
