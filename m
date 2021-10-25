Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C33439DB6
	for <lists+samba-technical@lfdr.de>; Mon, 25 Oct 2021 19:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jOvDiAPA9eoOGRB0Wqse+6hk+LWHjwQn3v0RFYwcioc=; b=qu8OE9WqZPPWoi/PE4gLrNt458
	deupjEt8uHkD/KoM6mGonyxMJGpUBSSDZ+hL7Ly9wZ+ARBNQholC/HMMKxS1Vc1UGmEG/KioqjBSu
	+boPrGQf9PAzsMdIw+sya0RLQoAUxRvVT5rRXI97kLHXtA3KGBCanvEpZ+N8Le/NWwK1dW2Xan3v1
	5llrC8bJovECobTS8E+tTfRVY2LKnb9AJmGl04vxLZ93Ugw0Kit9whRGX83WXU9/q9t4fZ3E4/pit
	mVHUYu3URS5ffOieQjx81N0EZpIh8B3goEzPewDvl0eCvk5TyhvIeA3kEd8/lRb6IEJCWW0yqzNLr
	zkzDI59A==;
Received: from ip6-localhost ([::1]:35422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mf3vx-00CndE-Em; Mon, 25 Oct 2021 17:38:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34290) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mf3vs-00Cnd5-G6
 for samba-technical@lists.samba.org; Mon, 25 Oct 2021 17:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635183524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W21iDzYL22oMqvjqmczzLP4dTeCWeHZEmG4GR+W5CVY=;
 b=GiWZrbF4PbwD3QDaetzsL9JqpZcFiaqb5Y1I7sKI0jZsVfO46Wsv6wQ0/kRxAac/8HrRN2
 6knYICINO4+y7J+pe7JSo5ocgelJfjqvJxQYU936lv4RgI1of8Fv8+zVhjyeEdlHIzfjZi
 eVwwk2U/PdCBW7RhZ6gsx1+qNk/t4aQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635183524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W21iDzYL22oMqvjqmczzLP4dTeCWeHZEmG4GR+W5CVY=;
 b=GiWZrbF4PbwD3QDaetzsL9JqpZcFiaqb5Y1I7sKI0jZsVfO46Wsv6wQ0/kRxAac/8HrRN2
 6knYICINO4+y7J+pe7JSo5ocgelJfjqvJxQYU936lv4RgI1of8Fv8+zVhjyeEdlHIzfjZi
 eVwwk2U/PdCBW7RhZ6gsx1+qNk/t4aQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-wsC0HB_zOHyanVP6I5fQag-1; Mon, 25 Oct 2021 13:38:42 -0400
X-MC-Unique: wsC0HB_zOHyanVP6I5fQag-1
Received: by mail-pj1-f71.google.com with SMTP id
 m4-20020a17090a2c0400b001a1f07cc9c4so6473293pjd.8
 for <samba-technical@lists.samba.org>; Mon, 25 Oct 2021 10:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W21iDzYL22oMqvjqmczzLP4dTeCWeHZEmG4GR+W5CVY=;
 b=B0ToQuLQWMZ05dAANHK8UIHvladU8+T70OwlGcZyKRLktESGGsDCWbGrLLQtfDee9b
 KWuwF3HNy7ZxYBPLG7cqpIiqWqCnO8MsIWVFgyvFg7fZm0SQkDmlIaViikMDSBMCkK7A
 WrBALk9lzMETXMgOXe7+hFTiilaGIlSPWZ35iyX1OaN1J5E011hgu7sGfwtijRgLg3gA
 2+QT4i+ZJxdk/cptu6OQTE8Guw+kQIbIC+Anwn95lj2F4fmYyz/m7PZYtq6LWnI3agA1
 8qbiR/Mbml/i5nAKRKQVJ63dyhh0PbXQTc2L0u2J558P/9MvBfFo99VHF6oFJOOCu8+h
 n4AQ==
X-Gm-Message-State: AOAM5310Xzb+niy6NUBoUb7eC8GJFhRHDRavXHl6+lom47NxNnZFElcg
 KX2w47G/E2TUfFUqxDDYIrn2eITms3lcIbsLDs7jBzzOzmLKEvkw3n6bMnWjypFPzF9ksby/ePi
 R44uAqQq827x6Cfot8iKSe3p+yk5VGYpIYfEQ4hz5uzmw
X-Received: by 2002:a63:4d56:: with SMTP id n22mr14965616pgl.414.1635183521819; 
 Mon, 25 Oct 2021 10:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxogrTmsLaihHXvElYSLxGZ20cui+njiWPttMvZeTifL5nJgsFjwKV956697BKCL/TRhfFQrcbJdGfH2+dKvz4=
X-Received: by 2002:a63:4d56:: with SMTP id n22mr14965592pgl.414.1635183521462; 
 Mon, 25 Oct 2021 10:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
 <YXGd6x6nxD4pHj6l@jeremy-acer> <YXGh+Mp1s/oMnHzU@jeremy-acer>
 <YXGyEPiGNwaXyPln@jeremy-acer> <YXG0WUXsDFpmFVZr@jeremy-acer>
 <CAEcb10sPbR1eDzQCyGt4c7A12MTPhf7QTmR_R5oDnMDvMOJTJQ@mail.gmail.com>
 <YXbcnQJl78LG9txV@jeremy-acer>
 <CAEcb10twxsCBi-jno5V0fh5c6ubZ307tOKPEjDOcueCs=7-Tag@mail.gmail.com>
 <YXbmFp0wcd4Nc//S@jeremy-acer>
In-Reply-To: <YXbmFp0wcd4Nc//S@jeremy-acer>
Date: Mon, 25 Oct 2021 19:38:30 +0200
Message-ID: <CAEcb10vbaE0uYow4Xwd5zBEMp+sqow1pQe1hQgAsNK=aMoVKMA@mail.gmail.com>
Subject: Re: directory with a symlink pointing to non-existing file
To: Jeremy Allison <jra@samba.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pfilipen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Warn: TLS-SNI hr1.samba.org
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
From: Pavel Filipensky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Filipensky <pfilipen@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

With "vfs objects =" it works for me as well ;-) Great!

On Mon, Oct 25, 2021 at 7:15 PM Jeremy Allison <jra@samba.org> wrote:

> On Mon, Oct 25, 2021 at 06:50:08PM +0200, Pavel Filipensky via
> samba-technical wrote:
> >I was not aware of xatrr_tdb, thx for pointing that out. I do not care
> >about config with xattr_tdb, it was more or less a coincidence.
> >
> >However, it does not work with "fileserver" environment for me. What
> >exactly is your regression test doing?
> >
> >some grep for "fileserver" environment :
> >
> >$ grep test1 st/fileserver/logs/log.smbd
> >
> >  synthetic_pathref: stat [test1/l2] failed: No such file or directory
> >  streams_depot_stat called for [test1/l2]
> >  streams_depot_stat called for [test1]
> >  streams_depot_rmdir_internal: called for test1
> >  rmdir_acl_common: unlink of test1 failed Directory not empty
> >  rmdir_internals: couldn't remove directory test1 : Directory not empty
> >  close_directory: test1. Delete on close was set - deleting directory
> >returned NT_STATUS_DIRECTORY_NOT_EMPTY.
> >  smbd_smb2_close: close_file[test1]: NT_STATUS_DIRECTORY_NOT_EMPTY
>
> Haha ! I'm hoist by my own petard :-). The "fileserver" environment
> is including xattr_tdb in my test. I need to set "vfs objects ="
> in my veto_files_delete and veto_files_nodelete shares (as is also
> done in many other "fileserver" environment shares) and then
> the regression test works.
>
>
