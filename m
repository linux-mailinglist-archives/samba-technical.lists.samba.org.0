Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 136202A6B47
	for <lists+samba-technical@lfdr.de>; Wed,  4 Nov 2020 18:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=z7Ao3c9bUXO7+bf6c/CoCvVtknmW9s6KiYSOh4CgzHw=; b=xKYk69FqqYP+1NURZdLy3bFnqq
	xmtCiz+cCe/lKDmuetQkg9Jsuw2LXTjKsfp4SpzY7Xg17yV3MBZyZ9VX4cAmiIoA4SaJyfv1hHMQW
	v3VrSD8wj2yV+iJd0HfPmhpyYhz1Jl5rTqwsujatOQ7OJQBl9KvJwfU664LtKqeyLhcHGxLEQaIo+
	0U+toFpueqkEqpaP4BIcnPfF368DEh+v6KvAznPeVG3KZam07ka58l119QQ1uMzOnvVMm8lOO52Jz
	ZCF/S2SBdLScbezUk3MeRs1Xa/093SAeThT0NSYjABmExelal1HDF1jbzj29hRRoqcAWiplJAADBU
	6TRdr8qg==;
Received: from ip6-localhost ([::1]:49442 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kaM92-00HTKf-SD; Wed, 04 Nov 2020 17:00:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51376) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaM8l-00HTKN-6r; Wed, 04 Nov 2020 17:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=z7Ao3c9bUXO7+bf6c/CoCvVtknmW9s6KiYSOh4CgzHw=; b=rJIS4CbwLHTrZURyD9RVkdVPMQ
 AURBHVDc07ZDKX4OpwOp7DBOZBVefSF/afSjtut+DHV3j8k1RxvRBtbR2Nh3XgPmtyoffzxzvwGq9
 roC5COsUvj/rL+wmJ2pfdYTlpkmtpxnBwe+Y1i/JeEHELgzSXsVZnfSkLqIG37q8TIvBCw/OP2K/D
 W+mJCQLgpnqNBxnbP25Xc3wVpgEY2uobNq0vfd4M9NRQXQUE4C0mbE6MucmGduRjA1e0gHCTULBjt
 NNJQnOGPALTXHgCiA6XzoE7k6LwW//Kv0RKnAPVr7/2bqpcsaE4moFfJdOxk+NQ3Vr63Cxp5RVgCD
 Yhxi1GIq9xYtCwAGKkquxrlm6JfI94TCvqiQr45PzrlDOqJVw1K+YfplvHhVoNmnDG/LjpWj1tE+L
 4/WnIt6ua0x3csW/T/BXKfZpvWNkr9sQ9TPZLeXvxku5mzVGrolE/MQZorO7lWbhqy/YOPzMg0xQf
 bYBzxBEegkJblgP3bS7I6ux6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaM8j-0000OC-AR; Wed, 04 Nov 2020 17:00:05 +0000
To: samba-technical@lists.samba.org, samba-cvs@lists.samba.org,
 Alexander Bokovoy <ab@samba.org>, Andreas Schneider <asn@samba.org>
References: <20201104162403.E338C14012A@sn.samba.org>
Subject: cli_credentials_parse_name... (Re: [SCM] Samba Shared Repository -
 branch master updated)
Message-ID: <4a335431-8128-36d8-5d6c-463cc7632c66@samba.org>
Date: Wed, 4 Nov 2020 17:59:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104162403.E338C14012A@sn.samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="mHDeICWF4Z6AJfDlOFY99E5nP6VTi6eOK"
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
--mHDeICWF4Z6AJfDlOFY99E5nP6VTi6eOK
Content-Type: multipart/mixed; boundary="ZoSj0i62psBXgN5bE5qemNADElehWhmbB";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: samba-technical@lists.samba.org, samba-cvs@lists.samba.org,
 Alexander Bokovoy <ab@samba.org>, Andreas Schneider <asn@samba.org>
Message-ID: <4a335431-8128-36d8-5d6c-463cc7632c66@samba.org>
Subject: cli_credentials_parse_name... (Re: [SCM] Samba Shared Repository -
 branch master updated)
References: <20201104162403.E338C14012A@sn.samba.org>
In-Reply-To: <20201104162403.E338C14012A@sn.samba.org>

--ZoSj0i62psBXgN5bE5qemNADElehWhmbB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 04.11.20 um 17:24 schrieb Alexander Bokovoy:
> The branch, master has been updated
>        via  f9016912098 lookup_name: allow lookup for own realm
>        via  00f4262ed0b cli_credentials: add a helper to parse user or =
group names
>        via  eb0474d27ba cli_credentials_parse_string: fix parsing of pr=
incipals
>       from  a1b021200e3 selftest: add test for new "samba-tool user unl=
ock" command
>=20
> https://git.samba.org/?p=3Dsamba.git;a=3Dshortlog;h=3Dmaster
>=20
>=20
> - Log -----------------------------------------------------------------=

> commit f901691209867b32c2d7c5c9274eee196f541654
> Author: Alexander Bokovoy <ab@samba.org>
> Date:   Wed Nov 4 14:21:33 2020 +0200
>=20
>     lookup_name: allow lookup for own realm
>    =20
>     When using a security tab in Windows Explorer, a lookup over a trus=
ted
>     forest might come as realm\name instead of NetBIOS domain name:
>    =20
>     -------------------------------------------------------------------=
-
>     [2020/01/13 11:12:39.859134,  1, pid=3D33253, effective(1732401004,=
 1732401004), real(1732401004, 0), class=3Drpc_parse] ../../librpc/ndr/nd=
r.c:471(ndr_print_function_debug)
>            lsa_LookupNames3: struct lsa_LookupNames3
>               in: struct lsa_LookupNames3
>                   handle                   : *
>                       handle: struct policy_handle
>                           handle_type              : 0x00000000 (0)
>                           uuid                     : 0000000e-0000-0000=
-1c5e-a750e5810000
>                   num_names                : 0x00000001 (1)
>                   names: ARRAY(1)
>                       names: struct lsa_String
>                           length                   : 0x001e (30)
>                           size                     : 0x0020 (32)
>                           string                   : *
>                               string                   : 'ipa.test\admi=
ns'
>                   sids                     : *
>                       sids: struct lsa_TransSidArray3
>                           count                    : 0x00000000 (0)
>                           sids                     : NULL
>                   level                    : LSA_LOOKUP_NAMES_UPLEVEL_T=
RUSTS_ONLY2 (6)
>                   count                    : *
>                       count                    : 0x00000000 (0)
>                   lookup_options           : LSA_LOOKUP_OPTION_SEARCH_I=
SOLATED_NAMES (0)
>                   client_revision          : LSA_CLIENT_REVISION_2 (2)
>
> ...
>
> diff --git a/auth/credentials/tests/test_creds.c b/auth/credentials/tes=
ts/test_creds.c
> index d2d3d30d73d..38550d6ecf9 100644
> --- a/auth/credentials/tests/test_creds.c
> +++ b/auth/credentials/tests/test_creds.c
> @@ -187,7 +187,7 @@ static void torture_creds_parse_string(void **state=
)
>  	assert_string_equal(creds->domain, "");
>  	assert_int_equal(creds->domain_obtained, CRED_SPECIFIED);
> =20
> -	assert_string_equal(creds->username, "wurst@brot.realm");
> +	assert_string_equal(creds->username, "wurst");

I'm sorry but this is wrong!
I'm wondering why this wasn't covered by any high level test.

This needs to result in domain=3D"" and username=3D"wurst@brot.realm"
and that's exactly what we need to use for NTLMSSP.
Also note that "brot.realm" may not be a realm and "wurst" may not
be a sAMAccountName. A userPrincipalName can be anything@anydomain-of-msD=
S-SPNSuffixes.

I fear we need to revert these changes.
=46rom the merge request (https://gitlab.com/samba-team/samba/-/merge_req=
uests/1658)
I didn't really look at the whole patchset (with behavior change)
I only focused on CRED_NO_PASSWORD.

I think we need to logic we have in wb_irpc_lsa_LookupNames4_call() and/o=
r parse_domain_user() here.

metze


--ZoSj0i62psBXgN5bE5qemNADElehWhmbB--

--mHDeICWF4Z6AJfDlOFY99E5nP6VTi6eOK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl+i3gwACgkQDbX1YShp
vVZDBhAAoDkYjY9aTrbaHY/T80y5yS/ajGxSdZQ1e8eLIBGUByh+KJ0vND1azU8D
JQQN9Bax2R+tGUJSiWRF0iotT4rs2ZLbsNb7PRbNgjNIBDT45hqEz//JrYWKIy1Z
zOg4rXfNSmCvdgQMG0UEwXTfkkoHYpM2iYeq55QuyRFwsMVPDOkzJo6SUzEzr2up
TImAQOYF1r0e9L5yGQZrHKEHbmlGRgwp4feC1rQB/UYHObZj7nAUoS7Ga1aiUBUp
KrGbxRoksTUm8LJoqJYkizGnuWS1E2iu7KdoN3CrVJyCk7EQbBRR0Pv5NdZStB2e
1ANvIzBAh4bsPCj1KuqoMfxJgu4KC5V7LOeaQ1Sx+nVN3KMuHQx0DFg1TPy8YOvH
WCU1qWvldaYIYnTp/BYrJ8BHI2L+VJLccFOvscQ8yLNHP5my//2m3r/RlFHR/kvL
GLVEB/zvj94HcKiEgPvrenZWlJavndiPZfYzebdnXUYsSt+9gNlh7Sguea3Xvhw2
LKBhc7qMnfnfVmsE6G/X71r0x089Kx9cSfmdcvbIShktvlwzOf04awUdcs/63iGW
XM3gwSYrRug1QfmEPPuz0F1FhtQvNIq/9P05AN6nIMIRhmjRnY3Sz4NLejZH7VjJ
OQsJ2vS7h2vUKD+ODEZa0mab9kG69iw57eICzjBU1ePcsMsowSY=
=agV+
-----END PGP SIGNATURE-----

--mHDeICWF4Z6AJfDlOFY99E5nP6VTi6eOK--

