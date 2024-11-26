Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C499D9CF2
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2024 18:55:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Dn/YmvtCRWb46epIWM2LIWiM8r1Z2ESZS5inAkSi+pc=; b=C4ulM/z7yCkV9aqqZtv2KdpT0A
	mBJDhzeS51mmE0uE9JxxUGjvNIq3gr4MbfGxsEME8VmrzZEBSXtdvq8KxNcdVFyIYnrqhIWUBcqvn
	gl2gb3RjtINTCX6EF+kleTNChk0zb7JqRPFeOki6IVSgqzaZJNWKCAmft8cJwTWxlOAj6r8hJGvtt
	ZkcBi0chpjACO7qiswOeJHGlO4KPRa1d8vb+ydhSiiaPqhnbUN4psdBPtmYatUKMWhMFsc2rbuZs6
	gAFR6ErOc1o5C2kxR9Gprwq7FKwjfIPMczRvRgVKfvPWILvm3B/zmBgPD2G9K0XIe5urYUYmMMn0w
	ft3dDdbw==;
Received: from ip6-localhost ([::1]:38170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFzli-000uqC-7t; Tue, 26 Nov 2024 17:54:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40416) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFzlc-000uq5-LE
 for samba-technical@lists.samba.org; Tue, 26 Nov 2024 17:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=UtOfizcAVVUYtvYZl7KAe/gfw9UC+5RcEmI7F8lUUOc=; b=F8vLOJd5G7vonEs466RTMxcoIc
 3IRYaK7+qK/+Mea8Uj3PYla3Mt/wWMfNytEvFzLtyh0K/aVMRFat1ArDmZcelzPiAg4JONwRqk7wD
 CkHkJaVO6e6OVeLaJ6EAZyM/bKCiXCKcUcPHtG8wljFLirMeXGR3ktcgXzKsN5M2yctHOibYHeNKe
 3zgTSgcYjOEyPl3yoMpZHdo3qulGyT425oic+b8lFN8kntaXb39swU5JXU5NzbaV+QXGruoPRNVwr
 QqFroGZat+uFNx1h7bswj9GmDLb1LTqC4YdMfkeqQa75mvi9FFi2XZuE8LeVkYqlTTZl+SGpjk283
 7uTWUBvYZefIuihlqf+yGIjy0PqkTdOUkz2vrV9tf/FAKRprgeWzifTnipwnW0l3HnHnD+nnUE1Mr
 i6sciOkOUyMvw8+/7mZIjU3rdc/OhY0JsqQAUjDyWNiTEMb9mf1lyoJZpiCn3wKbakgNGqtPhddEV
 DiMXPXbJ2Vihw2ON/jolnGgi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFzla-001ZrA-2a; Tue, 26 Nov 2024 17:54:27 +0000
Message-ID: <3fd065ee6c6071cca3f87308c18fbeb37b05b378.camel@samba.org>
Subject: Re: heimdal 7.8 crash (in OpenLDAP) with spnego/ntlm, is this
 familiar?
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Date: Wed, 27 Nov 2024 06:54:22 +1300
In-Reply-To: <CAN05THQs1+qMOtnOPyb3MdxszdWOfHKMREWU7t-XbyeOYuNSQw@mail.gmail.com>
References: <55aec456-0370-426a-b143-a59acddba5b1@samba.org>
 <99f968a92a7fd8de4a93bc0ee2ed8ffcd2208b3b.camel@samba.org>
 <Z0WJWF0sWSFbAy4E@ketupa.mistotebe.net>
 <7e3dcea1759b018784ca9041c9e378ad7ca3f285.camel@samba.org>
 <CAN05THQs1+qMOtnOPyb3MdxszdWOfHKMREWU7t-XbyeOYuNSQw@mail.gmail.com>
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: metze@samba.org, samba-technical@lists.samba.org,
 =?UTF-8?Q?Ond=C5=99ej_Kuzn=C3=ADk?= <okuznik@symas.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There is a small team that reviews our patches from time to time, lead
by Jeffrey Altman.

Andrew Bartlett

On Tue, 2024-11-26 at 19:12 +1000, ronnie sahlberg wrote:
> Back to Heimdal.  Who maintains heimdal right now and who is
> responsible to act on CVEs or other issues?
> Far as I know Love went into Apple and was never heard of again.
> There is someone that monitors and maintains it, right?
>=20
> On Tue, 26 Nov 2024 at 19:09, Andrew Bartlett via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >=20
> > On Tue, 2024-11-26 at 08:39 +0000, Ond=C5=99ej Kuzn=C3=ADk wrote:
> > > On Tue, Nov 26, 2024 at 10:41:12AM +1300, Andrew Bartlett wrote:
> > > > On Mon, 2024-11-25 at 16:08 +0200, Nadezhda Ivanova via samba-techn=
ical
> > > > wrote:
> > > > > Hi team,
> > > > > An OpenLDAP user encountered this issue, and since Samba also use=
s
> > > > > Heimdal too, we were wondering if maybe it has happened in Samba =
as
> > > > > well and was fixed? Do you think it is something that can affect
> > > > > Samba? There are back traces in the issue but no steps to reprodu=
ce,
> > > > > it seems to happen randomly in their environment, and we haven't =
had
> > > > > any feedback from the Heimdal team yet.
> > > > > I could not find a relevant issue in the Samba bugzilla or the
> > > > > commits, but perhaps one of you remembers something?
> > > > > https://github.com/heimdal/heimdal/issues/1189
> > > >=20
> > > > Samba strictly avoids using the Heimdal SPENGO and NTLM layers, onl=
y
> > > > selecting the GSS-Krb5 mech to use our more mature internal
> > > > implementation and so avoid this kind of issue
> > >=20
> > > Hi Andrew,
> > > thanks for coming back to us, are you saying Samba got rid of the MEM=
ORY
> > > credential cache as well, the suspected culprit here[0]?
> >=20
> > No, just that because Samba has done NTLMSSP since almost forever, we
> > always preferred our code that we closely tie to our credentials and
> > authentication stack over outsourcing that to an external library.
> >=20
> > Any issues with the MEMORY credentials cache, if not just a matter of
> > how it is used in NTLMSSP, could still bite us.
> >=20
> > > Also are you aware of a way to control what mechs are enabled/disable=
d
> > > through configuration?
> >=20
> > No, we just don't call any of the mechs that can choose other mechs, we
> > just call directly with the the gsskrb5 OIDs.
> >=20
> > Andrew Bartlett
> > --
> > Andrew Bartlett (he/him) https://samba.org/~abartlet/
> > Samba Team Member (since 2001) https://samba.org
> > Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba
> >=20

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

