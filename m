Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B7E114D08
	for <lists+samba-technical@lfdr.de>; Fri,  6 Dec 2019 08:58:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nZiHdwSaBOEwKI9UCnDG9SLWHF5Q3nvmaz5gFgnBIgo=; b=0etyuu/hf5667AjPIgkqMFLc/x
	FB5t1G8AL15BrfLDfGJzgde7VvKFJTymH7XCyl+OyNS3vxKNkq4TMHBsTEs5RwAS35lE0vKuZwUNq
	Ab2EhLSseoUnux9qjKIF/kV2CIMEaHAIyiqwrDEn5nu3ivbYwiUm4YlVJIjhqPg5FvXvr40iJR1Xf
	ugP7/FooqT5oz8OQGzNrAFhAQ9hQJjEiDs/rYKhxWLdlpQH2amiY7VnLZjfmP45hw1UY6zqGm73qq
	VuMhC8AgQuKPJUjOhV3vO+fNctvzmvDkbvQs0gahk/DCmdVNjWkYFPpPLIT1nxhW2cTRkqcSDOZGj
	vDm6+EnQ==;
Received: from localhost ([::1]:59480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1id8Uf-006NNU-44; Fri, 06 Dec 2019 07:57:41 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:50934) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1id8Ua-006NNN-2r
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 07:57:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id E15C5D53F64EC;
 Fri,  6 Dec 2019 10:57:32 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lhxigPwhjUzr; Fri,  6 Dec 2019 10:57:32 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 3CE7AD53F64F5;
 Fri,  6 Dec 2019 10:57:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 3CE7AD53F64F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1575619052;
 bh=nZiHdwSaBOEwKI9UCnDG9SLWHF5Q3nvmaz5gFgnBIgo=;
 h=Date:MIME-Version:To:From:Message-ID;
 b=NwJGyXY960DyQ3t5cdCmz9oFBGd8ElaGbWuFH8Q1ShuQ6oe84btky68DIFUr1InGL
 FQG8xP26AUb/aAk5sPGF/rPmyxFIvHDWzFtO9TlI5uLIT2PUOvIj/TJrNletCWMOBZ
 Erb54ZpGxQVXoh5dH6w4gD4TTKwcQrbUtcuR7H01pIvtwsaH4goxTvpD/jv7AHFyNI
 ow2jeJfHFlAilkgZQ1IFd5uhJLCixJrnN0epV2u0+3MXKHc3gttI8eoefqaPHnDYYF
 Rnx1QcKxgbCdDVfr3K1oh8Uog4FUHsnMZwKB75odXwM8032hS47Ft1wAb6HyL4qg8p
 LmJldmN3zKiRA==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4fbBEjopnweY; Fri,  6 Dec 2019 10:57:32 +0300 (MSK)
Received: from [10.80.41.95] (unknown [176.59.48.30])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 11474D53F64EC;
 Fri,  6 Dec 2019 10:57:30 +0300 (MSK)
Date: Fri, 06 Dec 2019 10:57:25 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <3908966.9OaNKuxUIl@magrathea>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <3533791.v9fxMDVjKa@magrathea>
 <c5977820-2814-183b-d29b-01fab733a995@rosalinux.ru>
 <3908966.9OaNKuxUIl@magrathea>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>
Message-ID: <61AD23D8-A377-4962-B9AC-AF12A96E7546@rosalinux.ru>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



6 =D0=B4=D0=B5=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2019 =D0=B3=2E 9:56:32 GMT+03=
:00, Andreas Schneider <asn@samba=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>On Friday, 6 December 2019 07:36:50 CET Mikhail Novosyolov wrote:
>> 06=2E12=2E2019 09:30, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> > On Thursday, 5 December 2019 22:27:59 CET Mikhail Novosyolov wrote:
>> >> 26=2E11=2E2019 19:20, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>> >>> On Tuesday, 26 November 2019 00:49:08 CET Mikhail Novosyolov via
>samba-
>> >>>=20
>> >>>> I have tested those 4 patches (2 yours, Andreas, and 2 mine that
>I sent
>> >>>> here previously)=2E Behaviour of /usr/lib/cups/backend/smb
>symlinked to
>> >>>> patched smbspool_krb5_wrapper seems to be correct: it passes
>printing
>> >>>> tasks from printers without "AuthInfoRequired negotiate"
>directly to
>> >>>> smbspool and correctly finds /tmp/krb5cc_$UID for printers with
>> >>>> "AuthInfoRequired negotiate", where UID is a local ID of a
>domain user=2E
>> >>>> I clearly see this in /var/log/cups/error_log when it is
>"LogLevel
>> >>>> debug2" in /etc/cups/cupsd=2Econf=2E
>> >>>>=20
>> >>>> So, these patches are ready to be merged, I think=2E
>> >>>=20
>> >>> I'm not able to apply your patches=2E Could you please send patches
>> >>> created
>> >>> with 'git format-patch' or point me to a git repo where I could
>pick
>> >>> them?
>> >>=20
>> >> Hello Andreas,
>> >> I have recently read how it is recommended to send patches to
>Linux
>> >> kernel
>> >> and it is recommended to send them as plain text, not as
>attachments, so
>> >> I'm resending them as plain text emails in the following emails=2E
>> >=20
>> > For samba we prefer one attachment as a patchset or a merge
>request=2E
>>=20
>> Ok, thanks=2E
>>=20
>> > I opened one here:
>> >=20
>> > https://gitlab=2Ecom/samba-team/samba/merge_requests/961
>>=20
>> Why are you sure that the root user cannot print using Kerberos
>> authorization? There should be no problem to get a kerberos ticket
>from
>> root and sometimes it can be needed, for example if
>system-config-printer
>> GTK+ GUI is run from root via consolekit or if a crappy proprietary
>> applications works from root and requires printing=2E
>
>If we are root and have a valid kerberos ticket and we want to print a
>doc,=20
>there is no need to do any uid changing and trying to find the
>credential=20
>cache=2E We should just call smbspool directly=2E
>
>Rembember: smbspool_krb5_wrapper is there to switch to the uid of the
>user=20
>printing the document, so that we get access to the krb5 credential
>cache=2E If=20
>we're already root:
>
>a) we already are the right user
>b) we have access to the krb5 credential cache

I see, sorry, forgot that smbspool is capable of finding krb5 ccache=2E Th=
anks for explaining=2E

