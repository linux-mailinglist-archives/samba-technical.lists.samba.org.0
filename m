Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79394B72B7
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 07:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8TD7jGb5RQuCUkjGFyjbtTELiHH3MxuQfuJAu1in/pU=; b=P0erje6+UIRMS9k2eCVvTq80lO
	0Ks7PLzCI+DLZvR1xU8KjhUl3+MuVCLCvQvzajXVgX/PyUuvroexXwnkkdkTjOqwUubpF/8+0MBno
	wpr4EgWZke3BbcVhnAw64x42cIsN09m2RqMKzJCELSLdRln3iSDrZyKVn0KsgEDjZze0HHYMDuic3
	AWpBUSNa8GODR8gf6QDeg10wWUalK0HpLVimMPKIifM6TJlZNB4VnaOxBayF5o14fXCWNaR0pwTac
	Gk58BD6ZbS3IJqRFpo3ydjPW5HwvaFhVGUC7IS2Y7t1xaGMtoGveA+cJutBrqvuAhZCt5P4Q7LVgQ
	y277WVZA==;
Received: from localhost ([::1]:55802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAp4e-006mKg-2X; Thu, 19 Sep 2019 05:33:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47908) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAp4Z-006mKZ-OB
 for samba-technical@lists.samba.org; Thu, 19 Sep 2019 05:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:From:CC:To:Date;
 bh=8TD7jGb5RQuCUkjGFyjbtTELiHH3MxuQfuJAu1in/pU=; b=n3JLZMYfH5iP9drrXLWZ1ok93q
 /DGyqMse7/BToDnWg51zlVjDZt09aiCBFRHDfHd+++HkynMqiPz+cqGrqbN9E9+vqKxh4tXm7G7D8
 yD7+se5OiipMEfK75cLnIyiJH+Luo1km3nQn/A9fHqbJPAFeNKa3z11hHvVckTPE3p24=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAp4Y-0007Lb-SA; Thu, 19 Sep 2019 05:33:43 +0000
Date: Thu, 19 Sep 2019 08:33:40 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <1568859404.4377.73.camel@samba.org>
References: <1567482029.19432.46.camel@samba.org>
 <20190903144445.58591c90@martins.ozlabs.org>
 <1568849556.4377.70.camel@samba.org>
 <CAOCN9rzCshckhzed96biz2QaopixuwsE13JQYCNcWSYd0BbkTA@mail.gmail.com>
 <1568859404.4377.73.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Building Samba master on CentOS 7 (gnutls)
To: Andrew Bartlett <abartlet@samba.org>,
 Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>,
 Nico Kadel-Garcia <nkadel@gmail.com>
Message-ID: <2FF58635-623E-4C15-BCB9-36C4C2D5BFB8@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

19 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2019 =D0=B3=2E 5:16:44 =
GMT+03:00, Andrew Bartlett via samba-technical <samba-technical@lists=2Esam=
ba=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>On Wed, 2019-09-18 at 22:01 -0400, Nico Kadel-Garcia wrote:
>> On Wed, Sep 18, 2019 at 7:33 PM Andrew Bartlett via samba-technical
>> <samba-technical@lists=2Esamba=2Eorg> wrote:
>>=20
>> > We can't easily add comments like that to the bootstap=2Esh, but a
>README
>> > might work=2E  Only trouble is that you will need to modify
>> > bootstrap/template=2Epy to also exclude that new file from the
>sha1sum
>> > calcuations=2E
>> >=20
>> > Getting a better gnutls34 or later package into EPEL without the
>> > conflicts would also be really helpful=2E
>>=20
>> The published compat-gnutls34 and compat-nettle32 from have "devel"
>> packages that conflict with the default gnutls and nettle packages=2E
>> There are probably more graceful ways around them, but they'd need
>> some hooks in the samba building tools to *find* and use the
>> alternative locations=2E
>
>We are already setting=20
>
>> Is there any chance that the alternative, mit-krb5 based Kerberos
>> setups are good enough to use for samba-4=2E11?
>
>This was also asked by someone else yesterday=2E  The answer is still no=
=2E
>
>>  Fedora has been enabling
>> them in rawhide, but I don't know if all the older components in RHEL
>> 7 or now RHEL 8 are recent and play nicely, and I for one have not
>had
>> the spare stable build environment to test it out lately=2E
>
>The issue isn't with MIT Kerberos per se, but the whole combined work
>is not supported as an AD DC=2E  The effort largely stopped before RHEL8
>branched from Fedora, so the right packages will be in place, but that
>isn't the problem=2E =C2=A0
Nope, both MIT krb5 and Heimdal are inadequate=2E ;) Heimdal version works=
 by lucky consequence of not fully implementing correct checks for S4U oper=
ations=2E MIT version lacks relaxed principal comparison checks while havin=
g more correct implementation of S4U features=2E

Isaac is working on fixing the principal comparison checks in https://gith=
ub=2Ecom/iboukris/krb5/commit/66bdc866896b3d22f552bcee757929dfc3fb9776

>
>The problem is resources to support it (issuing security patches etc),
>the additional tests needed (because everything has changed) and the
>missing features=2E

The support part is irrelevant here at the moment=2E More strict principal=
 comparison checks than what is required by MS-KILE is preventing to even g=
et us to any serious testing=2E


>
>https://wiki=2Esamba=2Eorg/index=2Ephp/Running_a_Samba_AD_DC_with_MIT_Ker=
beros_KDC
>
>Andrew Bartlett


--=20
Alexander Bokovoy 

