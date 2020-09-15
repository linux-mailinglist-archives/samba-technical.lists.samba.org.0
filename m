Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E535126A664
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 15:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=BUgNOVdZAcQj3odLkV4/yI0anhuoQYpNl5yl8uvbpzo=; b=RqIjJ89QM3nrXY9IcrrGVU8qPk
	CQOLygEbRzxK6DAI2um0OmVsk2VbF3wLY/ME0ipRebv1qfwX6FiE8NS6YFJBwPL4aKDR/Ej2eNg7T
	FVTOEvlA8wHbf8d501pxzEw1tqnmO7d4LvgnbzGxzvrceFKY4aXbxltyhaL6gkauYPgPLSAqYGo5n
	u2yF8PKxC5519BP/UHgT7Qw7n4168GYf6s5P06PLf4tyeOsIKExX6p1wAslUlL2TLICMM7eK3wjY8
	RdFqdOWxms74C1sGITQWMeOAme/O/O5aQ/NUJ16NBnz5FZZpwi6zt5C8xesuXouVuOi+Xgx/0FBCg
	mLCrgFRQ==;
Received: from localhost ([::1]:21906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIBAc-005UYF-Mu; Tue, 15 Sep 2020 13:38:54 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:43898) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kIBAW-005UY7-RJ
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 13:38:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 8350AD6E3495C;
 Tue, 15 Sep 2020 16:38:44 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3tYpAMCNJr2X; Tue, 15 Sep 2020 16:38:43 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id BB7EFD6D80B67;
 Tue, 15 Sep 2020 16:38:43 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru BB7EFD6D80B67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1600177123;
 bh=BUgNOVdZAcQj3odLkV4/yI0anhuoQYpNl5yl8uvbpzo=;
 h=Date:MIME-Version:To:From:Message-ID;
 b=LqltLIgd0onR4vV1rhcYD7BS3nCicyVUD8my1bOU0jcsUngvjdNTR2tmdFMrJHhOi
 LwQbAeKhUwcgruRBa3D+NkMXEr7QuWKKhVg2u9txjAyszducsFm874G6V6xjKfk6LK
 9gmyWWT5XcBYCY8Bm3y5pIqUfLkpMJW4oYVxj+BB7m5BEEQFMUQDkwEqosIrfioIhg
 JcOErcHQgUIx+CJUnLF68F6Za2XTjnLpC3M0Xsfjo6EEYj3jxsDo2IpbttVsSKbY+5
 elGteknNCfbQdrtVJByiT/Ie1B+7ls+7EeqaAkkIYAONIdxg1Sva5DuaVhWfWhL8IP
 lT3V4yv8PZn2g==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cFQJS0it9X7r; Tue, 15 Sep 2020 16:38:43 +0300 (MSK)
Received: from [10.81.233.127] (unknown [91.193.178.23])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 6F036D25426DA;
 Tue, 15 Sep 2020 16:38:43 +0300 (MSK)
Date: Tue, 15 Sep 2020 16:38:40 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <b2911d7d-54df-896c-9569-eebba6b0cb33@samba.org>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
 <b2911d7d-54df-896c-9569-eebba6b0cb33@samba.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: SELinux attributes in Samba domain
To: Rowland penny <rpenny@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <10542C0C-2DEC-47CB-AF65-3717A3077868@rosalinux.ru>
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



15 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2020 =D0=B3=2E 14:50:5=
2 GMT+03:00, Rowland penny via samba-technical <samba-technical@lists=2Esam=
ba=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>On 15/09/2020 12:08, Mikhail Novosyolov wrote:
>>
>> 15 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2020 =D0=B3=2E 10:1=
0:32 GMT+03:00, Rowland penny via
>samba-technical <samba-technical@lists=2Esamba=2Eorg> =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
>>> Your problem will come with sssd, it isn't supported by Samba
>(because
>>> we do not produce it and no little about it) and even Red-Hat no
>longer
>>> supports it use with Samba=2E
>>>
>> What is the problem to use sssd as a client to enroll into Samba AD
>domain?
>
>Before Samba 4=2E8=2E0 , the smbd deamon could contact AD directly, this=
=20
>meant you could use sssd with Samba, instead of using winbind=2E From=20
>Samba 4=2E8=2E0, if 'security =3D ADS' is set in smb=2Econf, smbd must co=
ntact=20
>winbind, it can no longer contact AD directly=2E You cannot install sssd=
=20
>and winbind together, they both have their own versions of the winbind
>libs=2E

Yeah, I know that sssd has its own libwbclient=2Eso=2E0, but did not study=
 details=2E I still can't understand the initial problem=2E If sssd and wbc=
lient conflict on the client side, samba's winbind may be turned off, right=
? What does prevent from using sssd as a client for samba domains?

>
>If you want to extend the schema to store selinux data, then this
>should=20
>be possible (you just need the correct =2Eldif), but you would then need=
=C2=A0
>
>a tool to extract them from AD=2E
>
In case of using pam_winbind, will it be sth like making an ldap query (us=
ing ldspsearch? or which tool will be better?) in PAM stack after pam_winbi=
nd, authenticating via kerberos and making a query for the current user nam=
e?=20


