Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79E470BEC
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 21:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=TlcWHpxzM9Mg7HVf6a/vW+3Lzr6lct3PbBhyX3UP1oU=; b=E22uynBjxD8uQ2pjOAS3phXduD
	Ag/TGN5TxoDHjgMs6pukCvSrSE2/ocQX+MymibA9UtudKH/cC1TRTI+jmPVM8uCQ2hwX5C4etgXcg
	waoaqkS5zw0XBLoWyp9/W/ksj6SsJRVptXCR+aycyhtM/WoXxNVHUVxCac0k/GE0/eFmPr23Zy9Zg
	TpvmSO3Lw64GECt3brJXQPschJ9fHw3HYe+XUTcRLyQPcppkBJ0aYv0NPf9v0gyXUIQaqI1oRKfph
	irmuJ0KIezprP40yxi/ODArONpSsOIASV9hV8KCxjoYXAkyCsXWJV/pG5Gk9/vnDzQ/BfdKTaXyPP
	8hdBlsAw==;
Received: from ip6-localhost ([::1]:49072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvmeo-0056Hw-7j; Fri, 10 Dec 2021 20:38:18 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38702) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvmeg-0056Hn-CZ
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 20:38:13 +0000
Received: by mail-ed1-x534.google.com with SMTP id x10so16155570edd.5
 for <samba-technical@lists.samba.org>; Fri, 10 Dec 2021 12:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dEeKzbSjjdfH8hD7+KCZzxYP2aj1CTrlNKSr4mrzMLg=;
 b=b/PTEyoijyEv6Wrj0izsXSK4DddEmDp3LYFTRZCT4l9SrjDldNZA2FKP/zNQCQjH7a
 dgk2T0/1evDOdtgZifeInETShdW7ZoMoNGDLIMuGu92KpMseKD9NIsI6FbJ8E0Dwm70P
 WwlGRxcim6qhZxkUy76+atQjzV+j4+mzyt2valA4yO3sORyJnx74xd+MY146DU4QdoMD
 Z8aBze2i14zPJglKERrpL53lnya8oYR4c2ai82KAOsp2SAovwkurW49uKGtboosVUbR4
 Nrp2a+MpeWWGagrMWfzYvdxBB67cZ9NG6yrZn8r6xle49s/SVYbqPp7wgwdKpLttLf3/
 7D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dEeKzbSjjdfH8hD7+KCZzxYP2aj1CTrlNKSr4mrzMLg=;
 b=2djR5L0gl0iERyM3BbmVj5ktA+Qz1x7RhaBA+Ff6NujrI+GJ9dvpcJoIDaguoGQ/Nj
 CokiSbdeaG38rje7DnGKLSxfnD64OP4kBfDJXT6jzzvDXTk/Mevg8nsjPExHuh/4H1H7
 rIkrhfVZosWjji/sPkyi1ir0pKw0ulyzGuOKBEJzMR0k1+c6kPzxw4BXHtRJqRbWIOLD
 87W7ne6SVv9DHvhhSRIKfxKsrIVjsZuHa6tld8pBznwJIZZrsYLnCaMv/fKUT904u8An
 zW9pnq1uiTTsMUW0od8PBgB2W1BX0sqP/HqIjlZMSJpytP7QyvmyAnc+w4USIJueW5Eg
 4Hdw==
X-Gm-Message-State: AOAM531cLWYwre1OP+tOdz6DjJcivI0TgrHuWHl0JALc9pvU1SQhQFif
 97kRgC1ARZpW1Qb4G4syXuieutzYtBYkyTHas001Rw==
X-Google-Smtp-Source: ABdhPJwY4hU6tHBok4mP7EYO+Zho9bL8To+7+qc4/Fug5xm5VeausCLpa9G+5c07UctNwyl54/WN8QOLyCu56+fhdwo=
X-Received: by 2002:a05:6402:3596:: with SMTP id
 y22mr42502571edc.297.1639168688646; 
 Fri, 10 Dec 2021 12:38:08 -0800 (PST)
MIME-Version: 1.0
References: <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
 <YbOU84ZAt6FE81gb@jeremy-acer> <YbOlvjkCcbp41r0e@samba.org>
In-Reply-To: <YbOlvjkCcbp41r0e@samba.org>
Date: Fri, 10 Dec 2021 15:37:57 -0500
Message-ID: <CAB5c7xp+Gs05F3RLX+Zwkx4=WRFY0Wb__bNnbf9Oc9oVv77d7Q@mail.gmail.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
To: Christof Schmitt <cs@samba.org>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 10, 2021 at 2:08 PM Christof Schmitt <cs@samba.org> wrote:

> On Fri, Dec 10, 2021 at 09:57:07AM -0800, Jeremy Allison via
> samba-technical wrote:
> > On Fri, Dec 10, 2021 at 06:06:56PM +0100, Ralph Boehme via
> samba-technical wrote:
> > > On 12/10/21 17:56, Andrew Walker wrote:
> > > > That's a good point, but if MacOS SMB client is faking up an inode
> > > > number based on a hash of the filename in the zero-id case, isn't it
> > > > even more likely to yield a collision at some point?
> > >
> > > well, it's somehash(name) combined with the parent-inode number. I
> know,
> > > it's not ideal.
> > >
> > > But going back to inode numbers brings us back to:
> > >
> > > https://bugzilla.samba.org/show_bug.cgi?id=12715
> > >
> > > *scratches head*
> >
> > OK, seems to me that we need inode numbers by default,
> > as that's what works with both Windows an Linux clients.
> >
> > If Mac's need special handling here, then we have the
> > capability to detect them and switch out the inode
> > numbers for Mac clients (fruit... :-) :-).
>
> Not every Samba server where Mac clients connect has vfs_fruit enabled.
> And requiring vfs_fruit to prevent data corruption seems like a big
> step. The requirement for Mac clients is the same, no matter whether
> the fileid is generated in vfs_default or vfs_fruit.
>
> The initial problem is fairly easy to recreate: Use a Samba version that
> reports inode numbers as file ids, create 100 different files with
> different data from MacOS. Now go to the file system, delete those files
> and create files with the same name and different data. Then read those
> files on the Mac client. Chances are that the Mac client will now show
> the data from the old files (due to the fileid based caching. If a new
> file got the same inode, it has the same fileid).
>

Are we sure about that? For the fun of it, I just rewrote how we were
allocating file_ids so that they were derived from smb_fname->base_name.

```
Andrews-MacBook-Pro:share2 awalker$ cat testfile
CCC
Andrews-MacBook-Pro:share2 awalker$ cat testfile2
BBB
Andrews-MacBook-Pro:share2 awalker$ stat testfile2
872415469 3840159432845878725 -rwxr--r-- 1 awalker staff 0 4 "Dec 10
15:24:36 2021" "Dec 10 15:27:17 2021" "Dec 10 15:27:17 2021" "Dec 10
15:24:36 2021" 1024 2 0 testfile2
Andrews-MacBook-Pro:share2 awalker$ stat testfile
872415469 398 -rw-r--r-- 1 awalker staff 0 4 "Dec 10 15:27:56 2021" "Dec 10
15:27:56 2021" "Dec 10 15:27:56 2021" "Dec 10 15:27:56 2021" 1024 2 0x10000
testfile
Andrews-MacBook-Pro:share2 awalker$ cat testfile2
CCC
Andrews-MacBook-Pro:share2 awalker$ cat testfile
BBB
Andrews-MacBook-Pro:share2 awalker$ stat testfile2
872415469 3840159432845878725 -rw-r--r-- 1 awalker staff 0 4 "Dec 10
15:28:46 2021" "Dec 10 15:29:30 2021" "Dec 10 15:29:30 2021" "Dec 10
15:28:46 2021" 1024 2 0 testfile2
Andrews-MacBook-Pro:share2 awalker$ stat testfile
872415469 6066312061719206029 -rwxr--r-- 1 awalker staff 0 4 "Dec 10
15:24:36 2021" "Dec 10 15:27:17 2021" "Dec 10 15:27:17 2021" "Dec 10
15:24:36 2021" 1024 2 0 testfile
Andrews-MacBook-Pro:share2 awalker$
```

Behind the scenes on my Samba server I renamed the files. Inodes stayed the
same when viewed from MacOS client, but file contents changed. This was in
Big Sur though. Or is this application-specific?
