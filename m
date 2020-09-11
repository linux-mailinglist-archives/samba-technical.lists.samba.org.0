Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F38266236
	for <lists+samba-technical@lfdr.de>; Fri, 11 Sep 2020 17:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=VoyHiGo/0MtGpjw5Wl2CKiHxGEfMrrlhI7rQzx8AWuY=; b=lLYyfD0qn4cyjhi4IalRn4Zm9w
	qpYP87lxM20aGRyom97NrOelbYLv9USfqWaJ3qlzbodFZOe6s+Eo3CzWX91nh06qV+GIPcJGo0Qdr
	YWlFu9ijB5YddA/Bx5B88Hw8b9asiFF8XnNSQVEjFQ/t9b4i74MyPn5Tku3BOZ/LFGm/M8sl+7tUo
	thlUQbzcsyr2b2sJXWcvsRFtojBsMm448CBSvAkG6Nv4+4qLB4xK3lydVGEXkOJ41xYFS73D3SV3M
	3HTXLpUUFRbsXLoX7AcAybWu/etDBSG80pX7bwYTK89WI0pVO4RPQvJyPlX22nXc3UuFeXVNtNwDY
	pBmxYCZg==;
Received: from localhost ([::1]:65336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kGl2m-0058mg-07; Fri, 11 Sep 2020 15:32:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24598) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGl2g-0058mZ-TD
 for samba-technical@lists.samba.org; Fri, 11 Sep 2020 15:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=VoyHiGo/0MtGpjw5Wl2CKiHxGEfMrrlhI7rQzx8AWuY=; b=GjhxhZDPtAcbE4Ad/bgyVVKSZx
 g+PIVBpXsjr83Pe0+Neo3SWAYoYggfFUlrOCI8L5u1GAZPuBoMRlU/afRgKZxDyb+S/eKfQW04VPO
 laCHcq4XdyKdrQLFY33PylxDOriPrk+fUJ2wWPVMHhIAkUCE/5/grBujhiMS1/4wwIb8KjmrPQtbL
 iVwWtjeU6ljnYvv3oqk+jnGEnzbaYvCv21ILoJ/TV8FUbD1nvGfhHybxycAp+zAGl7JXI2o7SOhKK
 wcNXaVLU9JEXiBRAxmTZAY3Cs/5+8pEX1clkLbsZujGpAFZ8mYyWW+mI26DQPL8abGUvHGYAkLSeU
 RJVyEPRioNxoqVmvPUuOxD0ijq0Wg0ylWj4sssr6hVLJEI9KPBoHhFWzWQjqL4M3bGh1JX6wlYfXM
 RvHl5u/uAmIEy8vIRkDYq56vUykpOTUXer7QmzjwBd2FXC98SBbwfjVKXzy3ur8TB7+3i2xoNV1mx
 Z0XIxOCQ1C4iVSFK98ogvgP0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGl2e-0003r5-4g; Fri, 11 Sep 2020 15:32:48 +0000
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
 <CAC-fF8R4+mJ1LG1xK2+3hEws7=Pj6TYd-+FgHf6=eXEPn5pwyg@mail.gmail.com>
 <CAC-fF8RRAQbAgNA9R3kwKwt69DJY7fQwGvC3Yhz732Vmo_sh1w@mail.gmail.com>
Subject: Re: winbindd main process hangs on samba-dc
Message-ID: <501d9ca8-a49c-532f-48a3-201eed82bb1c@samba.org>
Date: Fri, 11 Sep 2020 17:32:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8RRAQbAgNA9R3kwKwt69DJY7fQwGvC3Yhz732Vmo_sh1w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="c0LQCntCnKCjzFpUWG8UZN2B0Qw1LC9Po"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--c0LQCntCnKCjzFpUWG8UZN2B0Qw1LC9Po
Content-Type: multipart/mixed; boundary="3q1LLWIBRlVMEfJGZmCVhr2StdqnF6UEU";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <501d9ca8-a49c-532f-48a3-201eed82bb1c@samba.org>
Subject: Re: winbindd main process hangs on samba-dc
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
 <CAC-fF8R4+mJ1LG1xK2+3hEws7=Pj6TYd-+FgHf6=eXEPn5pwyg@mail.gmail.com>
 <CAC-fF8RRAQbAgNA9R3kwKwt69DJY7fQwGvC3Yhz732Vmo_sh1w@mail.gmail.com>
In-Reply-To: <CAC-fF8RRAQbAgNA9R3kwKwt69DJY7fQwGvC3Yhz732Vmo_sh1w@mail.gmail.com>

--3q1LLWIBRlVMEfJGZmCVhr2StdqnF6UEU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 10.09.20 um 12:06 schrieb Isaac Boukris via samba-technical:
> I think there is no point trying to maintain domain->online per domain
> in the parent process, we should just ask the domain child (fork one
> if needed), and avoid ever trying to talk with a DC (sync) from the
> main process.

Yes, the parent should only ever to talk to the children.

metze


--3q1LLWIBRlVMEfJGZmCVhr2StdqnF6UEU--

--c0LQCntCnKCjzFpUWG8UZN2B0Qw1LC9Po
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl9bmJkACgkQDbX1YShp
vVZSRQ//b7HZXmnATNU65R6ylz/C1yj2Md6NmJTK/ANnC7drMXWbTLNQnBg/HLWu
UO+jSZCqnk/noanh0RLmut7pJXAF4wHHcqhcYR8zjJU2BjlK/14RMihOZh6K50UA
XtYefdbilKQFjZv5kMgRN2QfWSF9QJOSl5a8Rsvun5LQ6iTaaNIv+Pe8DGrQFGhH
OaGA/qJSdQUoGZUmlRRgXEz1+fraVgYIwvQiN0l95PQaWSVo0mkYgjdlbrSh+yij
lCJysYrK2MQVArEqvaF8G8eUJedwXeJtFZP4QEfdfDqqOvW+wvU6tYun2FOQQ5wI
rXxsWfvXlHk2NXWmzONoZH/oZKTCeOVmlDVkHfsUyhGmiFu8KAkmEu67fF3Wy/FS
P7azY+Y2JrAP5PrBTlm45AgL7C9Q3qDeR3aEQ8gfVnXI8xFf0eTEhfFRyf/oAIcF
d3ibrNblogpNAIoxpf3olLI3QQz/i/iRxq11mWLYqzfiLAuAzCmkPtNDyM6zLQew
tlYTiSlxR0ocgK2tQ7ccahikBeslN4CHU09oquLQccvkPmNo0bw8qM2wbyDUMq2B
Bx+Lgjqm5QWk3wyDoXsm08zKDvRDZGDSauBf0oCaqCjVjMfeczbhJqLje6k45cyE
Sl1KIbFZEdAjlOIRqc3V8CxFKVeU/TVBpGLjtNuUPz2fJal9c3k=
=S+6h
-----END PGP SIGNATURE-----

--c0LQCntCnKCjzFpUWG8UZN2B0Qw1LC9Po--

