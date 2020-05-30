Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 192351E9018
	for <lists+samba-technical@lfdr.de>; Sat, 30 May 2020 11:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=Qm6btDygrW6tromitrt29HcnPPULE1hRIywhpsNIaAI=; b=T6FX22sdVG8oNPzxizUYt+Yobz
	feKzKcT84DIcIySYI45vp0s8B1cWKXl3AIdsBqLne9LQCFF8UuJesZYZSlyOgDshOnrK26GKrEfNB
	vw0bt0bttYpYNGXZ3XkGUcuAtTVTAoj1+SRRwF/Fade/KBthmULRXYNUftPveY/3wyMvrnd8UpQyi
	6RXcCRoF6aArg414ClcNBcGXmkH2GDCho03+vRoTrWu9kV3SoHQU6g/UtCVueycMTwGoHMM1JvWp8
	DQXbfC8VKodRzst1YhtawHyfQiJ/1JLjANH/tBa5Q8ZZuKTBHKKhSJfNeP1KzAnDLtscD1P/W8LAc
	xgBZDPtw==;
Received: from localhost ([::1]:43298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jexrn-006PxP-EG; Sat, 30 May 2020 09:33:23 +0000
Received: from mx2.suse.de ([195.135.220.15]:58638) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jexrh-006PxH-2S
 for samba-technical@lists.samba.org; Sat, 30 May 2020 09:33:21 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 64538AEC2;
 Sat, 30 May 2020 09:33:14 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Following Steve's Question - Re Tokens in SPNEGO
In-Reply-To: <20200529104042.GQ5779@onega.vda.li>
Date: Sat, 30 May 2020 19:33:07 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB9B11C8-E184-40F6-A035-1ED5B707E9B8@suse.de>
References: <04593936-C78E-43E9-81EE-0311A84D21EB@suse.de>
 <20200529104042.GQ5779@onega.vda.li>
To: Alexander Bokovoy <ab@samba.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
From: William Brown via samba-technical <samba-technical@lists.samba.org>
Reply-To: William Brown <wbrown@suse.de>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On 29 May 2020, at 20:40, Alexander Bokovoy via samba-technical =
<samba-technical@lists.samba.org> wrote:
>=20
> Hi William,
>=20
> On pe, 29 touko 2020, William Brown via samba-technical wrote:
>> Hi there,
>>=20
>> Thinking to Steve's question yesterday, it would be interesting to
>> know from the experts on this mailing list an answer. How what would
>> opaque token authentication look like in Samba? How would a passdb
>> support this style of authentication? How would a client get the =
token
>> to pass through?
>>=20
>> It would be great to know more about this and explore some of these =
thoughts.=20
>=20
> My current thinking is around reusing existing infrastructure in the
> protocol. SMB3 authenticates with SPNEGO[1]. SPNEGO allows to have =
multiple
> authentication mechanisms advertised, with most common ones being krb5
> and NTLM. These are not the only ones, a common extension mechanism
> called NEGOEX can be used as well[2].
>=20
> NEGOEX is basically a way to tunnel some method of authentication =
known
> to both client and server through SPNEGO. It doesn't need need to
> require a third party (like KDC) to broker an authenticity of the
> parties. MIT Kerberos supports NEGOEX since version 1.18, there are =
also
> patches for Heimdal.

How would the currest tdb passdb or ldapsam work with this? A hook where =
the content of the negoex is sent to that module?

IE think bearer tokens from oauth being passed in that can be validate, =
or a saml assertion where you can check as the passdb has a registered =
handler.

It would be interesting to know how a windows server + windows desktop, =
both joined to azure AD conduct their authentication in this case, since =
there should be no ntlm or krb involved .... =20

...

>  gss_inquire_name(..., &attrs);
>=20
>  find an attribute with the right name
>=20
>  gss_get_name_attribute(..., name, attribute, ..., &value, ...);
>=20
>  extract NT security token or something that can be used to construct
>  it from the value with the right name
>=20
>=20
> [1] =
https://docs.microsoft.com/en-us/openspecs/windows_protocols/MS-SPNG/d2ccb=
21f-be95-426e-88b3-020bd39158f1
> [2] =
https://docs.microsoft.com/en-us/openspecs/windows_protocols/MS-SPNG/fe1b1=
adc-07f6-40c0-a36b-b4f75be2695e
>=20
> --=20
> / Alexander Bokovoy
>=20

=E2=80=94
Sincerely,

William Brown

Senior Software Engineer, 389 Directory Server
SUSE Labs


