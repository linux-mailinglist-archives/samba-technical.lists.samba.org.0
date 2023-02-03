Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E035B689E07
	for <lists+samba-technical@lfdr.de>; Fri,  3 Feb 2023 16:23:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LmpM7BiL3pQ0/vUxXnsNJHEATVKJP5ZAIE3J9X652ww=; b=UKGAJLXOF3rDdPjIXmc2f3s62c
	zslp6w2L6CnceMPR+ANDvOyjjeRwy1RAmrf64n4W/VRS9+Y5SbrXo6/VYRoOhdQzWf3vDUoO7VKRk
	xLLNcu8jVJ5g9IQ8mh2/hxXLxFfS3tR9dijn6iNSscmMlpyOjEbz+NfHv0K8bfWYZkY2MZAPn/js5
	+9PTD3xIGViwsqc35LvCC9KvUz8SKuk/k+EWnadkFgoF34oY9YW8DskW6QwRxzIRrGNmCLPMHHl/t
	R6FFdV3n6X+/JgVwb7cVl6WUzWBP+t8fSTUYrXDrwECOpiX8N7h4GHJMr9wknJRNvCETwz0v9pUQM
	Q7pt7eeA==;
Received: from ip6-localhost ([::1]:51710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pNxtP-008ZW5-4u; Fri, 03 Feb 2023 15:22:23 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:42750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pNxtI-008ZVu-Ar
 for samba-technical@lists.samba.org; Fri, 03 Feb 2023 15:22:18 +0000
Received: by mail-qk1-x736.google.com with SMTP id p16so2549698qki.9
 for <samba-technical@lists.samba.org>; Fri, 03 Feb 2023 07:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9FFerqj6Ji/6oi1pSMbQevW/lJpYSxsPxp8xSTq1mvM=;
 b=g35wndGU+LzoijkmzRVUiStekB4Nb23mvQUYTzHZr0VMxi1801SG0/FplsdApRN8sT
 YvoNxV47r2gFslBKqoooL+n4c3QmfslHBE1fzCkWLn0fyqYkFSPNk78YtmXd//L51SuW
 uDFcqJBvM+c8iQQ8jnklfw0+9+OiTVBcB2nyvBxg0Zq2i2240zaBUS0+/25l1nvbwBmj
 PbUUY3oxQo+HLjAixZYv1a//XvfxybSwHzjQNm6qOnCO2XReW4M9h3RMBWJO99i3WWrP
 /9ji6XNiDnSQYcaQzLdd41eHc9sQYsJLWS4LPvXaRNw3C86OJ544SYM0UiOIuW7PcH+f
 NjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9FFerqj6Ji/6oi1pSMbQevW/lJpYSxsPxp8xSTq1mvM=;
 b=LCcau6Dwa5wn4De8Knj4Fwps7YMP6q2eCznMH9n2X00U6UA77kBMz5AX0ilKX9hXhl
 +p1bgY4HiiueAdYm4CX/ym5ktAfzkANMnwZJAsq/ApEthOiCu8B2f4L54i0gF9Hr/zIv
 KArNpUTyXARDwyD/MFy3gBCH0EJcsBszglwFG+x5GOyx4JYv+cEke7rBh4jC/MErWuE3
 2KsmysvbLiKc1b4k8xh6RYp8/fKh8sIUEMyUt1XaC5frkl6kFrgHE9ebhPxINVy51I0t
 Uju9383XN4Wa7Zm/+yXH22WOVFFaNFu+0uDIZ5HG57gW5RlFgM/0mZetEn2FeFaWN0vE
 F5ag==
X-Gm-Message-State: AO0yUKXrBNrm34n4tCifxmgzE3uuWsOG3ydcqB+HBb/JUWkhZWBzaMEc
 0ftJ0Md4zbrr0V/xaR8fhNcwO3pmqaXbB6ttIVlbLkzpIgw=
X-Google-Smtp-Source: AK7set+FqUwN+OhhqFYCZrHZg0qA1wEZQeYJ1vEIfDmwYrTUM/Vf3WJszRp2K+okHOQL+tbmlwkA2C/K7/Vz6ehNd6A=
X-Received: by 2002:a37:f618:0:b0:721:b8f3:ad9f with SMTP id
 y24-20020a37f618000000b00721b8f3ad9fmr839484qkj.70.1675437734117; Fri, 03 Feb
 2023 07:22:14 -0800 (PST)
MIME-Version: 1.0
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
 <Y9QgJwNzUh9EQFQV@jeremy-acer>
 <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
 <Y9QuBd7wf9hfbpT5@jeremy-acer>
 <CA+RDaRAxOKK9FmwOFrh=ZNkw1ZP7xZiyah=NjKjjxvs7HnK7tA@mail.gmail.com>
In-Reply-To: <CA+RDaRAxOKK9FmwOFrh=ZNkw1ZP7xZiyah=NjKjjxvs7HnK7tA@mail.gmail.com>
Date: Fri, 3 Feb 2023 20:51:57 +0530
Message-ID: <CA+RDaRAY7WLbZf=8Bp=jA0X435SvoQLFv7EK-WcbFCpPy67S4w@mail.gmail.com>
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: varun mittal via samba-technical <samba-technical@lists.samba.org>
Reply-To: varun mittal <vmittal05@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was able to narrow it down to the "Named Streams" bit in
"FileFSAttributeInformation" response.
When this value is toggled from 0 to 1, as is advertised by `streams_xattr`
VFS module, Robocopy
switched from FILE_OPEN to FILE_OPEN_IF.

Thanks

On Mon, Jan 30, 2023 at 1:33 AM varun mittal <vmittal05@gmail.com> wrote:

> I made some progress on this.
> It seems the `streams_xattr` VFS module is making the difference.
>
> On Samba-4.9.5-Debian, which was not working earlier,
> once I disable this module Robocopy changes the CreateDisposition flag
> and it starts working. But I could not spot the difference in traces
> https://tinyurl.com/robocopy-issue
>
>
> On Sat, Jan 28, 2023 at 1:33 AM Jeremy Allison <jra@samba.org> wrote:
>
>> On Sat, Jan 28, 2023 at 01:27:36AM +0530, varun mittal wrote:
>> >   > Wireshark will be the key. Compare between Windows server and Samba.
>> >   That is what I thought and have started looking. Any suggestions on
>> which
>> >   call in particular, there are so many :)
>> >   BTW, with a Windows server, the flag is FILE_OPEN_IF
>>
>> Well that's at the point you know there's a difference,
>> so work back from that point. Try bisecting the trace
>> to see where it starts to diverge. No tools for that
>> so you'll have to do it by hand (something I unfortunately
>> have great experience with :-).
>>
>
