Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F1D3DDB81
	for <lists+samba-technical@lfdr.de>; Mon,  2 Aug 2021 16:50:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dyNn/+ZEqxA5nMEdFnnJPvXZwBmcVr6Mxqmaf5Bly5Q=; b=lQOzL3VAscub6eENhqMvpnFHA7
	AUxS1Yyez9PFAm/SFvcsm+vIpLX5CPpsfN2LwGHHNwRVTMUp/28K9/poWrTdsjmt0E8CR3+pTQBju
	8a2biWC9G97bE/cXGZyAgPSnktMZvyOXSQSjLrCMfvQSchXktmESWB2LJpMn2i2bC7Nm9IxJ3BEYw
	1FaVcK0p6eYsFr2JVzxi0F58FsVKTpgDT4nTfbUNPd4UVXHim4FXHY3ZZ7m0FffARA9tCX3Gt2/Se
	qbv+wjvsdc0DsQEIXUPtkMBKj7wSx2NA/J8rY2DQNdfLm9xZJ1fAp9NEbxn4Rw3iLpCmHAN1nqAtP
	SivsatsQ==;
Received: from ip6-localhost ([::1]:19198 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mAZGU-003wqM-Kj; Mon, 02 Aug 2021 14:50:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25208) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mAZGM-003wqD-S9
 for samba-technical@lists.samba.org; Mon, 02 Aug 2021 14:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:To:From;
 bh=dyNn/+ZEqxA5nMEdFnnJPvXZwBmcVr6Mxqmaf5Bly5Q=; b=2t05xjDTuGVX1SA4RCEqjocc3p
 +ovVMDYDn/IbIDh5xwp7P37Ql+QuY9bIgY4pw03tCVY/h4wRgJZF7YHOPQT5c3lWuS3TwS6ILa9Cb
 QDUrr/fArj9tAS3t09WAiqhq0D/2ge88ZN5K6HFJvex3naDzB2IjtvLlS8krTETgaZ9vJH/hKwi8P
 Kg/LN14tYGvvq+VW+7kx/wfdZhIvphyp6IuKrABE/R9Gw1qGx9F8xjmHgTRpCAET5Sji2bzgDTXsx
 icpM1Yqsz4vrg4CTdy0UoxgR9IS3mjxt8jDvfdxheAGN46dPNOzMsxVJPsggYNx+gp7mP7BHwrIXz
 qHEAukP2jgFtvsVa/g4ohpI+vd7p8xFrmdaJCWpX7WgYFIV9SjR4JBMvM+VuFivgIvP8/1RwfrCfJ
 lc1Qdy3PABW+YDd/jmt+9y19zdMof/+YJk3DOhYWmTKDAN1sfex84h9EPErJKFI6YvpVlvG2grsrD
 H8iXWV2lLSya4galouTZ1tqy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mAZGM-000Eoy-1C; Mon, 02 Aug 2021 14:49:54 +0000
To: Greg Hudson <ghudson@mit.edu>, Nico Williams <nico@cryptonector.com>
References: <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
 <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
 <20191122224526.GA28614@localhost>
 <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>
 <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
 <3d693bdd-9a4c-7135-318e-593e18e52cd0@mit.edu>
 <9062428f-f26d-4f10-b71f-f54464df2ff4@samba.org>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
Message-ID: <c388e3f9-bf85-8ffd-3640-b27e0552a96a@samba.org>
Date: Mon, 2 Aug 2021 16:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9062428f-f26d-4f10-b71f-f54464df2ff4@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="i9CvRT2uIYCtTDU3c3fdsuq14xeYAnYJj"
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
Cc: kitten@ietf.org, Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--i9CvRT2uIYCtTDU3c3fdsuq14xeYAnYJj
Content-Type: multipart/mixed; boundary="GP2uJ8NdENUILjz7eoS7M5T34ytx8zZ1H";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Greg Hudson <ghudson@mit.edu>, Nico Williams <nico@cryptonector.com>
Cc: kitten@ietf.org, Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>
Message-ID: <c388e3f9-bf85-8ffd-3640-b27e0552a96a@samba.org>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
References: <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
 <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
 <20191122224526.GA28614@localhost>
 <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>
 <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
 <3d693bdd-9a4c-7135-318e-593e18e52cd0@mit.edu>
 <9062428f-f26d-4f10-b71f-f54464df2ff4@samba.org>
In-Reply-To: <9062428f-f26d-4f10-b71f-f54464df2ff4@samba.org>

--GP2uJ8NdENUILjz7eoS7M5T34ytx8zZ1H
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

due to customer requests I'm trying to resume the discussion
about ways to disable the transited checks in gss_accept_sec_context()
when we know we're in an active directory situation and rely on
the [K]DCs (of our primary domain) to check the cross-realm topology
base on their knowledge of the trust topology.

To summarize the discussion we had active directory DCs do transited
checking (even without a PAC) and fails to issue service tickets
if the check fails, so any service ticket is already checked,
but without TKT_FLG_TRANSIT_POLICY_CHECKED being added to the
ticket.

As only the [K]DCs have the full picture of the trust topology,
we need ways to implicitly get the behavior we would get
if TKT_FLG_TRANSIT_POLICY_CHECKED would be set.

The related bug is:
https://bugzilla.samba.org/show_bug.cgi?id=3D12907
("pam_winbind with krb5_auth or wbinfo -K doesn't work for users of trust=
ed
domains with more than 1 hop between server and user realm")
It only has references to the past discussion and related bugs,
which also need to alter the gss_accept_sec_context() behavior.

As a start we have the following basic call sequence:

	gss_cred_id_t acceptor_creds =3D GSS_C_NO_CREDENTIAL;
	gss_ctx_id_t context_handle =3D GSS_C_NO_CONTEXT;
	gss_key_value_element_desc keytab_element =3D {
		.key =3D "keytab",
		.value =3D "FILE:/path/to/keytab",
	};
	gss_key_value_set_desc cred_store =3D {
		.elements =3D &keytab_element,
		.count =3D 1,
	};

	gss_acquire_cred_from(..., &acceptor_creds, &cred_store, ...)

	gss_accept_sec_context(..., &context_handle, acceptor_creds,...);

So we need to a way pass KRB5_VERIFY_AP_REQ_NO_TRANSITED_CHECK to
krb5_decrypt_ticket() used deep in gss_accept_sec_context().

The initial solution I proposed was:

	gss_set_cred_option(acceptor_creds, GSS_KRB5_CRED_NO_TRANSIT_CHECK_X)

which would be called between gss_acquire_cred_from() and
gss_accept_sec_context().

As GSS_KRB5_CRED_NO_CI_FLAGS_X is already using the same way
to alter gss_init_sec_context(), I thought it would be the natural
way to implement GSS_KRB5_CRED_NO_TRANSIT_CHECK_X.

But it seems gss_set_cred_option() is not accepted because it's
a deprecated.

The following alternatives would be able to solve the problem:

1. An additional cred_store element could be passed to
   gss_acquire_cred_from() in order to set the
   GSS_CF_NO_TRANSIT_CHECK flag on acceptor_creds

2. I think someone had the idea of using gss_set_sec_context_option()

   In theory this would be the perfect way as we want to alter the
   behavior of gss_accept_sec_context(), but this gets GSS_C_NO_CONTEXT
   in the first iteration, so we don't have a context to
   pass to gss_set_sec_context_option().

   At least in heimdal gss_set_sec_context_option() seems
   to work with GSS_C_NO_CONTEXT and would alter some global state.
   E.g. _gsskrb5_set_sec_context_option() supports things like
   GSS_KRB5_SET_DEFAULT_REALM_X, GSS_KRB5_SET_DNS_CANONICALIZE_X
   GSS_KRB5_REGISTER_ACCEPTOR_IDENTITY_X and more which seems to
   work on a per thread global krb5_context. These are
   also available via special functions like gsskrb5_set_dns_canonicalize=
()
   or gsskrb5_register_acceptor_identity().

   krb5_gss_set_sec_context_option() in MIT doesn't support anything
   at the monent and kg_accept_krb5() doesn't seem to operate on
   a global krb5_context.

3. Implement a krb5.conf option similar to "dns_canonicalize_hostname"
   or "ignore_acceptor_hostname" from MIT

   I think this would be a good addition in order to allow admins
   to specify "disable_transit_check =3D true" and get it also
   for unaware applications.

   But I think for an application that's aware of the fact that
   it never wants any transit checking in gss_accept_sec_context()
   we should better have an api to disable it instead of playing
   games with the "KRB5_CONFIG" environment variable.

It would be really great if we could find a way forward with this,
I typically point customers to the related branches (in most
cases using the heimdal version shipped in Samba), but
they are really unhappy with that situation and asked
me to trigger the discussion again in order to get a solution
that is acceptable in the upstream projects (Heimdal, MIT and Samba)
and would be available by default in distributions.

Nico it would be nice to get some constructive feedback from you,
as you're the one blocking the current patchsets.

Thanks in advance for any possible help!
metze


Am 24.01.20 um 19:49 schrieb Stefan Metzmacher:
> Hi Greg,
>=20
>> On 1/23/20 6:25 AM, Stefan Metzmacher wrote:
>>> it would be great if we could make some progress here...
>>
>> Does this need to be an application flag, or can it be in the krb5.con=
f
>> realm configuration?  Presumably people are currently working around
>> this by setting [capaths] on the server; a realm variable would simpli=
fy
>> this workaround by not requiring specific knowledge of the domain geom=
etry.
>>
>> I reviewed the thread, and it sounds like the current understanding is=

>> that AD applies a transited check (of sorts) to cross-realm tickets, b=
ut
>>  doesn't say so by setting the transit-policy-checked flag in the
>> ticket.=20
>=20
> Exactly.
>=20
>> From the upstream point of view the server's realm
>> configuration is in a better position to know that the realm is an AD
>> realm than the server application; perhaps that is not true from Samba=
's
>> point of view, but I thought I would check.
>=20
> In Samba we know that we're joined to an AD domain
> and then we want to force disabling the transited check
> for gss_accept_sec_context().
>=20
> For Samba as AD DC we want also want to disable this for
> krb5_rd_req_decoded in the KDC too.
>=20
> A krb5.conf option would also be good in order to support
> non-samba services in AD-Domains. But the c library should also
> support changing it at runtime.
>=20
> metze
>=20
>=20
> _______________________________________________
> krbdev mailing list             krbdev@mit.edu
> https://mailman.mit.edu/mailman/listinfo/krbdev
>=20



--GP2uJ8NdENUILjz7eoS7M5T34ytx8zZ1H--

--i9CvRT2uIYCtTDU3c3fdsuq14xeYAnYJj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmEIBgcACgkQDbX1YShp
vVZYkw//S88bkxOmwFBd9/1QHEdBA3dw5/mRu4YGyniPSPORVnQtqFjGt8rH/bLh
8THLbOPF+lonM0YMEF955fWDGOvgyEi3wnIBYJTeApM0roDC0F4KZDY5fKOqvwDt
vhCks+nAYBRvU3k+gdL14UaRA3XPWLC9wgpl62lve6yavW0h7cLWI1NyMGCzoZqj
LcPI/3gJ3XzvYPBoOQjutonfhxSP5zm71f6gLcRsvmuXXGk6vjqb8xvysUUBhD3C
dO82CCQ9woHMG6pdqdWrwgZwGAc/X2jfrDpu1zt84UZbwvniIHEL6e8hhnKWuVC0
fztnL3cfWB7fBU68CdAkDS7qG2dK6V3G2pu4YtSLKb+BsJndjmO/qEIKNsuWZJsU
xriDwIsBC8zeCDKomNqk6VPTX3j1DMX4qXkDZZMb2GxONH99DijeG+SLIqVMfn1r
TIlkGOybPTaIwj+SMQr+tzWW+D3TJuRgxWUjzP6u7fINOMzFxByTVaUZ/WoFuN/9
JCi7X2Mu9es1wMk1w84ZzrTmV3I2XsPfIgBWQQBsrvrbEbCvk8szlbI/ytyVpUCu
GPAHAwkzXfWjQdc5GtKPq9Hl5W0dVDaBfu3CaxN+yA0HWwMk3gsvA7zRJdeLBVK9
8LiRpReIzB+id+g73LuHsSjYb116JClpYGImJUxCOG8MeoJp9Zs=
=IAxw
-----END PGP SIGNATURE-----

--i9CvRT2uIYCtTDU3c3fdsuq14xeYAnYJj--

