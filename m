Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6964044DC
	for <lists+samba-technical@lfdr.de>; Thu,  9 Sep 2021 07:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hIQgilRYzUpF88X/aOz/Xyq0kY5bkDSL7LbE0BjGlC8=; b=TLeq4GOK5zfnairuugvNE3IYj1
	CWn+cRuzhfckQWi2huWnuwO9Swsrf9CRFUSQ2V0cM2eaXJiFaiStrLcJR84sBj+h7emgSxhFyLiEM
	mmfayo/uNMKLq0ruD5EMC19djFY3/T3fsA+wYZMsjUpCIGHI40sJViyY8p1hdNzZ7MYdVLRMA9FD2
	tvkXnjjq6ehapCjhPOniAbeooiE6Km5ovbAzWxycJn/Mzz2p88do8A4WtEYA72K0EVFUzENiTplEP
	Su79BPpT0XImqT7N2VAO6yjI/XMfsAAAfrnwzbDK9fuoVnj4cKpJAs93v2l5aGzNPhtSXkfxBLP84
	beOftJfg==;
Received: from ip6-localhost ([::1]:57232 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mOCQM-00DyHr-KN; Thu, 09 Sep 2021 05:16:34 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:41763) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mOCQF-00DyHi-Ll
 for samba-technical@lists.samba.org; Thu, 09 Sep 2021 05:16:31 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id p17so446523qvo.8
 for <samba-technical@lists.samba.org>; Wed, 08 Sep 2021 22:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ipI/lwe4AMNAudCkrg4tUwb0ZObtUoxl6kI3gVoI9Ww=;
 b=SGJOvbfGE9+7/WpR8jXPffQ3dEv3uTOIMU1XIMd4InXu/PRgKCO6CU7J/K54RENsP6
 gRuFdYABgiiUpffIYLUzrX0+gnsQPcdVKLDxs8sEKDPZWNUchRgTLD4kjTyCaQbbuVvs
 7DiOQDiR0rCFYQ2VKMomTkHqTuxA8ZoFJcuzh8Cj8MdEQfPSrfkYV2OQyHBJF6p+8n24
 UaVue/dtaBIOR4rcNmM741GBAbqTROkbAHqH4BnmfCLHrYXiFrtHqL/VMSov0pSZLw2y
 VaNpPL65Ud4idevN+JdZba25LpB8fML3aLROB8EeDLsgM7y7K8tGICQUzOXf6Yk2MOpX
 ZJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ipI/lwe4AMNAudCkrg4tUwb0ZObtUoxl6kI3gVoI9Ww=;
 b=zzi0/Y7zTQ2isByVJQM/cdfqj5FOz4LNEKVpXZGQOjkmBe6QjxOAe6hCkfg5VtEMpN
 ThshHcO+Pj5p/7VNk9g0P6WqDIr4W6qqjuzhOE/RPphWxXreASpZFUw8szdmGNs2KiJd
 sw0NSoqAx6QBblO8NGvwJm64I82xvhyRfGyYHNHOcD3i1TMpLuv28ETykaf3AvZ/LgSV
 O47xypG9fNdIZZs5tN8Put7APkn4nyPlJGMAydHRYFZZAjsRA7/GPeBWxWZuAViuzuBH
 twuEnQOsgP8M5wD2uM0M7ZN+WI/NP7CyungwVtNqB6Gr2yLNYeJjZClp6fIJY3EX7z4y
 GbVQ==
X-Gm-Message-State: AOAM532NWpCq6VUImyI5WzdVkAckqW7W2r7jaR1vLwBytqwPY3b/7Vww
 MPOfcNI6Ga9+uA04TGnEpZshSOJ94ECmCdw1upSxog==
X-Google-Smtp-Source: ABdhPJwJy/UXhH7QA0DNi860TGqpvDiMLEgDa/NQGrON3U0FvJrjlYbZPmfWA7O9Uf11x9Z+QmKz4nc7n3QcwxEbTEE=
X-Received: by 2002:a0c:d804:: with SMTP id h4mr1124043qvj.37.1631164584006;
 Wed, 08 Sep 2021 22:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <reply-031540943ffd4db283b8bf3147bd656a@gitlab.com>
 <merge_request_115283584@gitlab.com> <note_671906917@gitlab.com>
In-Reply-To: <note_671906917@gitlab.com>
Date: Thu, 9 Sep 2021 17:16:15 +1200
Message-ID: <CAHA-KoNQo0VmBccX1FyzvoYepu9=Vq8eWPzWS8HtYNXTNOv2Hw@mail.gmail.com>
Subject: No Tsocket Unit tests? - Re: Samba | libcli:dns: SAMBA_INTERNAL DNS, 
 set forwarder port (!2148)
To: "The Samba Team / Samba"
 <incoming+031540943ffd4db283b8bf3147bd656a@incoming.gitlab.com>
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Uri!

Thank you for helping me while I drill into the tsocket library code.

I have been working  through things, and thought I should check to see if
there are any unit of CI tests for the lib/tsocket code and I cannot find
one single written test for that library.

Please show me where these tests are if they do exist, otherwise I am
asking questions about whether I should be proceeding to touch that library
with new code for stability reasons, until a full test suite is written for
it.  I believe that should be a separate project covered under a different
MR, not this one.

There are reasons I did not want to put that code near that library, and I
think I recall finding not test framework when I wrote the host_port
parsing, and thought I should leave lib/tsocket well alone for ongoing
release stability reasons until something is done about it.

Thank you!

Best Regards,

Matt Grant

On Wed, 8 Sept 2021 at 19:57, Uri Simchoni (@urisimchoni) <
gitlab@mg.gitlab.com> wrote:

> Uri Simchoni <https://gitlab.com/urisimchoni> commented
> <https://gitlab.com/samba-team/samba/-/merge_requests/2148#note_671906917=
>:
>
>
> The *location* macro is a compiler-supplied macro of file and line.
>
> Users of the function call tsocket_address_inet_from_strings(), but it is
> actually a macro, that translates into
> _tsocket_address_inet_from_strings(params, *location*), thus allowing
> _tsocket_address_inet_from_strings() to keep track of the call site - for
> debugging purpose.
>
> The #ifdef is there so that in doxygen mode (when generating API docs,
> that is), the docs generator shall see the function without underscore.
>
> What I have in mind is something like :
>
> int tsocket_address_inet_from_hostport_strings(TALLOC_CTX *mem_ctx,      =
                                const char *fam,                           =
           const char *addr,                                      uint16_t =
default_port,                                      struct tsocket_address *=
*_addr)
>
> This will try to extract a port from the string, and then call
> tsocket_address_inet_from_strings using either the port that was found or
> the default port. ... that's what the user calls, and in the implementati=
on
> you do all the "location business".
>
> =E2=80=94
> Reply to this email directly or view it on GitLab
> <https://gitlab.com/samba-team/samba/-/merge_requests/2148#note_671906917=
>.
>
> You're receiving this email because of your account on gitlab.com. If
> you'd like to receive fewer emails, you can unsubscribe
> <https://gitlab.com/-/sent_notifications/031540943ffd4db283b8bf3147bd656a=
/unsubscribe>
> from this thread or adjust your notification settings.
>
