Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1281A170237
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 16:21:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=/OTdqttkwrl0daeq2nnh+QX3bdKcG1SuX8r686Uc6q8=; b=wQhtwC6O9b0iiM1KxdY1GIp0Yw
	WMrXbq5d0XO925DdmaNGjrUQk1UjS+oxiPUjqQ5ZFecifQI/CwRjLq84U1bPe6xVjpMkB76J8Dk3E
	vnspz4if8iqOS8A0Jg6dDyVuhjGbYnaw3LGh2PcA5GS7C49QemqHtVZYmXc411XGp0VS+oZS/YqXc
	bUa1r3bexHWh1VUYkI4ljHtl6tNT2BkVFabmwcYDjawFlPoGmU0UtPTaTUOfCxEyXH7KvyxAir2xe
	hVRPdKtrG+oUoSBGbY2ANFQg+BVk+NdwIZ37QuQnG7k/6DvBVmQvCh7OCLRaZti0Zj2vSCOZp2OhK
	xKuHDrvg==;
Received: from localhost ([::1]:61936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6yV7-00Boah-EN; Wed, 26 Feb 2020 15:21:29 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25260
 helo=us-smtp-1.mimecast.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j6yV2-00BoTo-HX
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 15:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582730474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OTdqttkwrl0daeq2nnh+QX3bdKcG1SuX8r686Uc6q8=;
 b=JAYCkESdtvozpSwfSY/FRPekUXhDA8MWVXu/UeUOJ/wrQi3qICsoOGZKZf6x4+rpYyBjWa
 n7dSnbmmwXaqZWoIybvZ17nrRzbwWws4Iz2l3d7i+fntnqV6Ypw7PyqzykVDaOyF2E1XB7
 t1dGdJCoWkQtDzca0Oba4DmNNT/ovzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-jxRqXNhrP1O1u_sIAPrraA-1; Wed, 26 Feb 2020 10:21:10 -0500
X-MC-Unique: jxRqXNhrP1O1u_sIAPrraA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AAA310CE794;
 Wed, 26 Feb 2020 15:21:09 +0000 (UTC)
Received: from ovpn-116-244.phx2.redhat.com (ovpn-116-244.phx2.redhat.com
 [10.3.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BF2B1CB;
 Wed, 26 Feb 2020 15:21:08 +0000 (UTC)
Message-ID: <ac934c852d7aad518a4d7261b097095064da38fe.camel@redhat.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Isaac Boukris <iboukris@gmail.com>
Date: Wed, 26 Feb 2020 10:21:07 -0500
In-Reply-To: <CAC-fF8RSs2NaB6B_v=UKp0KpDiu75kzLy+ioX9nZNy09miSQMg@mail.gmail.com>
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8T6dGjDbH3YFpZpEA+Rtoppj+sJ4bZtt9ZDMfH85_UuUg@mail.gmail.com>
 <29a0fc8162de6bde7ea127956efb7de29b4fce3e.camel@redhat.com>
 <CAC-fF8QyT+t0Cmi3BdJe8kJ-LRL_BvvhQr76GwF2t3ZQJWsDDw@mail.gmail.com>
 <dc76b713e4e4c94d396a0d95ebb5145c63ce4a4d.camel@redhat.com>
 <CAC-fF8RrV1XtnaB0va3Bv8++c17qXKh+JtdSUqS00Eg-3OZUfQ@mail.gmail.com>
 <CAC-fF8RSs2NaB6B_v=UKp0KpDiu75kzLy+ioX9nZNy09miSQMg@mail.gmail.com>
Organization: Red Hat, Inc.
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Warn: EHLO/HELO not verified: Remote host 205.139.110.120
 (us-smtp-delivery-1.mimecast.com) incorrectly presented itself as
 us-smtp-1.mimecast.com
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
From: Simo Sorce via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo Sorce <simo@redhat.com>
Cc: Stefan Metzmacher <metze@samba.org>, Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-02-26 at 14:33 +0100, Isaac Boukris wrote:
> On Mon, Feb 24, 2020 at 9:37 PM Isaac Boukris <iboukris@gmail.com> wrote:
> > On Mon, Feb 24, 2020 at 9:28 PM Simo Sorce <simo@redhat.com> wrote:
> > > On Mon, 2020-02-24 at 17:41 +0100, Isaac Boukris wrote:
> > > > On Mon, Feb 24, 2020 at 2:35 PM Simo Sorce <simo@redhat.com> wrote:
> > > > > On Sat, 2020-02-22 at 20:09 +0100, Isaac Boukris wrote:
> > > > > > On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samba.=
org> wrote:
> > > > > >=20
> > > > > > > I think we need input from dochelp to answer 2 questions:
> > > > > > > 1. which kind of channel bindings are expected/used by window=
s?
> > > > > > >    I assume tls-server-end-point. I guess MS-ADTS would be th=
e place
> > > > > > >    to define these details for ldaps.
> > > > > >=20
> > > > > > I noticed more another reference to channel-bindings in MS-KILE=
, I
> > > > > > think maybe KERB_AP_OPTIONS_CBT ad element is the way to tell t=
he
> > > > > > server to require CB when LdapEnforceChannelBinding is set to 1=
 only,
> > > > > > needs testing.
> > > > > >=20
> > > > > > 3.2.5.8 AP Exchange
> > > > > > If ChannelBinding is set to TRUE, the client sends
> > > > > > AD-AUTH-DATA-AP-OPTIONS data in an AD-IF-
> > > > > > RELEVANT element ([RFC4120] section 5.2.6.1). The Authorization=
 Data
> > > > > > Type AD-AUTH-DATA-AP-
> > > > > > OPTIONS has an ad-type of 143 and ad-data of KERB_AP_OPTIONS_CB=
T
> > > > > > (0x4000). The presence of
> > > > > > this element indicates that the client expects the applications
> > > > > > running on it to include channel binding
> > > > > > information ([RFC2743] section 1.1.6 and [RFC2744]) in AP reque=
sts
> > > > > > whenever Kerberos
> > > > > > authentication takes place over an "outer channel" such as TLS.
> > > > > > Channel binding is provided using the
> > > > > > ChannelBinding variable specified in section 3.2.1.
> > > > > >=20
> > > > > > 3.4.5
> > > > > > If the ApplicationRequiresCBT parameter (section 3.4.1) is set =
to
> > > > > > TRUE, the server, if so configured,
> > > > > > SHOULD<67> return GSS_S_BAD_BINDINGS whenever the AP exchange r=
equest
> > > > > > message contains
> > > > > > an all-zero channel binding value and does not contain the
> > > > > > AD-IF-RELEVANT element ([RFC4120]
> > > > > > section 5.2.6.1) KERB_AP_OPTIONS_CBT.
> > > > >=20
> > > > > Very interesting, we should add support to decode this AD in MIT =
krb5
> > > > > and exposes it via naming attributes or context options, whatever=
 makes
> > > > > the most sense.
> > > >=20
> > > > Yeah, although I can't really think of something that would work,
> > > > given we want to know that before calling accept() on the input tok=
en.
> > > > On clients supporting CB, maybe we can add this ad-element via a
> > > > gss_set_name_attribute() call, not sure.
> > >=20
> > > We might even just see there are CBs in gss_init_sec_context() and ju=
st
> > > do it automatically. The only question is whether this can cause
> > > interop issues which requires a more nuanced use of these.
> >=20
> > Right, doing it automatically make sense. I think an unknown
> > ad-element in ad-if-relevant container shouldn't cause interop issues.
>=20
> It seems Windows clients send this same list of ad-element, over TLS
> or not.  I think "AD-TARGET-PRINCIPAL" is for what they called in the
> blog post "bound to SPN", not sure.
>=20
> authorization-data: 1 item
>     AuthorizationData item
>         ad-type: AD-IF-RELEVANT (1)
>         ad-data: 3081a9938298930=E2=80=A6
>             AuthorizationData item
>                 ad-type: AD-TOKEN-RESTRICTIONS (141)
>                 ad-data: 303330=E2=80=A6
>             AuthorizationData item
>                 ad-type: AD-LOCAL (142)
>                 ad-data: f0bca424242eaf2...
>             AuthorizationData item
>                 ad-type: AD-AP-OPTIONS (143)
>                 ad-data: 00400000
>                     AD-AP-Options: 0x00004000, ChannelBindings
>                         .... .... .... .... .1.. .... .... .... =3D
> ChannelBindings: Set
>             AuthorizationData item
>                 ad-type: AD-TARGET-PRINCIPAL (144)
>                 ad-data: 6c006400602=E2=80=A6
>                     Target Principal: ldap/sdc.smb.net@SMB.NET
>=20

Sp this is just an AD element, not actual Channel Bindings, right ?

--=20
Simo Sorce
RHEL Crypto Team
Red Hat, Inc





