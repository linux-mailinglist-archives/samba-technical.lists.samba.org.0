Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED111466B0
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jan 2020 12:26:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=UQv98aw3OvfInaslJgI8rZ2iqFdR3cpjnkviJSMNpXA=; b=jDPl9mj/3qM/HgzfStkYrimd/L
	mIDBJWnZjhfgA9z+nks81edW1q/9NvPtiAYPxrQId3CfTBeV64A853zZ3ukuY67hdIrS36I2jaaiD
	tngnyFwYVTrxTgirSiBirb616wqVjPrktHtyt22hftzQLYSOkV2RqwU5XsskyNdqqrrT2ARbdQcoQ
	qO8iETJH65kTgubTJqmuT0igUICtwgwj9qGkJcR3VwQWcTIXDZlmppBI01A5U41UbD/WAT2uK2kMC
	y1SMK8ZWr2SKpRNOAmDPPSmqQ6s+BXASasM7fZrplwGwyDuFhyG2b5YOLcbxDk29q1Zre3FGQlLYo
	yWcw/xKg==;
Received: from localhost ([::1]:46744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iuacf-004MOO-6o; Thu, 23 Jan 2020 11:26:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16992) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iuacZ-004MOH-KC
 for samba-technical@lists.samba.org; Thu, 23 Jan 2020 11:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:To:From;
 bh=UQv98aw3OvfInaslJgI8rZ2iqFdR3cpjnkviJSMNpXA=; b=DLY4DJM/zZ1oVYsQpLQ+t+PFDL
 b5GxxLwIwjFfgVOzvi0p01VVlIIw93P1IFEvIgqcLDRGzS4ARbrADcpmRrxyPcSWnvkQItDY6i4Hb
 3eGLatWVpemkJPYIq1dnXRkQ6wQvNyXeq74NjeFOmBiNSKkyOKsQe80TkUMMoQ4IzG7Tkor0OEUaf
 ResDbaJYLAfdWS4HEuc46yx+DJRohYqedfwdUuqIQ3Jxvv/OJwUuy3utALStTBK1nUS8+2nnGQjrl
 8AV/LNBrR9AUJcvVxbNwsw02u2C+8wL+X5Nv5Ux5kNLSmD3qING34zy+wpqLiQjbfvWfuiumUlA9p
 u6HegOOXzScouADwrMB2cCF3NrKOeTcGT/clfOR2lmQcPxDMb3aiNaiHujXp1r8PN+vC+omxo5p2C
 OL4p2TajWUYI9MLb1VMNJillUed2jKeeuUiE+dPESlZS+G9yNF1wju//Z0e+L9nxIg/ENGmn+4rg9
 +bTnExbA6UW25eD+hu+KJvo0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iuacV-0007hT-PV; Thu, 23 Jan 2020 11:25:55 +0000
To: Nico Williams <nico@cryptonector.com>
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
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
Message-ID: <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
Date: Thu, 23 Jan 2020 12:25:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="oLy5S5ZQeCm5mof6uhBwqCMowoKCy9ARG"
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
Cc: Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>, kitten@ietf.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oLy5S5ZQeCm5mof6uhBwqCMowoKCy9ARG
Content-Type: multipart/mixed; boundary="lGvB60PQRu0oRg0PbUagwaDFPVsJ1XqEo";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Nico Williams <nico@cryptonector.com>
Cc: "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>,
 Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>, kitten@ietf.org
Message-ID: <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
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
In-Reply-To: <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>

--lGvB60PQRu0oRg0PbUagwaDFPVsJ1XqEo
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Nico,

it would be great if we could make some progress here...

Any hints how to avoid gss_set_cred_option() with a more modern
construct that would be acceptable for upstream MIT and Heimdal.

Thanks!
metze

Am 05.12.19 um 17:26 schrieb Stefan Metzmacher:
> Hi Nico,
>=20
>> On Fri, Nov 22, 2019 at 11:24:44AM +0100, Stefan Metzmacher wrote:
>>>> Correspondingly and symmetrically, the right way to request some
>>>> behavior on the side where the credential is available, is to associ=
ate
>>>> that request with the desired_name for which the credential is acqui=
red.
>>>
>>> So you mean we need to pass an explicit desired_name to
>>> gss_acquire_cred_from() and use gss_set_name_attribute() calls
>>> (for no_transit_check and iterate_acceptor_keytab) on that desired_na=
me
>>> before?
>>
>> Oh, wait, right.  That's not going to work when you want a default
>> credential.
>>
>> Alright.  I've got a nasty cold and can't think straight, and deadline=
s
>> to meet to boot too.  I'll respond more thoughtfully some time next
>> week.
>=20
> I hope you feel better again:-)
>=20
> Looking at the gss_acquire_cred_from() prototype:
>=20
>  GSSAPI_LIB_FUNCTION OM_uint32 GSSAPI_LIB_CALL
>  gss_acquire_cred_from(OM_uint32 *minor_status,
>                       gss_const_name_t desired_name,
>                       OM_uint32 time_req,
>                       const gss_OID_set desired_mechs,
>                       gss_cred_usage_t cred_usage,
>                       gss_const_key_value_set_t cred_store,
>                       gss_cred_id_t *output_cred_handle,
>                       gss_OID_set *actual_mechs,
>                       OM_uint32 *time_rec)
>=20
> I thought that additional cred_store elements would also
> be a way to modify the resulting cred_handle.
>=20
> On a similar matter I'll soon need a way to modify
> a GSS_C_INITIATE cred_handle that forces KRB5_GC_CACHED to
> be used, so that gss_init_sec_context() is garanteed to
> avoid any network usage.
>=20
> Any hints would be much appreciated:-)
>=20
> Thanks!
> metze
>=20
> _______________________________________________
> krbdev mailing list             krbdev@mit.edu
> https://mailman.mit.edu/mailman/listinfo/krbdev
>=20



--lGvB60PQRu0oRg0PbUagwaDFPVsJ1XqEo--

--oLy5S5ZQeCm5mof6uhBwqCMowoKCy9ARG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl4pgr4ACgkQDbX1YShp
vVatxA/+Kds5dYQv0utMrBIfjB4RlMhUEk60QGispC/T5pKavK9dUFV75f7wzH9M
gSNgr2klV9wlP40zw8DaIB0DBtkXcEXSJW9hF7yTVg64TfoNjg1vYugJzUwk3Lf2
1P2Hj0fX17brk40ZwdNNRGDdVoIgosHeETj8DRkC5L9QIiRlf5vlU5MetVeUuYle
QpXhzC2jfSGMewWWMXFhNvwzcibV4fZ1xr2JZOCNcHjTwqSCQixhzpeMJQNQJVE4
zV+UVbjvaGBHRHKYI1qdVuj8qq1OLxqW1Zfq7OxD5y5Sy8ozCAjgM8VGnuj/l8wt
LBWzBDVUiYuYWpigiLUfQ/lMyoCbKJlEZ1NGL5IjbBqGcvn/0WPC2+8241nPr6pX
j+BuPMyhQgagfW/XbSY5sNUDCUc2zmaZUFi9/cnRq91rorGrTiITIRi8Xpx/RIUb
S1v17pFw4As7IroEyH1CgI4ZLSckoJGzdexTvYBtlTafhDJWf5U4851kCAgzcQZa
TtS+tR61HaEO7XFMaHAG7oJRtUYcrKxvN/PFvceAkYblQIYAT7NSZ31OSto3PpAa
qpfbt+XbABQoKjAiq9Nk8RxsadNLfUp8gAG22yNFYJs9Mc7GkYogx5dVEbtdGWLg
fVsTjdno1Nmj8Hyp4UlIVDbYPzDKnZH2XgGDbOrOxTV/rj6YNYk=
=M3mM
-----END PGP SIGNATURE-----

--oLy5S5ZQeCm5mof6uhBwqCMowoKCy9ARG--

