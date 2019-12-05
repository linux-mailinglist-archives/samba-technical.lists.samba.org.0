Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F601148A3
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 22:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=CGzdhdwYKqmovwfHQS6G62+Oo3pcL9W9WImfCXAzqe0=; b=poph2IC+C8/AYQLc+UxCNZMgEI
	qISvtiNhswSZE0BDyRqWewwAkTSy0UTo4SB9L0/AxNPMf0XMZJ9toJjyhMY4I5e/CBgZBRs4+wM9i
	Nb6BnK9hUjGMW8Z3itm6mCmyCU0E/crrrUvUUjHE2yOIfz6dCKht8i3lJmrQQSomn0S7BrR2rSDrG
	UuYIPgC7C+42VaBbpmln5oOiiypJmOezfLdkCrYsXKxeZhO4z36qm+aT3hD1Bi5WSjw+anGFXVqaQ
	Hu9eR9uQ0k84dbn+h0q3jdhADO1bxSsEA1GB5nKlsuiTJ8sQT6OryJ0YEvPtcHcwIVQVmZHmFokyU
	+881xbRw==;
Received: from localhost ([::1]:50018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1icyfQ-006KUp-UZ; Thu, 05 Dec 2019 21:28:09 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:52446) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1icyfM-006KUi-65
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 21:28:06 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id E0F1CD52D830D;
 Fri,  6 Dec 2019 00:28:00 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id emwgcocprsvv; Fri,  6 Dec 2019 00:28:00 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 80D07D533E646;
 Fri,  6 Dec 2019 00:28:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 80D07D533E646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1575581280;
 bh=CGzdhdwYKqmovwfHQS6G62+Oo3pcL9W9WImfCXAzqe0=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=EWRfqJ8A1xpKpm4fhAxURx/XwindJMAA2nW1PN5zBAr5l3Hgz96X0No1zF/EvZFk7
 pZXIQTMBHosL3NW/MhEF44xFKJuOIH391ZEyMkHkfDKpmmzDiU/JgzYlPPGMLmIXHC
 PQmmTY0Jo9A5LuHd7R3FLKMenUaH/zLEOC7gjtRuAhY5eMzau2QmDjmJ7NDlB+R9t+
 7DS02+Qr77Fwxhq2D/f7WWS7xAwp74CVg32KDVgpN7TTJgVyKSJIKlDuu4ZLbV81qZ
 xH67B2H7+qlI5ifx/1sGfVxKTDe6Obn0UXt/Z1jE8sCuF/f51Elg77SMViJbyP20jd
 48kXwEiW64NVw==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mTIvd2TCxwa6; Fri,  6 Dec 2019 00:28:00 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-11.ip.moscow.rt.ru
 [90.154.70.11])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 55CCFD52D830D;
 Fri,  6 Dec 2019 00:28:00 +0300 (MSK)
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1574444045.gU553saExv@magrathea>
 <c767314c-4517-20f1-538f-7a34a35c1086@rosalinux.ru>
 <1925046.vXGPc2B9mm@magrathea>
Message-ID: <2c1be5c9-45c3-7807-2c02-4654a3055305@rosalinux.ru>
Date: Fri, 6 Dec 2019 00:27:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1925046.vXGPc2B9mm@magrathea>
Content-Type: text/plain; charset=utf-8
Content-Language: ru-RU
Content-Transfer-Encoding: quoted-printable
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


26.11.2019 19:20, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Tuesday, 26 November 2019 00:49:08 CET Mikhail Novosyolov via samba-
>> I have tested those 4 patches (2 yours, Andreas, and 2 mine that I sen=
t
>> here previously). Behaviour of /usr/lib/cups/backend/smb symlinked to
>> patched smbspool_krb5_wrapper seems to be correct: it passes printing
>> tasks from printers without "AuthInfoRequired negotiate" directly to
>> smbspool and correctly finds /tmp/krb5cc_$UID for printers with
>> "AuthInfoRequired negotiate", where UID is a local ID of a domain user=
.
>> I clearly see this in /var/log/cups/error_log when it is "LogLevel
>> debug2" in /etc/cups/cupsd.conf.
>>
>> So, these patches are ready to be merged, I think.
>
>
> I'm not able to apply your patches. Could you please send patches creat=
ed with
> 'git format-patch' or point me to a git repo where I could pick them?
>
>
Hello Andreas,
I have recently read how it is recommended to send patches to Linux kerne=
l and it is recommended to send them as plain text, not as attachments, s=
o I'm resending them as plain text emails in the following emails.


