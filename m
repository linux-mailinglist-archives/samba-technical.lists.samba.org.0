Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73600C00A3
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 10:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aII4M2SwZO+GRDmd3nm0B9UpYMTlksmgmY752Xryfwg=; b=qQi00StxKw+dXH4UhDfcDppOyS
	V71zwkvbyCp1XoukyQ+eqYAM8V0w3K6qvUBL6eiqlLBTZjN0i394OlgyDmLCRyECrbrzArBapNvv3
	MGc1XzmpvJgi79hnJvhDt9uR2tRSNDYBIcCizCf9j5bLZRd8oOKxu3xalYjqvcIP7hBa1Zm83WCMi
	VtqGnQz4lVEXPYFjFfOT31LzveDTVDfsFJPs6DZVxSa3u+S2MgaBabjHbpKkhHiExULdCcG/U2Mgk
	lLFB7djoAjD9ZG9kna2k4S43cvo9EhYBQs7AJcQUima1s+uzd4tfj0ZZK+9ZT1ZVcw63zRj1d4Ts4
	3aALiZpA==;
Received: from localhost ([::1]:38622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDlFo-0095Cr-Pr; Fri, 27 Sep 2019 08:05:28 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:38937) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDlFj-0095Ck-Hz
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 08:05:25 +0000
Received: by mail-io1-xd2f.google.com with SMTP id a1so14033308ioc.6
 for <samba-technical@lists.samba.org>; Fri, 27 Sep 2019 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aII4M2SwZO+GRDmd3nm0B9UpYMTlksmgmY752Xryfwg=;
 b=rgBxjCxjhPdcbOfu4hiaChXBj51sjdBd/pOIfRwcGb+gHt0bYoxcDGmZBzFmhe4/ui
 2YKrQX3qA93oZbxUdftjoSrdCYpGdvZTLDz8clv7fXMwSNIa1XygnIOaX5KTQMA4dYbw
 oT7z7CECOUmtiGIbWpJpqQasaug3PjG0RVD0LDrbcLrrbR0fDPp2ijbckxj16XvZxCYl
 oJbh6VgOaK3DLAhFbJu2heVPX6FhSRCBOfTKyIC3wUnTMyN6zL4Di0Z87y2WGC/ZLran
 TSnOWrVXNhN2kfJLugBVMGjaTe0mjnzUGaKgTD832t70AbOrd6FP40h2j44cBtGGt2JN
 T7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aII4M2SwZO+GRDmd3nm0B9UpYMTlksmgmY752Xryfwg=;
 b=pnadaTVcc0ioZEqcnWJonntP1xrbhVLYv/dY3U4IaJwF+aztcAxeAvsdfymhuklATr
 jEgSggcG2WfaqAsQUY/6kOWsYYJl22VbsSp7+L4YYUOEqbJ31P+aOp54pVw4jml21kUz
 TeNFkIwb/1QON7tilMqGrSG6xunhU5RpYugqVnJ0e/sQzTv6c0ouVeWlXPvUnuP/EuOO
 aNdwdjL6usR8IUQDDYi/DxjGwhD03JlIoS6hGhoDIDHAtkSRr23xy+QZnRhgCxeUx5TA
 wFDFA8WzM7WdqQQq6hmYitTt4aqjzCdegZ4Wm3B+bA0JNNSZDLTcm+Lg+74J+FuJnhFs
 gJEg==
X-Gm-Message-State: APjAAAW6QbjHPBViXdFLVx1viRoQ1NSt/y5BuEoSs+D3nosRALYvK969
 8m7O5Q1eV2j6LMv3lyOvlxUK3Bxj1E3k4YTyzCg=
X-Google-Smtp-Source: APXvYqyy5KszHwxSTkUamxhjSmdfrXjsdptssDmQF/MWhvmTa3qKwsUQDohWBRPumTR2JE1fiwGXLHlJ55ffxIrjQ+E=
X-Received: by 2002:a02:3e91:: with SMTP id s139mr7333168jas.22.1569571521958; 
 Fri, 27 Sep 2019 01:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>
In-Reply-To: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>
Date: Fri, 27 Sep 2019 01:05:10 -0700
Message-ID: <CAN05THT-hc84ZOK-c7ZAxRitCKWDVtRCJpvBzYfv9=CqpSNdmA@mail.gmail.com>
Subject: Re: Getting the SID of the user out of the PAC ...
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Please don't.

You can't get the sid from NTLMSSP

On Thu, Sep 26, 2019 at 11:39 PM Steve French <smfrench@gmail.com> wrote:
>
> Is there a way to get the SID of the user out of the MS-PAC through
> Samba utils (or winbind)?
>
> This would help cifs if when we upcall as we do today to get the
> kerberos ticket, we were also given the user's SID not just the ticket
> to use to send to the server during session setup.
>
>
>
> --
> Thanks,
>
> Steve

