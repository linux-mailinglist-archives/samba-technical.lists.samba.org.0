Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722B3826FA
	for <lists+samba-technical@lfdr.de>; Mon, 17 May 2021 10:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=H3ka3sbmrbv0nqdfv2D8EcK7SJRDzaruC4vYTshlmGk=; b=cIasVUtQSYX3oYmHFxv9CrbjfY
	GH2ybP/gveP0IBiRMBpupsRiJSUFFtYATkdzobn92Kaw4T3UkRFuPkNlmvGHZc2h8JITqNGr1WJ2A
	JzYx6i6lBnd5Bxag8KzI/eom9LGR9vaFgB3/7EJYR3aUGUiPDbofaaeXeRoVQNkQ9qRW5PLmzJjbN
	tD8N1TZzfjcLwwVbFpeXdskBJ5zvJhxwRwSR3Ex5G3WlFeYqCfic/giBUVjUTHB0ILWVnXxc/GECv
	gsl7vmiRfmPyAW2dUKHphomv9Ffe8Pq7HFyZOPeiCqCi+L2j4l12JrYQcs+c708FjIIUTh5U30PTC
	fIGrl/Ig==;
Received: from ip6-localhost ([::1]:35194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1liYZZ-000g6K-LK; Mon, 17 May 2021 08:25:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47958) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liYZV-000g55-6d
 for samba-technical@lists.samba.org; Mon, 17 May 2021 08:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=H3ka3sbmrbv0nqdfv2D8EcK7SJRDzaruC4vYTshlmGk=; b=YzilpP4y45QJx/fYNYD021rs9Q
 7SNyXgKkzUpYhVT7/ps/bTPcf6adGa6UIu+QlDCiWz6PlV9j4eKGDUmeyHsDK/foMvNjj+bRi4dWQ
 G4nyjFirqSqctTMj37cUyFZnHLIKDRk1c9Ir0HA9JObW5DdFqxZ64kBfzq7/EBNH5XX5oPPYw5pmT
 cqPcgRDV6RUZvWDn63oh5Xp9C69ZmvmdBOiAmB6Bj6jlueVO0e4fZM1OHF7Vy3zHvoBOgV987jL9e
 JOHKkKkFIwdoeNgWU5f0amVy75uRN4jbzHoh/m14/4BB2wrEHnbh8/J/2FXQBdqIKbQS/tvlimIb+
 X9/to/WiQV8e6Hlc8Tq472JwqeqtpAF0Z7aKg0WIPG0RLbuU3JlIIpfViDD+djtACXZO44A0cFwQO
 DBVKtEH5bJEVg+asG4v7WMrUcP3SoCI5Yv8p9OJtQETAuaxgVZjYoIWJ3Lis+Ivb3WJoBIBE/YKt4
 pY/Giue5ibYnczH/35ARUjEC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liYZT-0000Or-Rw; Mon, 17 May 2021 08:25:51 +0000
To: Andreas Schneider <asn@samba.org>
Subject: smb.conf "log file" broken since e8780be
Message-ID: <3c7e8c86-eb12-aedc-2dd4-faa9c9ebbbd7@samba.org>
Date: Mon, 17 May 2021 10:25:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jbkxg657HMgmRQ6HhPpYPxIpvyD3W5yqn"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jbkxg657HMgmRQ6HhPpYPxIpvyD3W5yqn
Content-Type: multipart/mixed; boundary="P7vxgH8Q6tEA4i1s4jYo0GhaxBZvuRX1s";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andreas Schneider <asn@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <3c7e8c86-eb12-aedc-2dd4-faa9c9ebbbd7@samba.org>
Subject: smb.conf "log file" broken since e8780be

--P7vxgH8Q6tEA4i1s4jYo0GhaxBZvuRX1s
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Andreas

it looks like "log file" in smb.conf doesn't work anymore since -2=20
e8780be. Once I revert both commits it works again. Can you please take=20
a look?

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--P7vxgH8Q6tEA4i1s4jYo0GhaxBZvuRX1s--

--jbkxg657HMgmRQ6HhPpYPxIpvyD3W5yqn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmCiKI8FAwAAAAAACgkQqh6bcSY5nkai
cw/8DAFJcf/y0uEoTm7n0yfKffDP2yumk4EqJtE89c+nSwnlD6t1I0zVbomNxWSTkAKEKfe5toXQ
moYxKuh7SBx8+AYYymrKqNXUNXzv9Z5Tq5elEGigE3uBTL2eHOFo2U1R9jL1oXVlbFBtWYdPgbSf
f8onaHkay1d0VvtNGS67/KtBZnkcEYIJ6wffVUXBaItx6AH5hxztEpqWzijMAeANLZ+KEJOHVGcu
DyN8O4DC/91HQplY8PVJy7gTUjKtqbpucaf+vgbNUGi8tZ2p2Tm7ga5yZXfxjx8Y3uTtHmRRFSiL
jpD0syK26mqjPATycxRiG0YccjLhatyzncvtBiBn7MiHwXbfO5+g+6fbINP/hYgQQw67JRULKddM
t7fSLYgR27a1IC6Snt6FPCVXVwoh+d9QzD4KwV97L/QvzRgnaEe/qd+85L8OTDJGVUSky4fgEhqm
lQmc0lxngqSS/8BLn226GifOv03o1mTgiRtGoCMv3htYxXsqTRj5/MBimIfP+O09CS6u5RjTs04R
6zBz53C6Fl8NSc8R4ddD6hcwfGuTGxGayGUsr5lMfHP2ana/1gQsWHCMVtkre1JLquPHz7doizel
87wl6yBH3e1b3mxokp86NBUaN8kBisayf4V/SfAiHbDpN37ittegKbWisTXiqM0/vIM5RQHu2vN4
snU=
=12zi
-----END PGP SIGNATURE-----

--jbkxg657HMgmRQ6HhPpYPxIpvyD3W5yqn--

