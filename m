Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F8C439C30
	for <lists+samba-technical@lfdr.de>; Mon, 25 Oct 2021 18:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=S0iCKs1h9z8P+YLGgtEDkkSftzLx4ER7nyep2235y5g=; b=wh2icq6eG+Jcj7mYMaPtudrXR9
	55rKFLMdU/Hsdxa2eG1mrF47XNwERS1RWeC8Isq41AT9lDm+0yRdPt+zoZhpYyYWs99mDxHQ5SeNS
	mj/Izu6onLHOnmvDYEAHyxxob99f9yX0ciQaZyV2evyYNbsY8ojTJqG6kv8JFLBhmgG9e8WmgOrmr
	2YMND2jrIgJU8hq4WGJcZMpsog9ODn91oYKpgjars6Ia4IlDIyiaHUsoV1kPZSuS05RHECAOrHND6
	7sjMWgEW2H/p4IeCGwpuHYfmkrcUGZ7cKVI9t9zaLrUC3VzDC+brTggXVkwo/wv3sh/y4HYIsLRi3
	e7PcdyNQ==;
Received: from ip6-localhost ([::1]:24668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mf3J1-00CjFl-9B; Mon, 25 Oct 2021 16:58:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43984) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mf3Iv-00CjFc-QF
 for samba-technical@lists.samba.org; Mon, 25 Oct 2021 16:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635181110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zBbmqNfwGMXhSQA0EIztYB2QURyO2bcFSasxmVRA2ts=;
 b=LXM3J0D6b3H2WJcnOhD0ohQ0a0Sz48P/ZiYBIlv/4ZCq6KOeqpM9VBgRPt9jgADePJlagC
 G5hXWbovVSZJmmbC0zdHDnInQn3f+UhOxmgdMAbASAxsYRaCf0JdC5fiAJUeE9a32dWbva
 N797ZKarV0sxWT/z6zy5diqAuS6XY4A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635181110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zBbmqNfwGMXhSQA0EIztYB2QURyO2bcFSasxmVRA2ts=;
 b=LXM3J0D6b3H2WJcnOhD0ohQ0a0Sz48P/ZiYBIlv/4ZCq6KOeqpM9VBgRPt9jgADePJlagC
 G5hXWbovVSZJmmbC0zdHDnInQn3f+UhOxmgdMAbASAxsYRaCf0JdC5fiAJUeE9a32dWbva
 N797ZKarV0sxWT/z6zy5diqAuS6XY4A=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-nv4poLB3P9O6EuHLMrNGXA-1; Mon, 25 Oct 2021 12:58:28 -0400
X-MC-Unique: nv4poLB3P9O6EuHLMrNGXA-1
Received: by mail-pf1-f197.google.com with SMTP id
 3-20020a620403000000b0044dbf310032so6829677pfe.0
 for <samba-technical@lists.samba.org>; Mon, 25 Oct 2021 09:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBbmqNfwGMXhSQA0EIztYB2QURyO2bcFSasxmVRA2ts=;
 b=YQBfLDwELsh9ilCLcrOmJae72ywDx0vA4oFStNOKdOQ8jehedN6Pnv/BSq+IZmccj8
 E4XksqAhmad3asKJTpTJAr/N2nFyRHcFxvmo0pgnK8q64OhRIeDVzu9vxF+OdIyp0fvo
 j9xWREla+yrxQcwU90M+fKazELOgqb6qvoLghR0D2ELWZZThbEt5Ec9i4ts4rEKEc7Zt
 CB2CaiTft6MtYnS0NY4kerQNXXvnIpxhREAT+rxlEwdzIbRYxa/dvInIQF6aXrCjlvK5
 beLTsIbjVr2w/u5BKuslkiViJwzXQocHvHFa67nO3zlW1huDwAlRkPYOiztYWxgOZpek
 4A4Q==
X-Gm-Message-State: AOAM532gOw8E4f95ZtF5mdO/+DUPcPRHRwTj8SI5tx5Nzb2zrxPABBPS
 VOVOsg3IvSa3qBA50SR0nq3RIq4ckSbXjODXMeO+nVxJSo+FbRZnVahHui9Rqi9Pc1ngKrkx9T7
 7dskm3zoSEhxcra27Zh2kG++2rVEBAwOWTguS4+MZRHH2
X-Received: by 2002:a63:3c1b:: with SMTP id j27mr8297499pga.462.1635181107497; 
 Mon, 25 Oct 2021 09:58:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynbIopweDO6LYjmfwXpVXH6POlvZmdKsuolHY348cuMXEtK1JglceVLInySQJtyk8ENsRqL2+51vOykEEDXPU=
X-Received: by 2002:a63:3c1b:: with SMTP id j27mr8297475pga.462.1635181107184; 
 Mon, 25 Oct 2021 09:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
 <YXGd6x6nxD4pHj6l@jeremy-acer> <YXGh+Mp1s/oMnHzU@jeremy-acer>
 <YXGyEPiGNwaXyPln@jeremy-acer> <YXG0WUXsDFpmFVZr@jeremy-acer>
 <CAEcb10sPbR1eDzQCyGt4c7A12MTPhf7QTmR_R5oDnMDvMOJTJQ@mail.gmail.com>
 <YXbcnQJl78LG9txV@jeremy-acer>
 <CAEcb10twxsCBi-jno5V0fh5c6ubZ307tOKPEjDOcueCs=7-Tag@mail.gmail.com>
 <YXbgiyTKKU15KUzL@jeremy-acer>
In-Reply-To: <YXbgiyTKKU15KUzL@jeremy-acer>
Date: Mon, 25 Oct 2021 18:58:16 +0200
Message-ID: <CAEcb10v3vw14qe=BzBiKhNdcL1zu18MCVeTtuNSRDTWiNfnPOg@mail.gmail.com>
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

Sure ;-) I was just not sure if I am missing something...

On Mon, Oct 25, 2021 at 6:51 PM Jeremy Allison <jra@samba.org> wrote:

> On Mon, Oct 25, 2021 at 06:50:08PM +0200, Pavel Filipensky wrote:
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
> I'm still working on it Pavel, can you give me a day or so :-).
>
> Code's not quite right yet..
>
> I'll point you at the ci when I'm done.
>
>
