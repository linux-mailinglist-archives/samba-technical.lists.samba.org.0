Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8630454E
	for <lists+samba-technical@lfdr.de>; Tue, 26 Jan 2021 18:29:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hTM0NuHHHR/M2bebc/zmAf5vsbPcSrrHw4HEYdLtLIo=; b=JRDPwFh7XguazA/8Op4jbLYuP9
	91xQPGxHyYF/yJ2+uqrRGiQfTD+vOR8ew/nrhFSqc38qOt6lLlodBoNgWmk1ciebbxKf5vRZ3BuJ9
	UG4mPJE2CjDSHgaMFbmREkAGEMW6GfQ7kMEx7iuRiup1kXUIl7hUoYPR/2EcgAFEg2wCsfZ7zJfbp
	zHzCCanP99XiAios0pnw5TjIz94D3E6/KQnqCT8PZoVhDANGdTwa1Ol3+Acxo+xfVvx4AiutQyOes
	SDXwm7+fYt3cfzmXQFf9OYEJ5XWnHnqjKAwefVsxAAq4uVSwWNRGYeyabC0/xWXYss9YrAWWzcS8a
	5Rsnk5Xg==;
Received: from ip6-localhost ([::1]:40014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4S8x-007GQ0-48; Tue, 26 Jan 2021 17:28:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13154) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4S8s-007GPt-M8
 for samba-technical@lists.samba.org; Tue, 26 Jan 2021 17:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=hTM0NuHHHR/M2bebc/zmAf5vsbPcSrrHw4HEYdLtLIo=; b=OyDkAvAyA1Vjn705aLAHjab/JV
 IH4+7chrLjA/fNdmx0eSkScyM7wOj1cZ5vLuSInG36dTS3AO7VKXHWmQ4doJYHFcnwneKMzr03QLl
 zEM/Z/B1PAC+20YfqFPdVtUJiRvfFcoTwH05kIeT0vHJiWVmTx1X7CPNTFhC6mBcryE1WoTdZfDhO
 q3k29NW9ePGlg1cTHTbzffSSKTBBbnuP3sJ1fr34yqSpEoCTlNa/HoLQJCFL2ujVRFROyRlvnI5LG
 bthpJ/XyNoiOAZ79N+i60IYWlFSxJ7dXoSbswv/Sk12wi9czdr7qG6ccwT9y31k+kTvVahyBBhOaX
 JsgqrawgthMLKrDnq7CdsvW1426QdTUcobKmyaMBsOFe+lw5MKEjo93CEFFdNwZ2UNV984QO0Zq7t
 ObqyU/uO38JfveybvHfMa6f824t92PkEkyXgUWUyUZ29fYprT/IIh2GdDDkY1hmmLSNCIEFBaSWoB
 4X1DWiqUyXQ9jsHiVXKcBvdS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4S8q-0005nO-03; Tue, 26 Jan 2021 17:28:37 +0000
Date: Tue, 26 Jan 2021 09:28:31 -0800
To: =?iso-8859-1?Q?J=F4natas?= Hudler <jonatashudler@gmail.com>
Subject: Re: Fwd: Help Needed: Samba share slow to query not existing files
Message-ID: <20210126172831.GA966050@jeremy-acer>
References: <CAGha7mH29snpcpmK14800yWynZVgJDEVTvQBTi31u5-9HBP3JA@mail.gmail.com>
 <CAGha7mEdy-B29PMUzkxtiznNZJvwdo21fiwnh2kq7hf7tYKBAg@mail.gmail.com>
 <20210120182055.GD29063@jeremy-acer>
 <CAB5c7xpvSsM5oaPtQpJ-D92AFV6oHf-h37WAAZedsWckTtGRKg@mail.gmail.com>
 <CAGha7mE2YTnwKhERFU5z4zvsYJoExLaNamzNfMA59MUxEo8RGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGha7mE2YTnwKhERFU5z4zvsYJoExLaNamzNfMA59MUxEo8RGQ@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 26, 2021 at 09:23:36AM -0300, Jônatas Hudler wrote:
>Thanks everyone for all the suggestions and sorry for taking so long to
>feedback.
>
>Jeremy's diagnosis was spot on - we applied the automatic case conversion
>feature, following the parameters suggested (thanks!), dropped the
>directory lookup lag drastically.
>From my measure, performance is now more than an order of magnitude better
>(for a given operation, dropped 30s to 2s).
>
>PS: There are some other questions that were raised back to me (Samba
>version, why the others settings applied, ...) that are managed by my
>client's IT support.
>Since the issue is now solved, I'm not gonna bother you further with the
>details, but I'll suggest my client to review/upgrade versions when
>possible.
>
>Thank you all again for the prompt support!

No worries, I'm glad we were able to help you solve the problem !

