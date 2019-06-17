Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59506491A5
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jun 2019 22:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+8iBOIYe8GRatRwuo0ZhzDzIL9QDN0BlutcHT01yG1Y=; b=5YjUBS7mmJQC58UKRHkNXKFKC4
	kPdftCn66o6YgzJNiQ76OH1XY9NtglCONyhNW4csRx+F2F6/k90i9lTGL9a9cQDlRfQX3kbFxkD5o
	czhn7dNJulmTHWI7abcklc9fT3I/KjQOgpUMOuRXpBNmwoH/SlOqUfns4i9KupPLl0MSotCgSoqGa
	e/kcsBHGDhBsSBB5u3STTDRpTCyOXFlD04X7gtPlp4Yew1KIUOE6ObAcVwxcc2BUhtPVSHmQqH4s4
	ti09WZRinBdY7hXeag2mT46aIHZnKgPkqtlGOtxOAWjqu8gYzUvIC71fIR/6lmEwBctlE9ALz1cme
	BJETAdMg==;
Received: from localhost ([::1]:42814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hcyVy-000rhx-26; Mon, 17 Jun 2019 20:46:06 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:39869) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hcyVt-000rhq-NU
 for samba-technical@lists.samba.org; Mon, 17 Jun 2019 20:46:03 +0000
Received: by mail-io1-xd41.google.com with SMTP id r185so18453645iod.6
 for <samba-technical@lists.samba.org>; Mon, 17 Jun 2019 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8iBOIYe8GRatRwuo0ZhzDzIL9QDN0BlutcHT01yG1Y=;
 b=Ic/kMytFAlDVHquNuF3iJ0MPK3s5zHg3L3ej0cljUgufAJyzmEW9/2NZEBA8VlWFmx
 a8vKm2t9dkyZjygL+nem2VuBTzrZ9VdkmHj7hwEB65uBC1V/kR+ynErnyRYHdNDdJB9P
 gd4wXPUdUr9iWRo0pptdktWWdOFeJgE/M2CVNL8jNSCtLRKunM6H4FZfhatTxkafxjTB
 x/kYPpKae6n2uPdDqp+swQHR0QSWr4+iFgju1s3445QthdQqjqU48MFYE7AGktYvLZgK
 C5oSU6/ZIF98w+IZ8aBSia4i2KmisgAdWw3Irp3Kc5BGJdNvcyDvQlolVDfroW7smWmJ
 /Cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8iBOIYe8GRatRwuo0ZhzDzIL9QDN0BlutcHT01yG1Y=;
 b=aXR73fMaiqrF3FfXUiRxvmh7zCfYbjq+iqtjltnOjLEfqv2Wkx8TmdYuBhvJvkF8yj
 Zejqq077pftuzFra6SZlo2ae/S3rIiXtMj0e4iU3mzn7GBLl9OS7Moku8of+339Pdk3F
 UdEq9KkiMoEFFY0jC0E0AzWSCukC9C7OWiBKmHC211gR5qtGnWFMR6kb1iZgydlXOJdW
 Sk0Tvs8u5JcFk3fzGNPtmMlFPt3fIyOqeaIHXFUmTBviO4nMcMH2gzDUVUNfJ1DfE+CL
 FBOCDNF4s6UoZAKEfrgOtU67njGDwTnS2s6pzevquXc9bHTSoFwkqUiVSQdFOoF8BSaA
 NmZQ==
X-Gm-Message-State: APjAAAVzKPV/E16mL6rR0yCnDjj5y1dIpAfeZu3C9ljbrchYuERngPea
 TMaoDav1Qs38BmPcP6HlbTMtn0uR/Z61HXLsqrY=
X-Google-Smtp-Source: APXvYqxgEZU7D3sHOzwxv7XhU18d3gA8LyIGfa40yJTz4WU1/mOz0fG65h/Bsznvmjv/M2VJ9O+pjdDiIkBb62zrCK8=
X-Received: by 2002:a6b:4f14:: with SMTP id d20mr543532iob.219.1560804359714; 
 Mon, 17 Jun 2019 13:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvo9sWf8VoPb8puCDh4HM6WnrMgjs+HyhUzqEZXtuQwtA@mail.gmail.com>
 <CAH2r5mtC5cXkhAVrioy_cLeoTq_4Jq0nw3CR4HTiEP_twSSKJg@mail.gmail.com>
In-Reply-To: <CAH2r5mtC5cXkhAVrioy_cLeoTq_4Jq0nw3CR4HTiEP_twSSKJg@mail.gmail.com>
Date: Tue, 18 Jun 2019 06:45:48 +1000
Message-ID: <CAN05THQaHUATgVy=5AKksQ+FciLxP=uuC1PwHe5gLm+g=Qz-aw@mail.gmail.com>
Subject: Re: NT_STATUS_INSUFFICIENT_RESOURCES and retrying writes to Windows
 10 servers
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Paulo Alcantara <paulo@paulo.ac>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Reviewed-by: Ronnie Sahlberg <lsahlber@redhat.com>

On Tue, Jun 18, 2019 at 5:51 AM Steve French <smfrench@gmail.com> wrote:
>
> Attached is a patch with updated comments and cc:stable:
>
>
> On Sat, Jun 15, 2019 at 11:18 PM Steve French <smfrench@gmail.com> wrote:
> >
> > By default large file copy to Windows 10 can return MANY potentially
> > retryable errors on write (which we don't retry from the Linux cifs
> > client) which can cause cp to fail.
> >
> > It did look like my patch for the problem worked (see below).  Windows
> > 10 returns *A LOT* (about 1/3 of writes in some cases I tried) of
> > NT_STATUS_INSUFFICIENT_RESOURCES errors (presumably due to the
> > 'blocking operation credit' max of 64 in Windows 10 - see note 203 of
> > MS-SMB2).
> >
> > "<203> Section 3.3.4.2: Windows-based servers enforce a configurable
> > blocking operation credit,
> > which defaults to 64 on Windows Vista SP1, Windows 7, Windows 8,
> > Windows 8.1, and, Windows 10,
> > and defaults to 512 on Windows Server 2008, Windows Server 2008 R2,
> > Windows Server 2012 ..."
> >
> > This patch did seem to work around the problem, but perhaps we should
> > use far fewer credits when mounting to Windows 10 even though they are
> > giving us enough credits for more? Or change how we do writes to not
> > do synchronous writes? I haven't seen this problem to Windows 2016 or
> > 2019 but perhaps the explanation on note 203  is all we need to know
> > ... ie that clients can enforce a lower limit than 512
> >
> > ~/cifs-2.6/fs/cifs$ git diff -a
> > diff --git a/fs/cifs/smb2maperror.c b/fs/cifs/smb2maperror.c
> > index e32c264e3adb..82ade16c9501 100644
> > --- a/fs/cifs/smb2maperror.c
> > +++ b/fs/cifs/smb2maperror.c
> > @@ -457,7 +457,7 @@ static const struct status_to_posix_error
> > smb2_error_map_table[] = {
> >         {STATUS_FILE_INVALID, -EIO, "STATUS_FILE_INVALID"},
> >         {STATUS_ALLOTTED_SPACE_EXCEEDED, -EIO,
> >         "STATUS_ALLOTTED_SPACE_EXCEEDED"},
> > -       {STATUS_INSUFFICIENT_RESOURCES, -EREMOTEIO,
> > +       {STATUS_INSUFFICIENT_RESOURCES, -EAGAIN,
> >                                 "STATUS_INSUFFICIENT_RESOURCES"},
> >         {STATUS_DFS_EXIT_PATH_FOUND, -EIO, "STATUS_DFS_EXIT_PATH_FOUND"},
> >         {STATUS_DEVICE_DATA_ERROR, -EIO, "STATUS_DEVICE_DATA_ERROR"},
> >
> >
> > e.g. see the number of write errors in my 8GB copy in my test below
> >
> > # cat /proc/fs/cifs/Stats
> > Resources in use
> > CIFS Session: 1
> > Share (unique mount targets): 2
> > SMB Request/Response Buffer: 1 Pool size: 5
> > SMB Small Req/Resp Buffer: 1 Pool size: 30
> > Operations (MIDs): 0
> >
> > 0 session 0 share reconnects
> > Total vfs operations: 363 maximum at one time: 2
> >
> > 1) \\10.0.3.4\public-share
> > SMBs: 14879
> > Bytes read: 0  Bytes written: 8589934592
> > Open files: 2 total (local), 0 open on server
> > TreeConnects: 3 total 0 failed
> > TreeDisconnects: 0 total 0 failed
> > Creates: 12 total 0 failed
> > Closes: 10 total 0 failed
> > Flushes: 0 total 0 failed
> > Reads: 0 total 0 failed
> > Writes: 14838 total 5624 failed
> > ...
> >
> > Any thoughts?
> >
> > Any risk that we could run into places where EAGAIN would not be
> > handled (there are SMB3 commands other than read and write where
> > NT_STATUS_INSUFFICIENT_RESOURCES could be returned in theory)
> >
> > --
> > Thanks,
> >
> > Steve
>
>
>
> --
> Thanks,
>
> Steve

