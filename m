Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4888A114C5E
	for <lists+samba-technical@lfdr.de>; Fri,  6 Dec 2019 07:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=1fyk5Qou/a96bWi75Wm0AaQ5Dy1mS6/SXf7DUK7kwr0=; b=2O+D2zqz/J/DmPHkq6ilaB89nA
	aA7CmJvyidWACAuceUTaJKTOF+5ZChDkh7RKd21MH2mkZxnzkHTaRCs21OPudHqBIkHRaINSktWj6
	GtI+P+YmfmKWW9UgcEytzUCaJo8rLiMEjOhSwYO8R2Sfb+2nZ7G3ryC6DfOTjIsEgobA27FC33JD1
	eB4YxDbSqi7w0F4bsestKYxfAQOR5jgaPerJ0sQVt3+ZFQsGdNyZWGZ3JQzmKn1qV7Ssb+KCwaVSu
	h5fh1KKScbjS0RvXMQlQj3Qf0NJHhp1b6Mms2rMmBofJkL4dWgUvVxuiFsfj/+cWR4KiHpNsSe5Mi
	88uN5BcA==;
Received: from localhost ([::1]:57848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1id7Eo-006Mwl-4b; Fri, 06 Dec 2019 06:37:14 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:41912) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1id7EW-006Mwe-4W
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 06:36:59 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 5862FD53FC3E4;
 Fri,  6 Dec 2019 09:36:51 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id sxVRqd7FPuvU; Fri,  6 Dec 2019 09:36:51 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id E1C98D53FC3E3;
 Fri,  6 Dec 2019 09:36:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru E1C98D53FC3E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1575614210;
 bh=1fyk5Qou/a96bWi75Wm0AaQ5Dy1mS6/SXf7DUK7kwr0=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=twm6BQ+18bukns1pIDXKZEljNE7Of69omrnS4FVAPfR/5RUd/VqIDuKdGHfxqwDlC
 mYaXQ0O4zcWi0dI2QHbEUvIYRz8vIov00otqhl7MPkoYMC/YdqL0tUc45bSU8t7kJI
 Wkn9VxHGBUC7K2IQyxRkwt4WgXGhnOCEfMJeUz62OyU8ine2Ge28RrPRuZ/ihCjd7q
 ftqd9yzt7qKOm9yNeI9VyML+x26L25p8sIg7YpGUwnzNz5D+yHzeA5qxK4Pqs5p6sb
 QWcAJS4GyQ/BCFuO2FLCz68wdbPHmg0KYw29fFke6GelnmYSZsaPU8iXkYpDASA6Xd
 RFboT7ShMD+UA==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9mvXTBuMIAkL; Fri,  6 Dec 2019 09:36:50 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-11.ip.moscow.rt.ru
 [90.154.70.11])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id B5B55D53FC3E0;
 Fri,  6 Dec 2019 09:36:50 +0300 (MSK)
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1925046.vXGPc2B9mm@magrathea>
 <2c1be5c9-45c3-7807-2c02-4654a3055305@rosalinux.ru>
 <3533791.v9fxMDVjKa@magrathea>
Message-ID: <c5977820-2814-183b-d29b-01fab733a995@rosalinux.ru>
Date: Fri, 6 Dec 2019 09:36:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3533791.v9fxMDVjKa@magrathea>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

06.12.2019 09:30, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Thursday, 5 December 2019 22:27:59 CET Mikhail Novosyolov wrote:
>> 26.11.2019 19:20, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On Tuesday, 26 November 2019 00:49:08 CET Mikhail Novosyolov via samb=
a-
>>>
>>>> I have tested those 4 patches (2 yours, Andreas, and 2 mine that I s=
ent
>>>> here previously). Behaviour of /usr/lib/cups/backend/smb symlinked t=
o
>>>> patched smbspool_krb5_wrapper seems to be correct: it passes printin=
g
>>>> tasks from printers without "AuthInfoRequired negotiate" directly to
>>>> smbspool and correctly finds /tmp/krb5cc_$UID for printers with
>>>> "AuthInfoRequired negotiate", where UID is a local ID of a domain us=
er.
>>>> I clearly see this in /var/log/cups/error_log when it is "LogLevel
>>>> debug2" in /etc/cups/cupsd.conf.
>>>>
>>>> So, these patches are ready to be merged, I think.
>>> I'm not able to apply your patches. Could you please send patches cre=
ated
>>> with 'git format-patch' or point me to a git repo where I could pick
>>> them?
>> Hello Andreas,
>> I have recently read how it is recommended to send patches to Linux ke=
rnel
>> and it is recommended to send them as plain text, not as attachments, =
so
>> I'm resending them as plain text emails in the following emails.
> For samba we prefer one attachment as a patchset or a merge request.
Ok, thanks.
>
> I opened one here:
>
> https://gitlab.com/samba-team/samba/merge_requests/961
>
Why are you sure that the root user cannot print using Kerberos authoriza=
tion? There should be no problem to get a kerberos ticket from root and s=
ometimes it can be needed, for example if system-config-printer GTK+ GUI =
is run from root via consolekit or if a crappy proprietary applications w=
orks from root and requires printing.

