Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 952E53F0462
	for <lists+samba-technical@lfdr.de>; Wed, 18 Aug 2021 15:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=nJ8ZUocqrMYi1Q38y0gjajKOP8tAqNNOoG14e8Z9VjY=; b=b0D0i7JfJquge4acLBTookNAzo
	WxhbswzJ3OuoCxW9wQzUJrfwzGhXCkurfKrxNzQfzl8r6l1rIPvEqSqKHLgpEbLdW8TIRjS3vfz4U
	MOxDb3SjUZxtE0r6c7WhRYEk5hT8s8u5jJB+j5TMQBguB/mxxOkHUqgHfMtFSPTwI9jSey/1085+t
	L51BaXxzSyQ/kTqDtB8dtuTes6zOZHlzN75jWSHlJC24PhNxmQUZ10OFKrtKc/PU+DWTUxhomWIIj
	bG8EwU31IE5a3xVAYqzPAabEQDzOhBjGAhh9DVzB/JomQauDYB2uPQHXYBqB30TqZerHmSOYeR0e7
	uJdfI2Vg==;
Received: from ip6-localhost ([::1]:29572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mGLLn-007T7b-Hw; Wed, 18 Aug 2021 13:11:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64502) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mGLLf-007T7S-Nx
 for samba-technical@lists.samba.org; Wed, 18 Aug 2021 13:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=nJ8ZUocqrMYi1Q38y0gjajKOP8tAqNNOoG14e8Z9VjY=; b=nx370XoEyXqDgUeo2cuI9CARzd
 got6e7Oj/Y/KYofzZ2KkP8jr3ujhIz7jYtghWJ+AmdAFP+545sEfK4t8w8cLMrfEi8NtzKg3ywTH6
 oeqdT4kAcGoNS0XW3tu5CV+RNkt+B+JCvJQ/mgF9txhelbRh+nLohV5DRKiLYJc1lv9r+uBD443fP
 J09JwGTfgoO/ly6AABXpeaGkubt9RCDezklPwmfO94JJOb3Xy79gwUNDjOwOqUjcVSpQYBNf7ErqP
 uxnHfd/ZC/K9rBBTSqHfaudhDHiP5pe8+yEfGdjMM8c675GgOkEkebSKSRnzBFmzRkfrPGJW1bOS9
 t5wGx68wnEfcZwn7HKKsJ6XuFeyGBj9oLN+NampGbm8BQsToEoIqxXCUJavIOdVdrjl6Y9dllwDgu
 P/aww2Bb49v+G+DraksYie2mV7EBmomdLshJlg8ftm2ZmU8Q8/wBHZIl2WZr7Ap6EQ3y29BMOVTdN
 LMRcttlV+gwvKFEQrTfvHE5u;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mGLLe-001v6V-SX; Wed, 18 Aug 2021 13:11:14 +0000
To: Pavel Filipensky <pfilipen@redhat.com>, samba-technical@lists.samba.org
References: <CAEcb10tURuNjrFxj5CrMqQVkaSbU3feRnmp+GDD7S7kD+oHnGg@mail.gmail.com>
Subject: Re: Why the communication between winbindd child and DC is not
 asynchronous?
Message-ID: <43369cfe-75bc-3e48-ca6e-14983e8013ae@samba.org>
Date: Wed, 18 Aug 2021 15:11:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEcb10tURuNjrFxj5CrMqQVkaSbU3feRnmp+GDD7S7kD+oHnGg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0jU5OyRt7nSciqxgxjNslBQ76zEgS8zQA"
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
--0jU5OyRt7nSciqxgxjNslBQ76zEgS8zQA
Content-Type: multipart/mixed; boundary="IT8K6OIRFD0yJF786mn16QpCsX973hdE1";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Pavel Filipensky <pfilipen@redhat.com>, samba-technical@lists.samba.org
Message-ID: <43369cfe-75bc-3e48-ca6e-14983e8013ae@samba.org>
Subject: Re: Why the communication between winbindd child and DC is not
 asynchronous?
References: <CAEcb10tURuNjrFxj5CrMqQVkaSbU3feRnmp+GDD7S7kD+oHnGg@mail.gmail.com>
In-Reply-To: <CAEcb10tURuNjrFxj5CrMqQVkaSbU3feRnmp+GDD7S7kD+oHnGg@mail.gmail.com>

--IT8K6OIRFD0yJF786mn16QpCsX973hdE1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Hi Pavel,

> I have noticed "winbindd: domain child [ADDOMAIN]" is able to start
> processing of the next incoming request from the main winbindd only aft=
er
> the response from the DC is received. This was reproduced in
> ad_member_idmap_rid selftest environment via running:
>=20
> id ADDOMAIN/user1 & id ADDOMAIN/user2 & id ADDOMAIN/user3 &
>
> To make the sequence of events clearly visible, the DC processing is ma=
de
> slower using 1 sec delay before each incoming request is started - usin=
g
> gdb breakpoint:

That's exactly the reason why we have winbindd children at all, the logic=

within each child is not async at all. And we use the multiple children
in order to be at least async in the parent.

> I assume that this is an unwanted situation, since the purpose of teven=
t
> library is to achieve asynchronous communication, or? Can we get rid of=
 the
> inner tevent loop which starts in dcerpc_binding_handle_call()? I am
> wondering what is this TODO comment (from commit 4030bc9b) about:
>=20
> 528 NTSTATUS dcerpc_binding_handle_call(struct dcerpc_binding_handle *h=
,
>=20
> ...
> 541 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7/ * TODO: allow onl=
y one sync call

We should actually enforce dcerpc_binding_handle_call() to be not recursi=
ve.
In some areas (at least in the past) we had the usage of *nested* event l=
oops,
where tevent_loop_once() is called recursively more than once on the same=
 stack
on the same tevent_context structure, which leads to unpredictable result=
s.
But I think we need to avoid the usage of tevent_loop_allow_nesting() and=

prove that everything still works, which is a very hard task to do.

It would be nice to have everything async and tevent_req based in the par=
ent
and avoid the children completey, but the logic within the children is of=
ten
very complex and it would be a lot of work to rewrite it to be completely=

tevent_req based.

metze


--IT8K6OIRFD0yJF786mn16QpCsX973hdE1--

--0jU5OyRt7nSciqxgxjNslBQ76zEgS8zQA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmEdBu0ACgkQDbX1YShp
vVZUtw/+INKyn4PA5/fu5XZP5Ztsm92mIhuhTC4nsGKNOEk3b7zw3O6DSF7i87rK
9pChRAigh1Kjhf9ANLxoRQ0v+y0E+HA2HXQ1zvfz3tyXERIoTkA/nbs8hhkGePk6
u7pMpjAZLv1ynI8M578YsfmSUdfJLX0B6OJkvkBWgN+16U/qJUe3r0n3cpE+0Yb9
YB3hNnKKEWbMD8m9lgwxNWAFXKkCL4z/GcyC/RUJUP05ZYFLHtip8n/sE6rB8Osr
2yi9qMxCVV9EHOc/lvnabaxROo4KkfT3lsxLyHYvnLxqcAr3vGJctCfxociEGAfL
rXwEgoOTFmDQiBFx0DM5W/MiMfCtSwXS0xif3gmEaZgmprXqLZzydKl1Kf4lkBqI
J/FC4sRHE9e90ncFBWnCR9M39fPVdWcI5Dr6IsGOE+TCyMjyWsZpPVMYZPwLn4yP
YSQguxUNWMyPb6g4uBUiF8voRCM/5nkcE9VzdQhFqGG1ELrKd0NIN/Ea6w0N3nVz
zQzkg88GemTGaABfQn/ZcUrewvyWDM0rds/IWS1F4LMZYaL7wf0RdUrkfH1Vn2Q6
8anlkWn3MDuksRCqhdjAFkGhWEzbPmOq6W3fnmbeRv7dI/1VMG9cglJr2BRgCNEA
VuJEQyXFUVQYofeXTV8IMj2MqmwBBX6n537RiVrYHIegmGCcQDs=
=RMog
-----END PGP SIGNATURE-----

--0jU5OyRt7nSciqxgxjNslBQ76zEgS8zQA--

