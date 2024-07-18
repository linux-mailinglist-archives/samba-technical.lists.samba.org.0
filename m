Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E92429346FC
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jul 2024 05:55:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=e+3YHxLNIwGx+Lgf7z2bcy0WSgOL1BClm5XPWZkLG+o=; b=mkMoIO79izwY667lGFT4ofLMyW
	cp5raA6hwBp/bMIAFbkLvHyjzZ2UGFMa/jkAmgUbykSSbcEfW6x5i8LnXZTTXoiDM/9nD/OmKPrzg
	QXHa9GweycxyLGpzTxC+5xIwAw537D+bg1Vfmv7/o06JxI3zSnJEhsZ81KOu+0MOmrXxP88VrV/bu
	6JvWdYo8l7vO1+hIpVxrOdx3Dzq9+7XFMajTqIFkePs696rWyHed/Bare218OY2gGOZtsU7uKZEPC
	C9jU6ZMC9SNFxSjGpKdAGcqcBjQnVR1kDD/70vpZl4G4uDjw4YQBncLfaYjVOTH/UuL7w3LinobB+
	40qu9a4A==;
Received: from ip6-localhost ([::1]:19074 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sUIDs-000yAk-I1; Thu, 18 Jul 2024 03:54:28 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53]:49387) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sUIDp-000yAb-El
 for samba-technical@lists.samba.org; Thu, 18 Jul 2024 03:54:27 +0000
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5ce74defe43so163259eaf.2
 for <samba-technical@lists.samba.org>; Wed, 17 Jul 2024 20:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721274862; x=1721879662;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e+3YHxLNIwGx+Lgf7z2bcy0WSgOL1BClm5XPWZkLG+o=;
 b=VliMfafJUGWMZ2aNwC0sVqlw8npIIFr/RO1xd9/vh87ENFnRvCREN4ExrocSQqhFBt
 CJ2klv3GT1lG1ikufizXHjCwdSEpdg+t8HOESsHKQiO15NPUoChxLA4DqM8AZV+O0nJM
 IZdIogoc5dZyDEw2N0k1IfzeIp9PkAfWJgYTNR1IRKrL72T699VgM6f+9wCwRcfoBnCo
 hSHThSP3tCmK+Db3GkZPohQX6iOEqcxrvnSpyVqqiDSZqRzM/X/LSWGA0qlW5ziKvH6n
 lWaKnR8cyaQ+XtfQNM55SQ7T9otX+vJU5pfuM//ieTdSN5U/Fh2VhsqcueBkgRJDYOUD
 LVYA==
X-Gm-Message-State: AOJu0YxXE1jhNdy6XzNjsgskAeeA020B/vsqN4Nq0qVBBcAECGBld7gu
 n9EHXlvu2jwykc6EUT1N4slZqY+uEDAzqv1BjQvtsKYoWEy8AY2/RDG88Q==
X-Google-Smtp-Source: AGHT+IFjSPMWjuN1CIkTBECLR2Cu7ySl/DXHbvc3ORfnEGUaLpKHDSIhl8nHmPf1Ycwjq4J4ul7uZg==
X-Received: by 2002:a05:6358:54a6:b0:1aa:b8ba:7a with SMTP id
 e5c5f4694b2df-1aca9fa260fmr138092655d.26.1721274862167; 
 Wed, 17 Jul 2024 20:54:22 -0700 (PDT)
Received: from FreeBSD.org (c-98-56-195-67.hsd1.ca.comcast.net. [98.56.195.67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bba949bsm82993935ad.69.2024.07.17.20.54.21
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 20:54:21 -0700 (PDT)
Date: Wed, 17 Jul 2024 20:54:20 -0700
To: samba-technical@lists.samba.org
Subject: Helping to improve FreeBSD support
Message-ID: <tc6xfz3it47oxa224ert4fs2u36h3qefm2elc64kugofrujk4t@vh2wevz6y6qc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t7oo5ptaxa5lrwak"
Content-Disposition: inline
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
From: John Hixson via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Hixson <jhixson@freebsd.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--t7oo5ptaxa5lrwak
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Howdy!

Would Samba be interested in better FreeBSD support? I am reaching out
on behalf of the FreeBSD Foundation. We would like to help improve
support in whatever way we can. What needs to happen?=20

For starters, I would like to help get as many of our port patches
upstreamed as possible. I would also be interested in helping out in
areas that are specific to FreeBSD. It would also be nice to have some
CI setup.

Interested? Where to go from here?=20

Cheers!

- John

--t7oo5ptaxa5lrwak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAABCgB9FiEEJaAswQZQMflCdCA6RqljBb/iPUAFAmaYkeVfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDI1
QTAyQ0MxMDY1MDMxRjk0Mjc0MjAzQTQ2QTk2MzA1QkZFMjNENDAACgkQRqljBb/i
PUCYdRAAxLpDNf1JTJgY7eZJ6q8PMq524DwI+nMvBJ/v76HvuWCstd6Id5k1yCeS
lGSD1vUVuviC1F+6Jn3r55Of8BHUQgmKYiibnRXTdYb0QHuAVRALuX+zeIFfjIJ5
12HO5QXzVU+OmfWqLiKfEw4aXDJLbqLG1rH3N92YuugtcDMPSdWEwCaVY1rpeuRW
7qEgHoTL4hZT1I+xC2Z+bsgzOh4KdfFiDeMyMdRZFXnYtbknVZD24lpbunzyoM7w
x/2n+IqLYwOMFhboFXDC0yC2Jsa7v9o6auMGb20symh6zxkFnoQTqbAfG5dYzWPY
jyo4XxLtHa0DT0Tz85TQsIUlzFhgh6h9UVghgUJvrPJ/YwLiDr19cU9XTQ1AZstR
u0ETKFFV8e3zC1hxn5LQtOOUiaIW3HsSMCDN4nweD+ktZxFawVqEZ1TeyS8cHuwc
dejGBN+95rdZXPZOjhCxcSQPFEQMFe7wwa9zPs8zg+P/AR/n7rGmh0Rt7QGyL4wz
rKh1TTkeCpExJw9Bq96REk0WV0ufP8J9/irdKQBlCjQlqLHl3scua3GJzgQ8P6iM
hBJqDNswM+b+z8aRpck6Y/ffL/JjjoZZilEdoGeKot8vyem9CPBGU/4dPqsjQEXZ
15mv99ZcujvLTtV/4uuDo3khTlkLctTe2SFaN5pGtNgQxGo6scA=
=LX+7
-----END PGP SIGNATURE-----

--t7oo5ptaxa5lrwak--

