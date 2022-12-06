Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE836439DE
	for <lists+samba-technical@lfdr.de>; Tue,  6 Dec 2022 01:23:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=H694Zl4fuyaFnmFu6c5KEaMiRGwxTHB1/hDpJCcCWiE=; b=3ZlmQi5o25kbbq4sbLbNlNT3A7
	1qUjyfkA8FtXDcT0HUDG1FnW8GIUXilqifpwiL5GmdG8vBic2RlegRjbkerjwbdFO1Q8RpI49YcX2
	aIh4Yx8wIIky5YfbOZEr/1Zm/wciDlbelzq9HtCHtDTJzUowTDlRQbOWqTJ1d4KyXzauw1zhz9ckG
	YvFSItiQoSO792Md3hePPayOYEJiiw2BNLT1cEJZ7NgGVhAzXOi8JuDtzjMUxnN6WtxA9ZPKUnk1x
	Be/4sAVHmdS6v6Vutm0mZ6lshgTsXDNjzQVEi2abxM/K1iGVyjiNUrOs4IsMp6Am1zk00a2HFL4DQ
	bKA0k4Ag==;
Received: from ip6-localhost ([::1]:40138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p2LjF-006Z46-2B; Tue, 06 Dec 2022 00:22:33 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:45818) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p2Lj8-006Z3x-NB
 for samba-technical@lists.samba.org; Tue, 06 Dec 2022 00:22:29 +0000
Received: by mail-lj1-x231.google.com with SMTP id a7so15393921ljq.12
 for <samba-technical@lists.samba.org>; Mon, 05 Dec 2022 16:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H694Zl4fuyaFnmFu6c5KEaMiRGwxTHB1/hDpJCcCWiE=;
 b=qYAubKKB7OSoHz7TqL7MAQGCxhiT2AYQEi9dgcalRstBt2+pjYJzX90cg+gTiSIcms
 Ok5jJbbWDm3FLoslWSyLJmRFqW4+bejT8dOAxNz8aP68azpNWhocK4Zve7RN/8Pba8A+
 PoNvRvWajb/BxYr3dvZjqXCDek+QMHt5OVGdSTvQ7CEmhFxXwIfGExGc0/jRLCp5QGIx
 JYNAOYecKhDqUAX0f4tvzzsGJsvDzzKJV29YUWsNYQUnMsenPp33SwoIyIiw5rzoaydc
 54w+OtrBxh3z/onXGZP6IOVtMIYTb/R8kueR6M3J+9pPbesZPLTh5aSI6T/0zPBO6ATL
 rUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H694Zl4fuyaFnmFu6c5KEaMiRGwxTHB1/hDpJCcCWiE=;
 b=nplXFrHNVjN2E8xis5nyqO8Gc5eyfqMRP8SMBt0Fe+iqKDhAiZNpqp4P3b/Gd7egj9
 F5aga15r2yy/z+HQoqt88WicU+vHn1hr7K/qhksOfyY4bpaqX5brrazhTy9OYs7OgaDS
 uvRSMvArD8ts1v6HmjT5x7YwOGdN6w+1d8tv1z7X3fxn8lMYOHroiYYdiUywBroGRlT7
 Nul2/302qYV42PgQJnujZYik45MryMCKTqSD8gdGnM74dyTBCrM6P/ljDMw8XUVAMrF+
 tlYShn4tBIaTKOmPUDlVqya83BKDnCwZhMDKWXQRV/dnE9SzDPZX2jeJfhzrwFU7lgY5
 zv6w==
X-Gm-Message-State: ANoB5pnoCfBCLaiKU1SxRW72VeleV3rfJY9vfBdsexXHz/ZdzbOMOitN
 QqZmGHCM6wXF2BptbXkiPfUkejxNfpqoQtF0bPw=
X-Google-Smtp-Source: AA0mqf4hOep1WmelKygDBBwlxRDMVBjC97s6BQwXHulk6/L+/k9z0uF/xWQSGQY08/S4jZavDn+5gh83pBwKus/EYIs=
X-Received: by 2002:a05:651c:12c1:b0:277:2fd5:482 with SMTP id
 1-20020a05651c12c100b002772fd50482mr22878275lje.194.1670286144170; Mon, 05
 Dec 2022 16:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20221116131835.2192188-1-hch@lst.de>
 <CAH2r5msoMJ6jNFDtHigKOqq9EwxEb9buxGVi8duW8EMz6wwgBg@mail.gmail.com>
 <20221204081913.GB26937@lst.de>
In-Reply-To: <20221204081913.GB26937@lst.de>
Date: Mon, 5 Dec 2022 18:22:12 -0600
Message-ID: <CAH2r5mvZh+5S74fec0o8EGf+OdjP4LaRKsK-FKh-ctf4uzHX0Q@mail.gmail.com>
Subject: Re: RFC: remove cifs_writepage
To: Christoph Hellwig <hch@lst.de>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, David Howells <dhowells@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Sorry about the delay - was out of town.

Ran some tests today with the three patch (remove writepage for
cifs.ko) series.  Let me know if any updates for those.  Also let me
know which gti branch you would like to see these merged from (mine or
yours e.g.)

I did see an intermittent  failure (when run with these three patches)
that doesn't appear to be obviously related to yours but am still
investigating it.   Test 043 failed once, and on one of retries of the
group  -  test 045 failed once. See example below.  This looks related
to an issue with deferred close (handle leases) and reference counts
holding up unmount, and not related to these patches (at least at
first glance).   Continuing to debug

generic/043 49s ... [failed, exit status 1]- output mismatch (see
/home/smfrench/xfstests-dev/results//generic/043.out.bad)
    --- tests/generic/043.out 2020-01-24 17:11:18.676861985 -0600
    +++ /home/smfrench/xfstests-dev/results//generic/043.out.bad
2022-12-05 18:11:44.744440542 -0600
    @@ -1 +1,6 @@
     QA output created by 043
    +umount: /mnt-local-xfstest/scratch: target is busy.
    +mount error(16): Device or resource busy


On Sun, Dec 4, 2022 at 2:19 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Nov 16, 2022 at 12:29:41PM -0600, Steve French wrote:
> > I can run some tests on this later this week.
>
> Did you get a chance to do that?



-- 
Thanks,

Steve

