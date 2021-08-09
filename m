Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1DB3E41F0
	for <lists+samba-technical@lfdr.de>; Mon,  9 Aug 2021 11:00:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=CWlIwO0c80xZCxL4sR47eLdNzUc//D/fAJvO2Rzo1mM=; b=nB0eUGYPXjmiMVcgWdY1FxzNx3
	2aPZuxIT4Zw3KuhpGsMlkBzI6fgpXZsFM+OgWcn5Obq3DEK9fR++/wo+AHNFRhh2xtv+pdzSoaXMx
	Q5MMTWwt8yU8gHwdKWLdv8RlFVN1hfjn1drjNx2eARorM/k10VrazOCZLfMtcIQ431SXbsVFxBfPn
	V7vKdvpAf4ixUviSMX6ScuZ/yojLERfCTaitFT/MVVPLaUzowWmu0qfhwC2pBpCGHtZ2/RZMQk5bx
	aJCxbygiZmkdCOGAKPO1wwhTAkAKis5b1AqJM87kA8ISrKWO/L/IySDY9D5OSVtrgEfElhoKR7UIE
	kSWTwT4A==;
Received: from ip6-localhost ([::1]:34992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mD18k-005HsR-WC; Mon, 09 Aug 2021 09:00:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17166) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mD18f-005HsH-8c
 for samba-technical@lists.samba.org; Mon, 09 Aug 2021 09:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=CWlIwO0c80xZCxL4sR47eLdNzUc//D/fAJvO2Rzo1mM=; b=ZcZvhpDEW0VJxt2bcALQq7H3Qz
 30jor+lmmunLonTQvr3knY0k152uw5T3laLkIN5xRirup0tue36ApXDa/hYtyC5qbiQ0TkUUsQgVP
 gOVRPzwO+kepqiEfxXb0VOWokf3owqFYYjPA9sxBXp0cGIZ4fhz+lDIkFW/EErHwFcum8ohXzbn7Y
 yTacELlMhPlvXfiR6/qDfpBeR9jinqN/uVGXTGE7blUmPdVJSxotsMGm2r3FU97vreSA5uaaqVwTQ
 RFNwOPfy6fgsasvbUn4GuLf2r8DMrRAqPTavEatjysve5eah8E8TX5HMYmHAoNV7rRy79jdFfA2U6
 9QWX8KCGfZtJDZ6EnmQpxHaUv5OrMm83GkdCIMbPWN+fzHwcPx440Bp/jXRQmB5UkZI9Fs+KCiB/p
 bSb8I5c9zn2vvTxtsiD5CChj6nWsl6j84zdT7HDgeS4Hv1wtjOXGGySf1WjOGxtZRLnRRAxcHakcG
 uuukzd31MghUWXI3oKgCTJsi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mD18d-000KN9-Br; Mon, 09 Aug 2021 09:00:03 +0000
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
 <c388e3f9-bf85-8ffd-3640-b27e0552a96a@samba.org>
 <276401e2-5d09-29d2-be1b-5e876f49c0eb@mit.edu>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
Message-ID: <22c35d56-cc7b-e3b1-c357-d387f11d9d22@samba.org>
Date: Mon, 9 Aug 2021 10:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <276401e2-5d09-29d2-be1b-5e876f49c0eb@mit.edu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Xp3Yih5Hu6WcbkPjq8hyTMyVwN4ZgedUI"
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
--Xp3Yih5Hu6WcbkPjq8hyTMyVwN4ZgedUI
Content-Type: multipart/mixed; boundary="7BsiALzeUZ4T5C7RAdOICnGuxRazFL8vM";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Greg Hudson <ghudson@mit.edu>, Nico Williams <nico@cryptonector.com>
Cc: kitten@ietf.org, Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>
Message-ID: <22c35d56-cc7b-e3b1-c357-d387f11d9d22@samba.org>
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
 <c388e3f9-bf85-8ffd-3640-b27e0552a96a@samba.org>
 <276401e2-5d09-29d2-be1b-5e876f49c0eb@mit.edu>
In-Reply-To: <276401e2-5d09-29d2-be1b-5e876f49c0eb@mit.edu>

--7BsiALzeUZ4T5C7RAdOICnGuxRazFL8vM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Hi Greg,

> On 8/2/21 10:49 AM, Stefan Metzmacher wrote:
>> To summarize the discussion we had active directory DCs do transited
>> checking (even without a PAC) and fails to issue service tickets
>> if the check fails, so any service ticket is already checked,
>> but without TKT_FLG_TRANSIT_POLICY_CHECKED being added to the
>> ticket.
>=20
> I just want to acknowledge here that we're taking on technical debt
> because the non-conformant party is perceived to be inflexible.
>=20
>> The initial solution I proposed was:
>>
>> 	gss_set_cred_option(acceptor_creds, GSS_KRB5_CRED_NO_TRANSIT_CHECK_X)=

> [...]
>> But it seems gss_set_cred_option() is not accepted because it's
>> a deprecated.
>=20
> Personally I'm fine with this.

Ok, should I just use a different oid (I can allocate one from the Samba =
pool)
and submit the changes to MIT without the "wait for heimdal first" tag?

It would be great to have that in MIT and we can also apply it to
Samba's fork of Heimdal and have most Samba setups covered.

>> 1. An additional cred_store element could be passed to
>>    gss_acquire_cred_from() in order to set the
>>    GSS_CF_NO_TRANSIT_CHECK flag on acceptor_creds
>=20
> This is similar to a cred option.  I don't see any strong advantages of=

> one over the other.

Same here, I just wanted to find ways to make Nico happy.

>> 2. I think someone had the idea of using gss_set_sec_context_option()
>=20
> This seems hard to do without (per-thread) global state.  Even if we
> bring in gss_create_sec_context() from some versions of the channel
> bindings draft, the mechglue doesn't know mechanism will be used to
> accept the context, so it would have to store OID/value pairs in the
> mechglue context and replay them to the mech context once it finds out
> which kind of mech context to create.  (And hope that all of the contex=
t
> option values are flat byte strings, not structures containing pointers=

> to objects whose lifetimes might have expired between the
> set_cred_option() call and the first accept_sec_context() call.)
>=20
> Doing this with global state seems strictly worse than communicating th=
e
> flag via the cred.

Yes, it seems way to complex.

>> 3. Implement a krb5.conf option similar to "dns_canonicalize_hostname"=

>>    or "ignore_acceptor_hostname" from MIT
>=20
> I would argue for this to be a per-realm option if we do this, since
> it's a statement about a particular realm's KDCs being non-conformant.

Ok. I can also implement that in addition to the GSS_KRB5_CRED_NO_TRANSIT=
_CHECK_X
option.

Thanks for the feedback!
metze


--7BsiALzeUZ4T5C7RAdOICnGuxRazFL8vM--

--Xp3Yih5Hu6WcbkPjq8hyTMyVwN4ZgedUI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmEQ7o4ACgkQDbX1YShp
vVb7zhAAojul0CNfaewO4+Xw8+6iXIJMJOiuKbgDQnX6kZmmpCVyKB1SaHE8KOF6
Y+bZUIPWoF9yq/euKEV7AEv1b2cKd214h45CwbH0eB4+fLHT5EoFZt+eahCH6IGQ
nv5ENxFXu6dWE3GXa5yFqqGImmcNi1TKKdBSdnpZByct8l0oWw3FRI/1P9RVXXCs
hLQqKwBzedTemBV/yQuKIhO0dCsljSHMAiH7CAXRpMYl9HDiI2z9fS62/jBIJChp
z7SiQSduJXqTVJJRlEIOlKqAODLDvxFPUhIzusaizOAo/oEWBYPy7o+/WqzEisDj
yYqG66zB3JMqaWw5ttWTiUgxh1EI5dcDMWhsMLk5MvwztgVVPjQUPXw2kRFyG2+e
i1T9E17/lzD7XExoYGu8/7JoBADbWVYssztPEVhMOiVPcEbPaHXDI0LDwMSAqChq
pYtLFJSmLg+L/3doGL12mFc8N7GdKn5ofr3cxiT6EWAr7XDcb8VKbQVVCL50CW4x
RRp+8HTWTZLwGd7+9m2Rr56D7Z4GWkKTXoijMJtb+GwG4dYE27sW/LTIa6iunlqX
ptSoIphFMDK8Kv1s0deubZb+ihT0AlvtQU4vVtVKRyYvDk9hqeQvEi7ttdkjhRpZ
PXJa713sJv9wxm7iMFVa/GipqiV7GYxLbeWflbXm7CQQjNqywmk=
=WGMY
-----END PGP SIGNATURE-----

--Xp3Yih5Hu6WcbkPjq8hyTMyVwN4ZgedUI--

