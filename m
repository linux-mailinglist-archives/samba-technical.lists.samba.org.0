Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4BCA7917E
	for <lists+samba-technical@lfdr.de>; Wed,  2 Apr 2025 16:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UlDDmqyiH5QktAkU8mn2hnFbNZ4kZPcgVIqwydm03sQ=; b=L2AA0f8ubConvNWAW56iOza+Cx
	qIJ4PaLXUgNeSD1Pp0lYlrGhS2G2MFwmJrsinhwRXFgsscaWeNf9j1Grq5Yl0Go+lexuIb86iC4yL
	USNgaNxCBU2fEM8/XT1XedWY0KvOzNOOeGG4A1rF60hjLCceyQgqLu872L13OF14xUQ8/0ILCbopt
	OQjOK4/VgHuT5CHR+5dbVnXT+DlElKHySeO/qHwsLghzxpeg/Tax0hzZa9AdQMmsxxk/RjzKZEHj8
	aDmeHkgzAvwMw/mZbUsVQFbGVzjslA/yU3GPI62DQkYW7yhqW8DIlikCI+k3VhUu16hkBxm/hjdin
	GJR0w1fA==;
Received: from ip6-localhost ([::1]:33990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tzzTR-001ahW-No; Wed, 02 Apr 2025 14:53:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45415) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tzzTN-001ahN-13
 for samba-technical@lists.samba.org; Wed, 02 Apr 2025 14:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743605609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UlDDmqyiH5QktAkU8mn2hnFbNZ4kZPcgVIqwydm03sQ=;
 b=Ws9ZW2J/PAY34Z8caXGacsLoG8Yi5yqyuBWN1bnK8bZYF9hx4+FPhcZif6qIlPqnfdpK87
 tjE/4nNP9Xr0u4X+6/ANzt+Nsn8ilTt0e7UFA6EhsVFzI7vQ+3I7srGvIm/CC1hOlmyqGe
 LzaeQpclcQCNIeYWCs7yyiWRZDkDp2Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743605609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UlDDmqyiH5QktAkU8mn2hnFbNZ4kZPcgVIqwydm03sQ=;
 b=Ws9ZW2J/PAY34Z8caXGacsLoG8Yi5yqyuBWN1bnK8bZYF9hx4+FPhcZif6qIlPqnfdpK87
 tjE/4nNP9Xr0u4X+6/ANzt+Nsn8ilTt0e7UFA6EhsVFzI7vQ+3I7srGvIm/CC1hOlmyqGe
 LzaeQpclcQCNIeYWCs7yyiWRZDkDp2Y=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-9ZybdbusPy27s8ujI-pZeg-1; Wed, 02 Apr 2025 10:53:28 -0400
X-MC-Unique: 9ZybdbusPy27s8ujI-pZeg-1
X-Mimecast-MFC-AGG-ID: 9ZybdbusPy27s8ujI-pZeg_1743605607
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4770cbdb9c7so131291931cf.1
 for <samba-technical@lists.samba.org>; Wed, 02 Apr 2025 07:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743605607; x=1744210407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UlDDmqyiH5QktAkU8mn2hnFbNZ4kZPcgVIqwydm03sQ=;
 b=AOAQzl3sDVSR6FvKFtJZ5EBiG6ia7tk/pVwpCkHNfktPlDdiXrxuRslEwGF9jiTu9n
 h752jE2/zINyyvjv4edk1T4YHxbnhsSRHL2pJ1Vw//JYPVILxUChUWQs8DS3Jh3eGuhW
 EsO9UBw8W/7DRXhFCfJdJ7/1dPEPSQYEm4gF9R32pNFiu+3nqGcGm25KDNX9OlJVVQPz
 NTs4mfydQRn066bYx2u8/zFWq4JjAslXNfbkwe3YnOhAfZxJYnXBTc/k0rwvGJjdiu2h
 6hcU1qmCWVbDD7kUAlZmbboUy430EnmwtF1qX743RK8YH2+5WWXfUZD4t6JP1GACpQCw
 lzBg==
X-Gm-Message-State: AOJu0YxR1/3bxhPotjel4Ab/YOuDui6AihNsjfAjLR8lboDaUWe3cyGd
 e/JmPpeIr9X515fKaxNLors2EKGCitpIYi+gz6xop1PAEMiYP/RGh2cKmigRjSN3e98qT9n1rb8
 njaiNhQ4l8RXgypOXn3wMRSX+rZJ6n/OCOcRR25Z4doIsyu8Jo3hTcDiLKiyYAgV3P4ZNHldFEg
 s5OeOdWPm0q0Xu6wL0lcGCn/ZxMXvFqbU6pPUUUpPy
X-Gm-Gg: ASbGnctFI+Foz5MRdK7b3aw/5fFf5r0znRfXZQGONsDbLk3zWA6tbcwlReXsvox9PyU
 2vZUb7woZYA7lJWMDdPW2A+kZVp3/L9RwSHfYzjelyKpOkynakEpw8+fgYo/M4zrnXBBcpb8AZw
 T8ZPbHLgc/kQ73d4OiZuVlP6RRAxs=
X-Received: by 2002:ac8:5809:0:b0:477:c04:b511 with SMTP id
 d75a77b69052e-478f6ca65cemr106600941cf.31.1743605607587; 
 Wed, 02 Apr 2025 07:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE89BgWdgoBFuvO6/YJwEpk/LHCX+pWAeyZ0g1dG7G32XeoarJXK7QjJSPGW/lzK6pzIkVrrgTreG/n8TUNldg=
X-Received: by 2002:ac8:5809:0:b0:477:c04:b511 with SMTP id
 d75a77b69052e-478f6ca65cemr106600671cf.31.1743605607261; Wed, 02 Apr 2025
 07:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAF8sLVX=j571xk8Z10WRinb=tb4OjJNgcQ+vm-eO8SR6C0XU=A@mail.gmail.com>
 <37c06470-57fa-47b4-9aa8-50f1cefa713f@samba.org>
In-Reply-To: <37c06470-57fa-47b4-9aa8-50f1cefa713f@samba.org>
Date: Wed, 2 Apr 2025 17:53:16 +0300
X-Gm-Features: AQ5f1JpE-lkLqi9a0dXFZxLu5eoLf63XgCHi-TUbk8VUnkcD2EBwWNtktfyqXVM
Message-ID: <CAF8sLVVfQdp-q6U5u2iWUgR5nJ4-gGNuCDL1FAgbiztpnB0jkQ@mail.gmail.com>
Subject: Re: I/O-stat module for Samba
To: Ralph Boehme <slow@samba.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7VWqj6m140tg7-mZe7zYTu-HwvjgsOGU0PhXLTG-p3U_1743605607
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Shachar Sharon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shachar Sharon <ssharon@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The devil is in the details ;)
As far a I can say from reading the profile code, extending it to have
per-share metrics is doable, but far from trivial. I will try to make
a similar POC by extending profile infra so we can compare the two
options.

- Shachar.

On Wed, Apr 2, 2025 at 4:12=E2=80=AFPM Ralph Boehme <slow@samba.org> wrote:
>
> Hi Shachar,
>
> please extend the existing profiling metrics or explain why those can't
> be extended to provide the new per-share metrics.
>
> We should have 80% of the code already in place, so unless I see
> convincing arguments I'm opposed to adding another VFS module.
>
> Thanks!
> -slow
>
> On 4/2/25 6:24 AM, Shachar Sharon via samba-technical wrote:
> > Samba over CephFS has been under heavy development recently (here, at
> > RH/IBM) and we reached the point where we would also like to extend
> > Samba's I/O monitoring capabilities: inspect the latency and
> > throughput of every share from within the smbd process itself (per
> > node). Having such run-time metrics, when exported to the storage
> > administrator (via Ceph dashboard), would provide a better overview of
> > cluster smb I/O activity.
> >
> > Samba already has profile capabilities (when enabled) but those
> > counters represent global state instead of (dynamic) per-share state.
> >
> > We would like to propose a new solution which may be useful to other
> > users as well: use Samba's stackable modules capabilities and provide
> > new VFS module ("vfs_iostat.c") which tracks I/O counters per-share
> > (and per-node) using in-memory cache. Those in-memory counters will be
> > flushed periodically into local TDB file and may be consumed and
> > displayed via one of Samba's utilities (e.g. smbstatus or similar).
> >
> > Advantages:
> > 1. Tracking I/O counter per-share dynamically (only for those with
> > iostat in their 'vfs object' stack).
> > 2. Low overhead when writing to TDB file, even when having hundreds of
> > active smb shares (each process/share has its own unique TDB entry).
> > 3. May be extended beyond monitoring (e.g.: rate limits).
> >
> > A basic POC to demonstrate the above ideas can be found at:
> >    https://gitlab.com/samba-team/devel/samba/-/commits/synarete/vfs_ios=
tat_poc
> >
> > Comments and ideas are most welcome.
> >
> > - Shachar.
> >
> >
>


