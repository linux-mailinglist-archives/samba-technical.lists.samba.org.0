Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ED726A3FD
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 13:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=HXiNA5Wy8jegF4AWfRHCePk8XN8lKmbwmvqrI2QHp+E=; b=sgA/QT3xVjEC9F0aSMeogWemIF
	IvytGPj/7GOdJKf/AkepNgxc8aYtMAOcOGxqqDj3N01Q1tzfI4l0jztkza0hXDtjYoSP2OV74R3cz
	gpfOOvLMsJ+jMIlRC2d+q/KaLbrqpX8Phr/3f357fGwtCjAU6sG1FUFGUsGELOvNkWD1Psz/oznuJ
	XSep8pt62HsXTd2OWaesnLZnYBBgbRl2u0gu59nPpLVBvJlv96+e+oBYxHVG1kWabThHAvv4vjZDe
	HxhhrAhvRxPHiJ82v3PfXa4q0USLD5jaOBVePtXkM1ZlGfc1XGlfOkhuOPobiPtWcM1IuCC5aNy/R
	/dvCRKKg==;
Received: from localhost ([::1]:61032 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kI8wo-005T9r-Ah; Tue, 15 Sep 2020 11:16:30 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:37728) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kI8wj-005T9k-Al
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 11:16:27 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 3919CD6E07C50;
 Tue, 15 Sep 2020 14:16:22 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4nLMHJcUeuxp; Tue, 15 Sep 2020 14:16:21 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 87ADDD6E07C4A;
 Tue, 15 Sep 2020 14:16:21 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 87ADDD6E07C4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1600168581;
 bh=HXiNA5Wy8jegF4AWfRHCePk8XN8lKmbwmvqrI2QHp+E=;
 h=Date:MIME-Version:To:From:Message-ID;
 b=dPDnM3RZiTIZShh12wIjsxzEYOjE5UV5y8/zSzrlo5YFc3RkCOD3SwuFDsWBM6GUs
 eT+Q8hSMNv1jfSPP9dP67NXODvyh4qLSzIP/E7lCohynZrr9WMMs82xgOnHjUKN1Jw
 wM84lN9al+9JNp67Nguqf8nGEBghx7w5niCjwgUDdiyyRqUBE+dBWPblv+vLqgk7zt
 VtK4tFt3ht+EG2OnUEEbFuw9DBNeagn9csDyyI1EPSbBFUpEAdBIKNS4jWiVtWxiXe
 1svNakmX0PLAFUctAFdzxdQUJ8hsi8gAJk6wqtSNjP68MD2m0Fccovh51p1fGkjw0L
 ZJ+tSTMVDST0w==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KEYiHkvN7YSb; Tue, 15 Sep 2020 14:16:21 +0300 (MSK)
Received: from [10.68.14.64] (unknown [91.193.179.24])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 36300D6E07C40;
 Tue, 15 Sep 2020 14:16:21 +0300 (MSK)
Date: Tue, 15 Sep 2020 14:16:18 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <c98e756ee61403d845c5cba384c756224d2fd5bd.camel@samba.org>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <c98e756ee61403d845c5cba384c756224d2fd5bd.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: SELinux attributes in Samba domain
To: Andrew Bartlett <abartlet@samba.org>, Rowland penny <rpenny@samba.org>,
 samba-technical@lists.samba.org
Message-ID: <01ED5F03-FFBD-48D1-85F1-639CABD23564@rosalinux.ru>
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



15 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2020 =D0=B3=2E 10:39:4=
1 GMT+03:00, Andrew Bartlett via samba-technical <samba-technical@lists=2Es=
amba=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>On Tue, 2020-09-15 at 08:10 +0100, Rowland penny via samba-technical
>wrote:
>> On 15/09/2020 01:42, Mikhail Novosyolov via samba-technical wrote:
>> > Hello everyone!
>> >=20
>> > I am thinking about storing SELinux attributes of domain users in
>> > Samba AD domain=2E
>> >=20
>> > The problem is that Samba AD copies Windows domain, but there is no
>> > SELinux in Windows=2E
>> >=20
>> > Currently FreeIPA can store this as a server in LDAP and sssd can
>> > get and apply SELinux attributes from FreeIPA's LDAP:
>> >=20
>> > $ grep -inHr ipaSELinux
>> > src/providers/ipa/ipa_config=2Eh:34:#define
>> > IPA_CONFIG_SELINUX_DEFAULT_USER_CTX "ipaSELinuxUserMapDefault"
>> > src/providers/ipa/ipa_config=2Eh:35:#define
>> > IPA_CONFIG_SELINUX_MAP_ORDER "ipaSELinuxUserMapOrder"
>> > src/providers/ipa/ipa_opts=2Ec:271:    {
>> > "ipa_selinux_usermap_object_class", "ipaselinuxusermap",
>> > SYSDB_SELINUX_USERMAP_CLASS, NULL},
>> > src/providers/ipa/ipa_opts=2Ec:276:    {
>> > "ipa_selinux_usermap_selinux_user", "ipaSELinuxUser",
>> > SYSDB_SELINUX_USER, NULL},
>> >=20
>> > In general it just gets a string and processes it, this email is
>> > about storing that string inside the domain per user=2E
>> >=20
>> > My question is: how can SELinux attributes be stored inside Samba?
>> > I understand that it will not a standartized name (but maybe we can
>> > come up to upstreamizing something into sssd=2E=2E=2E?), but I am rea=
dy
>> > to keep with something not upstream for now and to try to make SSSD
>> > to the same for selinux in Samba as it does in FreeIPA=2E
>> >=20
>> > I think I should extend Samba's scheme with custom attributes like
>> > in the guide=20
>> >
>http://david-latham=2Eblogspot=2Ecom/2012/12/extending-ad-schema-on-samba=
4=2Ehtml
>> > And then try to make sssd read those values=2E
>> > Does it sound like a not very bad approach?
>> >=20
>> > Thanks!
>> >=20
>> >=20
>> We have a wikipage about extending  the AD schema:=20
>> https://wiki=2Esamba=2Eorg/index=2Ephp/Samba_AD_schema_extensions
>>=20
>> Your problem will come with sssd, it isn't supported by Samba
>> (because=20
>> we do not produce it and no little about it) and even Red-Hat no
>> longer=20
>> supports it use with Samba=2E
>
>For managing pure Linux clients it would be really awesome if we could
>make this work well=2E  I've long dreamed that Samba be the ideal posix
>directory server, because there is no good reason why it can't do that
>as well as be an AD DC - why should sites have to run both FreeIPA and
>Samba (and have the complexity of trusts) just to get really good
>management of their Linux clients=2E

Yes! FreeIPA is a great thing, but a VERY complex and resource hungry one!

>
>Rowland,
>
>While the combination of Samba and sssd on the same host is a known
>problem,

Why may it be needed to run samba and sssd on the same host? Samba is serv=
er, sssd is client, but it probably does use smbd? Which problems are there=
?

>outside this case we should work hard to have sssd be a great
>domain member in Samba domains, just as much as we hope for good
>outcomes for MacOS or Windows clients=2E=20




--=20
=D0=9F=D1=80=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5 =D0=B7=D0=B0 =D0=BA=D1=80=
=D0=B0=D1=82=D0=BA=D0=BE=D1=81=D1=82=D1=8C, =D1=81=D0=BE=D0=B7=D0=B4=D0=B0=
=D0=BD=D0=BE =D0=B2 K-9 Mail=2E

