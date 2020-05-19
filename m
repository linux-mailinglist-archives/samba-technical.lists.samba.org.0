Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C15131D94ED
	for <lists+samba-technical@lfdr.de>; Tue, 19 May 2020 13:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qzhVHseRnXje89K5yrzhmVJQe+Hgu3riKo+oCvXrdPE=; b=jw04C/BKgXD4bB7GisQN8ABdOP
	b8YJ1w0OrcV+OBaaBIlvB+tiOjes8zdA0J7YDn6XhOHrqUQzKah7usTs79z/l4oCR5/6WlNeDiPY+
	x8S0UW8kftknKZ2FlUd94uTHdAuG/9bvDJ5/CDPvGPmvYUB1NJk9UVLIhvgVvf+1bPpbEdE208gtE
	n/9aLEXnVz81l9591ePIT1mmoX4EcfrX1kJj/MZQSESUuDuWiHzcN7g8yiiPGmNSJQ4wWXL4yeGES
	n0HfcWMfGkDyUfgkCPwC7595EAoZenljldoChVgR5fvq3tNlNoPcPaWz3W1hffNd+IqnIFQMRle4+
	E2BR8v2w==;
Received: from localhost ([::1]:59904 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jb07F-0054Ea-Ny; Tue, 19 May 2020 11:08:57 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:46730) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jb079-0054ET-JP
 for samba-technical@lists.samba.org; Tue, 19 May 2020 11:08:54 +0000
Received: by mail-qk1-x72a.google.com with SMTP id f83so14303200qke.13
 for <samba-technical@lists.samba.org>; Tue, 19 May 2020 04:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0L0+EXevpv24evjBYsFZ3PfrE9dRzEYY1QT4VapvgwI=;
 b=ZZOZFZX3djU17shrro+3Z0rIzu9W/d4oCEBbkdlZRlSNNGGRmXpDLXJvWZAkTlPUoi
 p+qwmC7VyQBgNYGARcO6fxrUHn/UmNcmAK1NJlEQGWjAgEN5S+3iaukJAFg8saXL4t8H
 Lxmb6Ixio2uS5jQ6r6Jxue1MsLyzK3/uFZ+d7+gWqc/ltVLj4Saf2LX63s07WGwFviQF
 wKGYmBsrB2pUHAX1Mxa/Twgfwn5OedHm+ru11PyTGnY3VtddChNzijxeQBNs6/SV5qz6
 9aM0yEODxip01YwPy8wNFLVTaVagfPoTPXKWj39V7REg5nbj+ShMxifAS/aEkSf8h1Vs
 +nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0L0+EXevpv24evjBYsFZ3PfrE9dRzEYY1QT4VapvgwI=;
 b=AfDRmiuVclDQHLOqk0GeVn7y0fcJ5ZCY5rZE/7BKAjBiHGDGQy9zzY5UGLtDMbSQqT
 DQ6PzVJK7Ei2hZ5a2oVsE4z0skblE3cGHnJLzipRiEtjmVkHozcw6AlwO92stKtO7llN
 GfQPjP90Vdj7Dzf9HUCo5GQptYTjYv+JBqMYlNpCqltKfE3AwksjJ+O6VpJ4B+0ggy20
 0DHxQlmccHrVqvi38n1D45dUx8rRN8ul6iGHBdXHhUtAZ0hfDeUlWGfWATDxRnOL7de3
 EBYzI/MiMxIFbgFY6KNPYMl30w9Cl2230S/hCUg0DcipKusThBHzClQL0PNmJIX27DVm
 XnDA==
X-Gm-Message-State: AOAM5324FdH7+LrPZumgpTvTjEut9SWX6y6DMemf59AGkvBNYz9yN4tS
 wQ0DFLgCJrwPE+DjSsnqGho4jEjtcIyZ7VJ5SmPDYQ==
X-Google-Smtp-Source: ABdhPJyBHCkF7/QxEvl90w4vU38p26ELRa9Q4oOTMeYhlgdFuOOwWL916njBVfebQc29yvk+33yRLmmmTH+fme8Zm+o=
X-Received: by 2002:a37:a3d6:: with SMTP id
 m205mr18923473qke.241.1589886529839; 
 Tue, 19 May 2020 04:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAGuNez4rgOrtf_jEX1TC-D-bjaFVRr46=WmMi5N1hdqoYBP1ig@mail.gmail.com>
 <2161e53c-ccd5-864c-8b4c-ceeb8cf120ea@samba.org>
 <CAPkcVAEg+PQC1Q5=2oXWZeM7ZvS6JJe46HpERAbxVydM2iz0oQ@mail.gmail.com>
 <d994e36b-614a-06d6-385d-8ca696b37dcd@samba.org>
 <CAPkcVAHPa7fpeDO8BoyBdYr2ekNNROD1uM+_55etG0vugMYETQ@mail.gmail.com>
 <6133c69c-8b85-179b-0f93-380f6d43d853@samba.org>
 <20200518223134.GF30317@jeremy-acer>
In-Reply-To: <20200518223134.GF30317@jeremy-acer>
Date: Tue, 19 May 2020 16:38:38 +0530
Message-ID: <CAPkcVAHjB-GjcwDWc6iMKNWBWDHfeMwnb9wjH6fEoAqRbB3gUw@mail.gmail.com>
Subject: Re: [PATCH] SMB2 Compound related chain handling when generation of
 FileId has failed
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
From: anubhav rakshit via samba-technical <samba-technical@lists.samba.org>
Reply-To: anubhav rakshit <anubhav.rakshit@gmail.com>
Cc: "samba-technical@lists.samba.org \(samba-technical@lists.samba.org\)"
 <samba-technical@lists.samba.org>, hemanth.thummala@nutanix.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 19, 2020 at 4:01 AM Jeremy Allison <jra@samba.org> wrote:

> On Mon, May 18, 2020 at 06:06:14PM +0200, Ralph Boehme via samba-technical
> wrote:
> > Am 5/18/20 um 6:00 PM schrieb anubhav rakshit:
> > >
> > >
> > > On Mon, May 18, 2020 at 8:37 PM Ralph Boehme <slow@samba.org
> > > <mailto:slow@samba.org>> wrote:
> > >
> > >     Am 5/18/20 um 5:02 PM schrieb anubhav rakshit:
> > >     > Hi Ralph,
> > >     > I am attaching additional test case that would verify
> > >     > Create(RO)->Read->Write->Read->Close chain. As expected we see
> Write
> > >     > failing with ACCESS DENIED.
> > >
> > >     yes, that's as expected. WHat about the read?
> > >
> > > Both the Reads succeed.
> >
> > cool, slow: 1, metze: 0: :)))
> >
> > >     Also, CI fails with the new code:
> > >
> > >     https://gitlab.com/samba-team/devel/samba/-/jobs/557045164
> > >
> > >     I have no clue to offer atm why this fails in an unrelated test.
> Sorry!
> > >
> > > Let me triage the failure.
>
> Ah, I think I've found the problem.
>
> In smbd_smb2_request_dispatch() when
> file_fsp_smb2() fails to find a file
> handle you're unconditionally checking
> and returning req->compound_create_err
> if it's not NULL. You should only check
> and return that if it's in a compound
> request (req->compound_related == true).
>
>
Thats a good catch! Thanks for looking.


> I have an updated patchset that fixes
> this (attached). I'm running in gitlab-ci
> now.
>
> Before we proceed, have you filled in
> the Samba copyright policy form here:
>
> https://www.samba.org/samba/devel/copyright-policy.html
>
> If not, email it in - that way we know we've
> got the rights to integrate the code !
>
> Cheers,
>
>         Jeremy.
>
