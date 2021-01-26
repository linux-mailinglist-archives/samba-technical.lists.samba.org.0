Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAED303CEE
	for <lists+samba-technical@lfdr.de>; Tue, 26 Jan 2021 13:25:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DpiDpcuzDnCiJdeFyD4W/epEEtCiMnPK1spoOy4iiVE=; b=RQrp3GSJRUaVj9aJ+Bi4X6UdCP
	UUBlLR0WwVfxNBNIGdPA86EIbiWOfKCghvAGopPXDV6MFrQAJrstguqoPm1WnRTtE5rj4e3ng67o2
	qwL3UAMDZRh2NJiJyLhZ0Ackcc5YG1s+O6nMS97rzvaDHFGvyUNDQNR4IyvFBlGBrZlbU/n/ICtRW
	c6/F1BZ8ts2autqtwcCL3HMSLmnIs+NJ1P6HO3yNFmUJ2kq+tzjAPQPW/LM17+rxM2sEnhhIltNcd
	aw0SrAbRqViIAvbhJSEEfJHoP3Gb6xTOENSde1IYKXkCrH0oKG/68RPVFAEMK/vtvxRKla2orM91B
	j+3WYVnA==;
Received: from ip6-localhost ([::1]:24566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4NOe-007DZm-9M; Tue, 26 Jan 2021 12:24:36 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:40370) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4NOU-007DZf-4r
 for samba-technical@lists.samba.org; Tue, 26 Jan 2021 12:24:33 +0000
Received: by mail-yb1-xb30.google.com with SMTP id w24so16524191ybi.7
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 04:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2lDMilEJxO3f2tv0CevaYJBNPTQiWPAloZu1mLgTGnE=;
 b=NqCMpVOl4iK+AkzSPCU7SHcGB30L8slTtRVxYmEloQMiVig4yeVqEddjMmhaxmJoCp
 h2BcG573Y6fwIAXCrK3DuPLLtrTBw8brqFpTp6/06c05enb6SzDhd0D1YdcOlqw8XU6p
 EteAkQ2qxRME2/BZ/zviESTGArZHRVPdd/CWTj0ZPGDM9E8yTezVJPTGgTLIcW3jIH80
 UEkhRNB5MTg/IgQBATxJjUAiAral+DbIUlzD7QIHzV1iRWYTY0CmU5Ab1CcYtpz2sw5P
 DaH2wO6ZN3i3KXOGpjCI6HocnUcz5803DHnd9I2HreAeHZKBbgXQJm1gS8TJPCKga6X2
 8JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2lDMilEJxO3f2tv0CevaYJBNPTQiWPAloZu1mLgTGnE=;
 b=aA2K/61YhMyvfvAi8K5X79QwcDXXjw3dbo/n8bRkGdxHf9hBvWaEkoesJXQFkUkRGc
 jnUn+kJQIzOJUMl5qvaauJsfEa2biKzAxuyLfqqngctxrD1Yym0yoieoj2YhB8IRq3W9
 FVCyd7jRfOB+gprga2y1E+ppSp4z1Yhi0ZEIdn19gtSQFPFrqa2rf+rkTqhDbhWE1t0S
 58Td2XCYmuBblL7E4zGEblvEZYnNOKNjTpP+PjHy6lIGDEWTQV2xpJo/kooj032e34ut
 wYx6on2XPSYuzBLOM1cAfSIjmzg+hzyXj4vpyGTnZ+vAkZyUnYIPB/C2/A9f1hiLr10R
 5OJQ==
X-Gm-Message-State: AOAM532IUN07VIZX9D4iEQPmqXQrUOYencWx7SAEMGmRk/TbnZf7qw7d
 2QGhx0Kh4c0lokWhasq0wxMEVAF9HBEMI5g+YZfJF+3/rLQkB41x
X-Google-Smtp-Source: ABdhPJxlOH7PWZEbQuzvcVESfODuSc9cHyZajz47rCr2ZDdfaz+Or8Tiv28bviEE3kKRs/tu2fLn7gUJ+ZsNx7SGCJc=
X-Received: by 2002:a25:73c7:: with SMTP id o190mr7919803ybc.482.1611663851335; 
 Tue, 26 Jan 2021 04:24:11 -0800 (PST)
MIME-Version: 1.0
References: <CAGha7mH29snpcpmK14800yWynZVgJDEVTvQBTi31u5-9HBP3JA@mail.gmail.com>
 <CAGha7mEdy-B29PMUzkxtiznNZJvwdo21fiwnh2kq7hf7tYKBAg@mail.gmail.com>
 <20210120182055.GD29063@jeremy-acer>
 <CAB5c7xpvSsM5oaPtQpJ-D92AFV6oHf-h37WAAZedsWckTtGRKg@mail.gmail.com>
In-Reply-To: <CAB5c7xpvSsM5oaPtQpJ-D92AFV6oHf-h37WAAZedsWckTtGRKg@mail.gmail.com>
Date: Tue, 26 Jan 2021 09:23:36 -0300
Message-ID: <CAGha7mE2YTnwKhERFU5z4zvsYJoExLaNamzNfMA59MUxEo8RGQ@mail.gmail.com>
Subject: Re: Fwd: Help Needed: Samba share slow to query not existing files
To: samba-technical <samba-technical@lists.samba.org>
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
From: =?utf-8?q?J=C3=B4natas_Hudler_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?J=C3=B4natas_Hudler?= <jonatashudler@gmail.com>
Cc: Andrew Walker <awalker@ixsystems.com>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks everyone for all the suggestions and sorry for taking so long to
feedback.

Jeremy's diagnosis was spot on - we applied the automatic case conversion
feature, following the parameters suggested (thanks!), dropped the
directory lookup lag drastically.
From my measure, performance is now more than an order of magnitude better
(for a given operation, dropped 30s to 2s).

PS: There are some other questions that were raised back to me (Samba
version, why the others settings applied, ...) that are managed by my
client's IT support.
Since the issue is now solved, I'm not gonna bother you further with the
details, but I'll suggest my client to review/upgrade versions when
possible.

Thank you all again for the prompt support!

Jonatas Hudler


On Wed, 20 Jan 2021 at 15:34, Andrew Walker <awalker@ixsystems.com> wrote:

>
>
> On Wed, Jan 20, 2021 at 1:21 PM Jeremy Allison via samba-technical <
> samba-technical@lists.samba.org> wrote:
>
>> On Wed, Jan 20, 2021 at 02:37:45PM -0300, J=C3=B4natas Hudler via
>> samba-technical wrote:
>> >Hello everyone,
>> >
>> >*(First mail in this mailing list, so take it easy if I'm infringing an=
y
>> >good manners here)*
>> >
>> >In a samba share we have a directory with lots of files - binaries and
>> >resources to run our ERP application (around 20K entries).
>> >
>> >The application is taking too long to load. The found reason is that th=
e
>> >application tries to load several files in a trial/error fashion, looki=
ng
>> >for extensions in a particular order (e.g: file.dll, file.lbr, file.gnt=
,
>> >file.int). Many of these files are not required and doesn't even exist.
>> >
>> >Every "not found" hit take ~0.2 seconds. And there are lots of these
>> events.
>> >
>> >The thing is that apparently samba is not caching this result. My guess
>> is
>> >that every new not existing file open request causes a full directory's
>> >entries lookup.
>> >
>> >If I run this code (in a Windows Command Prompt) in this samba share, i=
t
>> >takes considerable time, whereas in a native Windows share it is
>> >instantaneous.
>> >
>> >  for /L %i in (1,1,50) do @dir \\server\share\not_existing.txt >nul
>> >
>> >Anything that can be done?
>>
>> You are running into the classic "large directory performance"
>> issue, caused by Samba having to run on top of a POSIX case-sensitive
>> filesystem.
>>
>> Here's the brute force fix:
>>
>>
>> https://wiki.samba.org/index.php/Performance_Tuning#Directories_with_a_L=
arge_Number_of_Files
>>
>> NOTE!!! from the text:
>>
>> "All files on the share must be converted to lowercase when using the
>> example.
>> Files using uppercase or both uppercase and lowercase are no longer
>> listed on the share."
>>
>> Or switch to a filesystem the supports case insensitive
>> lookups (I think xfs or zfs can do this).'
>>
>
> One quick note about the zfs side of this. "casesensitivity" is an
> immutable dataset property, and so it _must_ be set when the zfs dataset =
is
> first created.
>
