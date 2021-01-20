Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 220EF2FD826
	for <lists+samba-technical@lfdr.de>; Wed, 20 Jan 2021 19:21:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=FV7MwtDxxTkceOL6iq8xT8VvmXwowezxKyauAClUrIs=; b=qsYELva3dBglRjBXQqtW52vcZV
	R0DSXvSURXKyXW4ZTFvAqHn0lBlFTZoAEjFZBKgppYHu2FIMKAQFhWrXL6r6O0dlV058mm0NpKsoh
	YtXiOQnpTwzHo2JQOzczA3r7r0dgZ+i7ixFLWhaWrXHVacs+Bjvsq27M1/IYlUZKipe3DAMFvliLT
	7dwNVZuU5+lvR3/vWv8rq/mFykMzMk/5B95eZ+fnh5atbe+H/TuIn1cvMabzNMiE2Dfi5v9jOKc3q
	1szfMzac7DEpGQSBaKJm+sN1RA82Gojvxekjx7J6SLXyMJO4fAaJpppO4HVXq+95mQEsvDmIuSoYy
	QchuJOFg==;
Received: from ip6-localhost ([::1]:19226 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l2I6O-006NTL-Ah; Wed, 20 Jan 2021 18:21:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l2I6G-006NOj-5l
 for samba-technical@lists.samba.org; Wed, 20 Jan 2021 18:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=FV7MwtDxxTkceOL6iq8xT8VvmXwowezxKyauAClUrIs=; b=dA1TW2FlbLn5eeqCYqdBna2Qqo
 sQ1eY9nNZjIN1kzOcHPJu5quLqfc+o2pq9hwYLvgCj8mwDGspP2D/HHtKriMgLfVxeOtVPVzxhf2Z
 NtwbKEdjs0Q0OVlTpt6EwOtuY86naQs0430+gf7R8kJcIjYgBxlTnXF0WIKOTJJm0LWqn7Uprt4By
 fqZC5Pr9PBmF8ayEiiDG461jX022tKuC9QGa2QPW53a5VyqyHRvq6NSxHl8bjPDKKmz3Cb+L7GZ0A
 WWZvi58p6XWYeVAu1HwDBsfAAI4CboUPlpTvtD2u/qF2/znVVnN9FI7kejmiUS45n3gIa6foOO2G9
 MRGnGZKfHo8rxYH/NzUmZv1lTa6ZMPbQvRIzJpN46KTiZAN6UCM4xfVfCf+WtPnBD+dt+L9e/3WtO
 spU+XPEvahDvbD/mNyuQdNRtDfzhwPMMJor421UWm0JxtJfmjq1wPFbe3RUWTCk5PQ6k/pliOrrvN
 xznZyhkIBFjgqc8kINtKqpQ7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l2I6E-0006p6-9z; Wed, 20 Jan 2021 18:20:58 +0000
Date: Wed, 20 Jan 2021 10:20:55 -0800
To: =?iso-8859-1?Q?J=F4natas?= Hudler <jonatashudler@gmail.com>
Subject: Re: Fwd: Help Needed: Samba share slow to query not existing files
Message-ID: <20210120182055.GD29063@jeremy-acer>
References: <CAGha7mH29snpcpmK14800yWynZVgJDEVTvQBTi31u5-9HBP3JA@mail.gmail.com>
 <CAGha7mEdy-B29PMUzkxtiznNZJvwdo21fiwnh2kq7hf7tYKBAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGha7mEdy-B29PMUzkxtiznNZJvwdo21fiwnh2kq7hf7tYKBAg@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 20, 2021 at 02:37:45PM -0300, Jônatas Hudler via samba-technical wrote:
>Hello everyone,
>
>*(First mail in this mailing list, so take it easy if I'm infringing any
>good manners here)*
>
>In a samba share we have a directory with lots of files - binaries and
>resources to run our ERP application (around 20K entries).
>
>The application is taking too long to load. The found reason is that the
>application tries to load several files in a trial/error fashion, looking
>for extensions in a particular order (e.g: file.dll, file.lbr, file.gnt,
>file.int). Many of these files are not required and doesn't even exist.
>
>Every "not found" hit take ~0.2 seconds. And there are lots of these events.
>
>The thing is that apparently samba is not caching this result. My guess is
>that every new not existing file open request causes a full directory's
>entries lookup.
>
>If I run this code (in a Windows Command Prompt) in this samba share, it
>takes considerable time, whereas in a native Windows share it is
>instantaneous.
>
>  for /L %i in (1,1,50) do @dir \\server\share\not_existing.txt >nul
>
>Anything that can be done?

You are running into the classic "large directory performance"
issue, caused by Samba having to run on top of a POSIX case-sensitive
filesystem.

Here's the brute force fix:

https://wiki.samba.org/index.php/Performance_Tuning#Directories_with_a_Large_Number_of_Files

NOTE!!! from the text:

"All files on the share must be converted to lowercase when using the example.
Files using uppercase or both uppercase and lowercase are no longer listed on the share."

Or switch to a filesystem the supports case insensitive
lookups (I think xfs or zfs can do this).

