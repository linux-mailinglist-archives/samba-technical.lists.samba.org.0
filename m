Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4F8B5FE8
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 19:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=RjEQWBHoZ0zZnoVtfOmdzxbT0U72qNEGw0dJoEOJAAg=; b=j/lXwSaN8NnIx6IfRvXrXn3qvX
	krbzyVmgQuRFpv/g6G9800G/mGKvqNZgOf0luS5t08gSUjqFw+oSwvv+QjPaS/BIk1l1awhpun0r9
	2Q/hWE+wZ83i5enBgU9KLQjLGIh3vZhbxUdv9r4adkg8mwWHaO4v7XTGJGZ0UkVkqVFPhHNcVyAzj
	DX3XBNRI8M+FFlo+newgCnj2+NexfB3ZnpknYHCaBrExbRz17YCgVUYaKKYzCU2TmmDpKtNaI6KcO
	yXpjHc1+bAgutKRAfnghaXF+LwMwfBpyCF+ylNWmhnlLkjwNWHq6d+OSzjSCu9ObMz9x2bVeyWDYw
	qQuucVEg==;
Received: from ip6-localhost ([::1]:30338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1Ucq-0061Qi-EE; Mon, 29 Apr 2024 17:17:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56416) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1Ucl-0061Qb-IW
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 17:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=RjEQWBHoZ0zZnoVtfOmdzxbT0U72qNEGw0dJoEOJAAg=; b=ysU78YWyv57eeavk2pxJHcQkrc
 njE6BuKCz58AUKUJVHwOEWHVee4O8DsxbfTRh3/FmnXtzooVXO4Sf1TEDYcbqYQ1Y2g6vc+AMXIE6
 ADRIUxa7M8gWEG+ESQILKirh+26rdhyGMq3pGHa5+MDxKiF2OWGJunNR+63U9ZFvqQxbch2yFASaB
 +CfpTKoX7sFnkyVLYkaJv6cvcUpctUt5QHs2ZSv74PR42A8bjJAwvV6NplmrMMKzJLQ2wld1tHIgD
 7/SzdBGQq1vWRa46St6j3mGy0fWgVguEUGqmJL399EIlW2sVfG29NgLW2tc9nmo5zUY8k6xwS9iv6
 +Fc2FtmVpy8sUAxtKG+S0neiMrQnE6gomJGGzkKqizycaBu0EvuigYHMH92ax18r1lz1sHlgHERD0
 gDt6gEqgbppFU8OwkYEgkjG93Fk/BBgAX0pWzf3OeVAzU9iYdIKl3MREO2MdN97t2YHo8bVAsOXme
 F3Gz/jD+Jk8W/+219B8h5n2J;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1Uck-008yMJ-0o; Mon, 29 Apr 2024 17:17:06 +0000
Date: Mon, 29 Apr 2024 10:17:03 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: Samba ctime still reported incorrectly
Message-ID: <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
 <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Apr 29, 2024 at 10:51:21AM +0200, Ralph Boehme wrote:
>Hi Steve,
>
>On 4/28/24 9:41 PM, Steve French via samba-technical wrote:
>>I did another test of the Samba server ctime bug on Samba master
>>(4.21.0pre1) and Samba server is still broken in how it reports ctime.
>>An example scenario is simple, creating a hardlink is supposed to
>>update ctime on a file (and this works fine to Windows server and
>>ksmbd etc) but Samba server mistakenly reports ctime as mtime (unless
>>you mount with the "posix" mount option).  This e.g. breaks xfstest
>>generic/236 when run to Samba
>>
>>More information is at:
>>https://bugzilla.samba.org/show_bug.cgi?id=10883
>
>I wonder if this is a bug going back as far as 
>c9dca82ed7757f4745edf6ee6048bd94d86c4dbc
>
>@Jeremy: do you remember why you chose to return mtime in 
>get_change_timespec() and not ctime?

If you look closely at that commit, you'll see
that it's actually not changing the logic that
previously existed :-).

-       put_long_date_timespec(p, m_timespec); /* change time */
+       put_long_date_timespec(p, c_timespec); /* change time */

Previously we were using m_timespec as change time,
and c_timespec in this change now comes from:

+       c_timespec = get_change_timespec(fsp, smb_fname);

+struct timespec get_change_timespec(struct files_struct *fsp,
+                               const struct smb_filename *smb_fname)
+{
+       return smb_fname->st.st_ex_mtime;
+}

So I actually wasn't changing what we already were
doing :-).

Now as to *why* we were using m_time instead of c_time,
my guess is that we were trying to emulate NTFS
semantics which were not documented or well understood at the
time (where "the time" is probably prior to 2009 :-).

