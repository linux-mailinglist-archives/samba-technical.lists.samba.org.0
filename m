Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38217243066
	for <lists+samba-technical@lfdr.de>; Wed, 12 Aug 2020 23:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ev3XQLbHUN8LdKiF5Z6bE4zZZrXXkwg5QyENYXM7QXI=; b=D/3k4jdMVLurjJAt7XjKW9g8tn
	w7zUMurBcHTYPKyjA773hwlRb+YCgCMEzzEQgNrFi+tuPFgebZKyKS1aOWmg+ZqK2mv1gIMDIp68l
	EYAxnPVPZ9bBEEXf053jMJ2hFuTNYw2Ku25VM/DbaCUUGTDZmx2oVPd1vxHGe0MV7AAQ6/yWUQWbg
	qgGckNjmFHrnOETLC4CMdN0853/TQdGZCYhBvq8CxpZ3FUrPTjfhvj/1YUupzumuV4Jh/6ZdwYzZK
	ViHoxrl4w9om32MjTynY81XT/92udrOus4LEDjAOIjA5TCEHWIt2Aox4fdqjhNwAtVhuQkLZWac1R
	5AI392dg==;
Received: from localhost ([::1]:35772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k5y1d-00DSLX-5X; Wed, 12 Aug 2020 21:11:09 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:33585) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k5y1V-00DSJs-52
 for samba-technical@lists.samba.org; Wed, 12 Aug 2020 21:11:03 +0000
Received: by mail-il1-x132.google.com with SMTP id p16so3300797ile.0
 for <samba-technical@lists.samba.org>; Wed, 12 Aug 2020 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ev3XQLbHUN8LdKiF5Z6bE4zZZrXXkwg5QyENYXM7QXI=;
 b=ZwG4etfWUXLv2zvGyswL6Ghl2A6OB9feVYetSDlCE2np5gBzjwBCf+a5Lm/zcqFWKP
 uq/MlsCOKohbz8AneS1dmuoc+jz2OsizPUr7PRBANFkwd5jyi3uQQ+Zy/3h4V2Ws4UWR
 3eMPTomXkbPaEhQstWbUwCe2Do8sE3KvazgJ+36jWvoENbf6m3gJaeVE/JeHTVRBzNmX
 3w2dKdEM2qqVeowV2GwaDGiZKbsbHrASRmposm9aNkxUrtgFpPqp5GeGl9G5QsT4g1N9
 BVzb49BmgihHpmHjB+4wlvLgIOH+mYA/vJo7riGDWPnZbhSNmrsock2qd7/Jqq5ibg6V
 CNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ev3XQLbHUN8LdKiF5Z6bE4zZZrXXkwg5QyENYXM7QXI=;
 b=ecPQKf3Rp/xbvm2H209LGaRI9y4qJAXWrIsjwVuQn4hKXkIhP9NoOeAFO5ojyCJai9
 RIYLDYDzvvZxAbFuJF5XOr7Bl9HCvctwTWzN1a7PRYuM6NFxw1YOvleVcCKNXQEjOdp4
 QHddxAvzwBIczfj3pbnrw3NOc0ygqgpf0j1ES9S21wkax+5OFhB1k4Bm3nprDPI07B4h
 N+PrNjse209vM0vbsyFrNbgQ1KwAYQcEMt12V2r1D9zCxvSI5emM6Y9BZ1FCr5Q+szb0
 VP5baiw1l6wmDe3QtDcWpiOyxt+evzjGG4lE3eRkVALgUiD23HCa8WMqA3YDpOLCZVUm
 dzFQ==
X-Gm-Message-State: AOAM5335B2tSxfzTLlbMds3jEkba3CXavSksU65serGXdgLhkpsiM8Bs
 DQq4XSzF87DWjumR1iw7EScwFzvRY3pzASiwOMDCaHNTVw==
X-Google-Smtp-Source: ABdhPJxBjh9LpDolFHR+QFSygO5aGWCiMykHIZ1CZLM7YvkV7CmLI+o8t9UgzpdvqXOQr/0WHBrK3ljDwuP4fQ4b9A4=
X-Received: by 2002:a92:4989:: with SMTP id k9mr1608239ilg.177.1597266659056; 
 Wed, 12 Aug 2020 14:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAMfpvhKQKyvzEgsyEPChU1ectmsbPeGiGKEHF2v=5hR+jC1GCQ@mail.gmail.com>
 <0f42582a-eee8-5e05-a55a-1f1c80f11845@samba.org>
In-Reply-To: <0f42582a-eee8-5e05-a55a-1f1c80f11845@samba.org>
Date: Wed, 12 Aug 2020 14:10:47 -0700
Message-ID: <CAMfpvh+VFgk6f2Gem0FetU+TfZ8wzVhzOaAo7bwPkNRNozT+FA@mail.gmail.com>
Subject: Re: Creating a VFS backend
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Matthew DeVore via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matthew DeVore <matvore@google.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 12, 2020 at 12:44 AM Stefan Metzmacher <metze@samba.org> wrote:
>
> My guess should be hello_create_dfs_pathat or hello_get_dfs_referrals.
>
> > Here is the output of smbd:
> >
> > $ sudo ~/samba_build/sbin/smbd  --foreground --port 8111 --debuglevel=1 -S
>
> Add debug messages to all the calls, btw. you should use
> DBG_{ERR,WARNING,DEBUG,...}() instead of the raw DEBUG() macro.

Nice, thanks for the tip.

>
> And let it run with log level 10, I'd also skip the -S option.
>
> Also look take network captures on the server side
> (because the timestamps of the capture and log files come from the same clock).
> and check what requests are sent on the wire.

Last time I tried using WireShark to capture SMB traffic, the data was
correct since I could see unencrypted filenames in the hex dumps, but
the binary data of the requests were not annotated with field names
and such, though this worked for NFS automatically earlier. Maybe I'm
missing some knob on WireShark...

>
> With that you should be able to make progress.

Fortunately I was able to figure this out because of a private reply
(which I only just now realized was private). The salient advise of
that reply was to set the debuglevel to 10 and look for
STATUS_NOT_IMPLEMENTED in the log output. After I did that, I manually
traced some code path from the log message to see it was attempting to
invoke createfile. I didn't instrument or log createfile calls at all,
but had them return NOT_IMPLEMENTED, because I thought createfile only
referred to making a file on disk. But that's actually used to open
files as well. So after I replaced my createfile function pointer with
NULL in my struct vfs_fn_pointers, my backend's get_dos_attributes fn
got invoked, since the default implementation of createfile does that,
apparently, when a file is being opened. So I'll proceed by
implementing get_dos_attributes.

- Matt

