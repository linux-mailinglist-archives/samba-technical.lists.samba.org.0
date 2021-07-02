Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B513B9D1F
	for <lists+samba-technical@lfdr.de>; Fri,  2 Jul 2021 09:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=kh40bwOdJ6QvFtffzPN/s7MtKw8NSCm10SCAuam1xig=; b=tY98AcIk5Ek3hpsfpfIpLvI40g
	TM6+Du22AegvIpNOSKUiCTNFq05UvgCgABj2LsoXMVHqWL6cvzQl3T42NaC34CFQb1rMrKsb4pD6f
	pvOQLLgO25gndH54fq4UF2Snim2bakTqkrz9qIjZTndDgbyLV/uwhlLpCb3EdxiLN4cgi2rBMgemx
	vjR9yoclcHvgZg4tFfU7bxgLCn8r+ilzqWlmfRzLGp5aRiYUM7m8B9hDT3Nk3ykElLp2kXwLtMUCE
	sM9Vvu+GCQg4TaQKfeenT/a3oJxyx6hstyeGnjK2N3pN74TeuXOpLXVB5lpveUEcMR9l1/e11hpLO
	iX8gQfzQ==;
Received: from ip6-localhost ([::1]:24664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lzDxb-00Bk1H-Gc; Fri, 02 Jul 2021 07:51:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37038) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lzDxV-00Bk18-Cn
 for samba-technical@lists.samba.org; Fri, 02 Jul 2021 07:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=kh40bwOdJ6QvFtffzPN/s7MtKw8NSCm10SCAuam1xig=; b=bCccweWC2m2Wwa+mHn+Ag6SZy7
 ZHZJAjfeAqO+O4KQOzcydXaxtBT0/7jOU0b/JHUcEnoDcwbRH/ZQzSB9r14HBZ3uFOJ4vaK8Vljyf
 aORurlBdZtCZDXD4B6mQwjuMkvblmNvZGSYV4OYUaH6Ogh1F6IItudkQuBJGwkSpQ6pIZKElFcwev
 g1hnmmbqobwQphuVFNQ97PWVOw9zO7xbhZ/DJLOWg7iVnRUb5k70JInorbz2y2kR33p36UMszirp0
 hKVQTNMN6YkEqCn5ieWnMBQeBuz7pBkrWFDe3khZ5Rpmd8TKy9aHUJb9J7UsiRpqi8klVdMn8knm2
 xUZSjQJE8mtjlxsjfQa83IKWdCX5gUekiccoFG6bA6IwFmQW3EEXSTJ5iBChOdgUPmxhcqFPuD8hb
 KDjxRhMKNN3Kd7sPFatNsYtXV50J6v7Nvk9kN+DoxEY8oRM2VrZbiVvrtKivtclkR48BkOHYOC9AN
 c5bLjfI5nHBi+ZzMzZD85N+H;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lzDxU-0004EF-JX; Fri, 02 Jul 2021 07:51:32 +0000
To: Lorenz Schori <lo@znerol.ch>, samba-technical@lists.samba.org
References: <20210701220727.76fa9c60@bonemachine>
Subject: Re: gensec_krb5_start() fails silently with tlocal_addr /
 tremote_addr is IPv6
Message-ID: <c99f42b9-4abc-36a1-08da-8f752c558f39@samba.org>
Date: Fri, 2 Jul 2021 09:51:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701220727.76fa9c60@bonemachine>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LATy0WxD4qo5mX8rcv7xbID1e4qJXjg5b"
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
--LATy0WxD4qo5mX8rcv7xbID1e4qJXjg5b
Content-Type: multipart/mixed; boundary="BKsuwisNOEntnAtQll5nfRx7o93JwXr9e";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Lorenz Schori <lo@znerol.ch>, samba-technical@lists.samba.org
Message-ID: <c99f42b9-4abc-36a1-08da-8f752c558f39@samba.org>
Subject: Re: gensec_krb5_start() fails silently with tlocal_addr /
 tremote_addr is IPv6
References: <20210701220727.76fa9c60@bonemachine>
In-Reply-To: <20210701220727.76fa9c60@bonemachine>

--BKsuwisNOEntnAtQll5nfRx7o93JwXr9e
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Lorenz,

> The function gensec_krb5_start() returns NT_STATUS_INTERNAL_ERROR when
> tlocal_addr / tremote_addr are IPv6. No debug messages are generated in=

> this case and nothing obvious shows up in strace. Only thing i see in
> logs even with log level 10 are the following lines:
>=20
>=20
>     Starting GENSEC mechanism krb5
>     Failed to start GENSEC server mech krb5: NT_STATUS_INTERNAL_ERROR
>=20
>=20
> As a result things like kpasswd do not work.

I guess our 'kpasswd' server is broken currently and doesn't answer
to password change requests, is that the problem your having?

It would be great if you could file a bug at https://bugzilla.samba.org/
with these details.

> Loking through the samba source there are not so many code paths throug=
h
> gensec_krb5_start() without any DEBUG statements. Thus I believe what
> happens is the following (from gensec_krb.c, see [1]).
>=20
> 		sockaddr_ret =3D tsocket_address_bsd_sockaddr(
> 			tlocal_addr, &addr.u.sa, sizeof(addr.u.sa));
> 		if (sockaddr_ret < 0) {
> 			talloc_free(gensec_krb5_state);
> 			return NT_STATUS_INTERNAL_ERROR;
> 		}
>=20
> When tlocal_addr is IPv6, then sockaddr_ret will return an error.
> Looking at other examples of tsocket_address_bsd_sockaddr it seems that=

> most of them use sizeof(struct sockaddr_storage) for the last param
> except the one call shown above.
>=20
> I suspect that this might be the problem. Consider the following test
> program:
>=20
> $ cat <<EOF > /tmp/test.c
> #include <netinet/in.h>
> #include <stdio.h>
> #include <sys/socket.h>
> #include <sys/un.h>
> #include <unistd.h>
>=20
> #define sockaddr_storage sockaddr_in6
> struct samba_sockaddr {
> 	socklen_t sa_socklen;
> 	union {
> 		struct sockaddr sa;
> 		struct sockaddr_in in;
> 		struct sockaddr_in6 in6;
> 		struct sockaddr_un un;
> 		struct sockaddr_storage ss;
> 	} u;
> };
>=20
> int main(void) {
>         struct samba_sockaddr addr;
>         printf("sizeof(addr.u.sa): %ld\n", sizeof(addr.u.sa));
>         printf("sizeof(struct sockaddr_storage): %ld\n",
> 		sizeof(struct sockaddr_storage));
> 	return 0;
> }
>=20
> EOF
>=20
> On my machine, this produces the following output:
>=20
> ./a.out=20
> sizeof(addr.u.sa): 16
> sizeof(struct sockaddr_storage): 28

This is actually the sizeof sockaddr_in6, because of the '#define sockadd=
r_storage sockaddr_in6',
but it doesn't really matter here :-)

Thanks for the report! I think this commit should fix it:
https://gitlab.com/samba-team/devel/samba/-/commit/9c3aef25b1d92ea94d7400=
d8e4fab176cdb83187

Can you please test it?

Thanks!
metze


--BKsuwisNOEntnAtQll5nfRx7o93JwXr9e--

--LATy0WxD4qo5mX8rcv7xbID1e4qJXjg5b
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmDexYAACgkQDbX1YShp
vVYBhA//T9f0KiaFrGeLLaaGECksj5izDAOJCg0/58l8mLsiNIpoQ20PS5CUG2Ky
iLbSpQTN91mnVc8MbWu99WiyRWp3ugA9YZUuUxmVA5iSeNSh3PV2FaGkEUMTolC5
9m3CJunpNranzhuwdFYOMTcpbEHm411VywAv/7hb5o5lpfS+i2uD0gVtDL99S+Uq
84a/7OUDAFiK3BJlB1J+qTyAGB1MjAkEYlMR8bHv4MoTe3Meb78YeT6vv1nd4mtf
Bjf9LvFyItrE/YXjDANFW0bKZHxG15578wacUbNeIqjzgKxZ8+vjuVJDmmXMgLPk
EmOAJEWXd2ISwpp8IyVcZu8AU1ywvbNFszHFEZPCIaxUT5EGaJzLz+RuJklFMZgV
gVvrc9MBqBR+7IMmjQf2Shu5mbqUbn8+yTGtWx6NhoWuhTm25sixfnWU6LxGs8XU
wpVne/Q4rXbfR11eiIsP1/9fcZyl/eyDF7Ze00U8RbVSAB2vt9nIsmNtPtdpbcj3
lJInRRhq+93JMYtjg0Qal5Vy4wVtohhvDXl3v5WjhG4+H0ljEtF6B9RbYtuuN4Pl
Y/VsyIPEJJrey5XeLozg9e6Z0KqAj1RMHaIIpoCpjn92gtOEEtXP6vjlmnaQxARI
AY+LjpolSanZRZW870kZye2FjZes7dnfXesA3cgleGi9BEV46Jg=
=CPRj
-----END PGP SIGNATURE-----

--LATy0WxD4qo5mX8rcv7xbID1e4qJXjg5b--

