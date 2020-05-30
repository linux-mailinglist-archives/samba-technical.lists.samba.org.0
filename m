Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F71E9170
	for <lists+samba-technical@lfdr.de>; Sat, 30 May 2020 15:18:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=Ro6OTyempc4Z71dO6rXFnkTa3oetjhrLGfdO8ored+Q=; b=YR4srWYq+ewSgPLldI5112dXNF
	jbOopsWGBx0Qjtbd/FC/SsGkcqljeMfHzKlo+5e9/DN088VrHrfpdax3rgZeegHjtjZ2//0n1LPjJ
	QSHlGWSCeFSvV55e3BKdEGTJOMOnDusMeIAefo9EN+XmoZF2+IyI936qXcriiVXs7UGdRZIFtN7gd
	6+mZnZEMsP2QDT936/L+IwbWaQX5jkKLwp7TkrefUN8RL+SsIYvws7cVz1Voo8dPO0l5YLcSoed9H
	tVuezZN9FEle9Tdci7ZfNHqzZWtVy+bLLB0R6FoZzx9OBH9/D4DwiCAaHhFxByUxoN+82uZlrdUDR
	LCTjihbQ==;
Received: from localhost ([::1]:46104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jf1Mq-006Qdb-IQ; Sat, 30 May 2020 13:17:40 +0000
Received: from mx2.suse.de ([195.135.220.15]:49260) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jf1Ml-006QdT-Gs
 for samba-technical@lists.samba.org; Sat, 30 May 2020 13:17:37 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7575AD7C;
 Sat, 30 May 2020 13:17:32 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Following Steve's Question - Re Tokens in SPNEGO
In-Reply-To: <20200530121450.GR5779@onega.vda.li>
Date: Sat, 30 May 2020 23:17:24 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <8795B020-51D1-40B4-98B0-A60A77B39808@suse.de>
References: <04593936-C78E-43E9-81EE-0311A84D21EB@suse.de>
 <20200529104042.GQ5779@onega.vda.li>
 <CB9B11C8-E184-40F6-A035-1ED5B707E9B8@suse.de>
 <20200530121450.GR5779@onega.vda.li>
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

>=20
>=20
>> IE think bearer tokens from oauth being passed in that can be
>> validate, or a saml assertion where you can check as the passdb has a
>> registered handler.
>=20
> Right. You wouldn't push SAML assertion or bearer token to PASSDB.
> Instead, in negoex plugin you would perform mechanism-specific lookup =
of
> the details and associate that with the security context in a way
> expected by higher level GENSEC code in Samba. This is similar to how
> Kerberos part of GENSEC expects to pull PAC record and parse it =
further.
> Or GENSEC's NTLM code extracts security token and parses it further.

<snip>

>=20
>> It would be interesting to know how a windows server + windows
>> desktop, both joined to azure AD conduct their authentication in this
>> case, since there should be no ntlm or krb involved .... =20
>=20
> They still involve Kerberos, with PKINIT-based authentication using
> certificates bound to machine TPMs. These certificates are issued and
> tied into information about those machines in Azure AD. There is a
> reason why Microsoft Windows logo certification requires TPM from a
> hardware platform.
>=20
> See details here for machine enrollment:
> =
https://docs.microsoft.com/en-us/windows/security/identity-protection/hell=
o-for-business/hello-how-it-works-device-registration
>=20
> and for user provisioning of a two-factor credential:
> =
https://docs.microsoft.com/en-us/windows/security/identity-protection/hell=
o-for-business/hello-how-it-works-provisioning
>=20
> and for user authentication:
> =
https://docs.microsoft.com/en-us/windows/security/identity-protection/hell=
o-for-business/hello-how-it-works-authentication

That's only the hybrid AD + Azure AD case isn't it?

>=20
> Windows does everything in terms of NT security token that needs to
> be created for the session setup on Windows side. For Kerberos and =
NTLM
> the token's content is based on the content of PAC in Kerberos
> ticket and security token from NTLM exchange correspondingly. It is
> then amended with whatever local details are needed in the local =
security
> authority (add local groups, for example).
>=20
> In the user authentication link above you might think there is no
> Kerberos involved in the first case (Azure AD join authentication to
> Azure AD) but there an encrypted session key is returned by Azure AD
> through the cloud AP provider which is then decoded by the cloud
> authentication security support provider (SSPI module) using the
> device's transport key.

<snip>

> Essentially that online identity is bound to a local account you have
> and then reuses details from LSA after successful authentication has
> been done via interactive logon with the help of SSPI extension. In
> practice then means triggering use of that extension via SPNEGO NEGOEX
> offer.

Do you have any documents on the cloud SSP functionality? What details =
does it reuse?

It seems like being able to support this extension would be the answer =
to Steve's question ...

=E2=80=94
Sincerely,

William Brown

Senior Software Engineer, 389 Directory Server
SUSE Labs


