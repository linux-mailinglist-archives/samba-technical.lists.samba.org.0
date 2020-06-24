Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC97207112
	for <lists+samba-technical@lfdr.de>; Wed, 24 Jun 2020 12:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=k8Pb6OVvpIvGFnsqX8we3hgQ1J+rLGLi8K/m6cftT1g=; b=dvk6VzpWbqozRwsAX7eQgGX9fM
	KMrgf3BHe3kpP3iy82vO6N7MQANQZUBRjClBE1rkNmnR6ESdtFJnihAvTTX+wf18/0I8f49Ft4mg2
	tdxhvUEny2xC6l+y9dS/Yl/ep/nMJgl5ehniQiHbG0a86/rux1hLDLbAkcpXzKtIsEAtPDJLL4TfC
	BCbeBQKf8lG3ERn+5ZP6sz0CDzXGwzOlCFg8b6sYPZ/c9oqliWNb8Ahftzmll2h5ajOvweCRnlNZA
	+10fM6huVqK1sObiPl44ChXIWyLb4vzKPmcA4RG5pbtb+F78CbvYlyidTLhLRspXV2ikQ+nTRq/EE
	EPJww13Q==;
Received: from localhost ([::1]:34604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jo2YC-0028E2-WD; Wed, 24 Jun 2020 10:22:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56970) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jo2Y6-0028Dv-4k
 for samba-technical@lists.samba.org; Wed, 24 Jun 2020 10:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=k8Pb6OVvpIvGFnsqX8we3hgQ1J+rLGLi8K/m6cftT1g=; b=g3kLx/e4vKHeoB2Eo6uG16AwLW
 TKXtsj0/Flvd6I3xjGukgxX/RTyyGNfQZC20Ro+fmE57TzhWGKYPotbEKNeX/UMB99qHzF+RK0A48
 DeIEiaeJC1tClcr1ZqWDT8vTgkIEPE7DHZp+OXJvFRZXJQS380NHApL89W0zd/BKbrHCqldEW3dgW
 lTrZS9cJOKc90oDGkVCaTdg4RJo8slZUmILz5SyG/+ZHvGzuUfLzdMa2bkBB7y75kdLPs2y+HWgWg
 FOtJLKF5iXGeQum+COWAWKa8nOoNvErTVSMoeo1Ou9KyuofBjW1nMps8623AhQmHWxvVKUaJYpfiL
 bYhpiefGxhF+hG32519j3qGjElyCbjiPC1oCDRXSoKC/Td78WdRfrNzBXB5idn/utvpqGbiMinINa
 32xmkQDO0ZEsNjEIO3MbPBy5uE9ek0EH6zt4A2KTSXAgUDiooaLP5gMKkwEh8/Fc4j/pTUXabr+8x
 AOV0AAg0zkHzIvEw8kXnHRcc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jo2Y4-0006FR-BU; Wed, 24 Jun 2020 10:22:32 +0000
To: Andrew Bartlett <abartlet@samba.org>, Christof Schmitt <cs@samba.org>,
 Jeremy Allison <jra@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
 <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
Message-ID: <9d28a25c-0e2a-3e69-d305-4c886aef84a1@samba.org>
Date: Wed, 24 Jun 2020 12:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="zvQus0aL1xQTSYY0NzFRmv9TMKEyb1Q1k"
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
Cc: swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zvQus0aL1xQTSYY0NzFRmv9TMKEyb1Q1k
Content-Type: multipart/mixed; boundary="toFsGOdrG0UpnzFiiOkUJ2BYQpaKip60O";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>, Christof Schmitt <cs@samba.org>,
 Jeremy Allison <jra@samba.org>
Cc: swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <9d28a25c-0e2a-3e69-d305-4c886aef84a1@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
 <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
In-Reply-To: <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>

--toFsGOdrG0UpnzFiiOkUJ2BYQpaKip60O
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Am 25.05.20 um 11:44 schrieb Andrew Bartlett:
> Thanks metze for your reply,
>=20
> There is much we agree on, and other things that we have different
> perspectives on here. =20
>=20
> My opening thought is that in this, I recognise that I need to be
> careful what I wish for.  Broad scale lift-and-shift operations have
> been popular in Samba of late, and this is another of them in a way.
>=20
> At the start, they appear very simple, but as noted here there is much
> complexity in the end result, and a very risky transition that needs to=

> be done by experienced developers and reviewed incredibly carefully.
>=20
> Even if we didn't have my concerns about the API and implementation of
> tldap, as you note in (3) below the "ldap ssl ads" parameter (which is
> used enough that we have a WIP patch set to fix it for channel
> bindings) and "client ldap sasl wrapping" parameter are not
> implemented.

Yes, these are required for a wider usage of tldap.

> And I do have concerns about tldap.  My view since the inception, which=

> I think I expressed - I've not checked the archives - is that tldap
> should:
>  * Use the struct ldb_request, struct ldb_parse_tree, struct ldb_dn,
> struct ldb_message and the related structures.  Not because they are
> divinely inspired but because they enable a suite of utility functions
> that will, as the library becomes mature, be duplicated (like dumping
> to LDIF, parsing extended DNs, extracting a GUID etc).

Here I disagree, the low level LDAP client API really doesn't need these!=


There can be helpers to construct these on top. In order to
implement/convert ldb_ildap to tldap. Or let other code make use
of the existing and useful utility functions.

> I've re-checked the code more recently, and I'm sorry to see so much
> inline ASN.1 parsing.  It really should re-use ldap_message.c for the
> ASN.1 parsing, so the ASN.1 encode and decode can be tested (see the
> recent tests added in test_ldap_message) and fuzzed (fuzz_ldap_decode).=


I think we can find ways to have just just one code path for the ASN.1
part. I'm sure it's possible to refactor or maybe split
ldap_message.c into client and server parts and have the result still
fuzzed. In my view it's just a detail on how we'll do that in the end,
but the key is to have only one code path for encoding/decoding.

> Why do I raise this again?  Because as noted, lift and shift is risky. =

> So if it is ever to be done, it should be done while tldap supports
> only one small, optional winbind module.
>=20
> That is why I appreciate but don't accept the "but this is not
> something new" (i.e. it is already in use) argument.  This is is a
> significant new use that makes it harder and much less likely that
> tldap will ever be overhauled and suggests that tldap is already the
> "future ideal" API and implementation.
>=20
> Of course I now wish I had raised these objections again in 2015, but
> we both know that would not have been a good idea.=20
>=20
> But here in 2020 I would be much less opposed to winbindd using tldap
> directly if these matters were addressed, which is why I tried to leave=

> this as a possible way forward in my original mail.  It would mean that=

> tldap would just be a different API to a common LDAP client lib, not an=

> standalone creature itself.=20
>=20
> But whatever we do, it must not become an independent, fully featured,
> LDAP client stack, it must complement and integrate with what we have. =


I'd say that it should become such a independent, fully featured,
LDAP client stack!

But it should be the only one used for AD related
access and everything else should be build on top.

So that it's not a 'separate independent' stack,
which I hope is your main concern here.

I hope we can agree and these key points to have:

- We should minimize the code paths to encode/decode LDAP pdu's.

- AD related client code should only use the tldap API,
  which does not have a API dependencies to LDB nor OpenLDAP.
  Currently we have ldb_ildap, libads, and tldap.
  We should rewrite ldb_ildap and libads to use tldap.

- We have also smbldap, but it's not used for AD related things,
  only for pdb_ldap and related things like idmap_ldap, net_sam.c.
  It would be possible to base smbldap or its consumers on tldap,
  but the danger to introduce regressions seems to high
  and we better leave it untouched.

In order to get there I'd propose the following steps:

1. Add missing features to tldap, e.g. tls support and
   similar things like using "client ldap sasl wrapping"
   and other options, which are use by source4/libcli/ldap/ and
   source3/libads/ and using gensec_update_send/recv

2. Refactor/consolidate the ASN.1 handling of ldap_message.c
   and tldap.c

3. Avoid using source4/libcli/ldap/ in torture tests.
   Most tests already use the ldb API for ldap tests,
   we can keep those untouched. The tests in
   source4/torture/ldap/{basic,common}.c can be removed
   or replaced using tldap. We need to test LDAPCompare,
   LDAPAbandon and LDAPUnbind.

4. Rewrite ldb_ildap.c to use the tldap api.

5. libads uses LDAPMessage, but that's an opaque structure
   We could use the following steps to remove it from
   the libads API:
   - define ADSMEssage LDAPMessage and convert all callers
     to ADSMessage.
   - Use 'struct ADSMessage { LDAPMessage *msg; }; and
     make sure everything build and works.
   - Then we can convert libads/ldap.c to tldap.

Note the order is not strict. It may turns out that it's
easier to do 3. + 4. before 2.

I hope this strategy would resolve the deadlock we currently have.

Can you agree on that plan?

If so we can start working on this without running into a deadlock again.=


Thanks!
metze


--toFsGOdrG0UpnzFiiOkUJ2BYQpaKip60O--

--zvQus0aL1xQTSYY0NzFRmv9TMKEyb1Q1k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl7zKWEACgkQDbX1YShp
vVaTIw//Y5tbrBVl6kIkGBtWtxKxxmIxKCeG2NpThxYZ6JeVTc2Yf5gTTVGrzHPq
9PpDde/Zy2jrTbiEjNz8WVNDt65QBkL4WkUSHVELiL5yjVKxUJBApo2D9tb6I4Qj
qYmfLwOZTsav75odCFGzzDXliVoWNmtvNZRx4+aJIACDnGA317yu6sSj3s3CwoVq
k/WMXC9mTCKzUikmBq6xb4NkJTMR2QA+BP4Av59FuBqr0nqBK53Pt36OXJyPslow
sdceQYQ2LfRdxJpTxe0pnwQyg3UMHRiYZV4DXrIxR3D1al+PUL3HflezIHOjuiKq
t+1Drf3QSOpU1TEAwHx/DIMcnRBwO7yfrLyIuJ2jG5KSU5lxu5QfHALFR2Q+TMRV
Xw1tOCV2ChOfLrjNYDtiPp5YQj/dHJ49//+KhNKxciJDqpuAgod7UGFyXZ4dcetu
ZvP6HDK8lLMid+1cxS4+Hf0PXAcWLrU95+6tmoprW9WDbE5CSFz32amavhiQ4pTL
rrEUJmXRVaH4b8TjlQoGt7jiGI2bzJPo81+1Pta5g+bGS5OxCzoWCgARnImQ2Kc2
UzonmpDkVVYGho6ZAbZTp1NUHKuKn4jEYvVGk3E779WiCB8r7AZjeA7R67na4/tR
RaWTDsfR/TTYNzrH8PNzw/up33VspB9Y8mUOH6a9jGeSNk8JmN8=
=Oscv
-----END PGP SIGNATURE-----

--zvQus0aL1xQTSYY0NzFRmv9TMKEyb1Q1k--

