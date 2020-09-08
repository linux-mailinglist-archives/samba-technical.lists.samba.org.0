Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F363A261B9E
	for <lists+samba-technical@lfdr.de>; Tue,  8 Sep 2020 21:05:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kcUwE+w9idyvkIG+5j3Vmhpch2i4jynE4JbFRAXeY+A=; b=u9b1gYOoW/eU0oDvGBnk1IBrYW
	OYvjI39g7O2/RtsRjz4ROCRg+LwVqjqCABh0Onp6tuZpWrDLrpnU33euAkrQiVemlfXuM1ZwzLjmJ
	zFnyQBb9YhHC0MpcaSWGnQq1CZj743QMVL/AQTIcOxJ7kERkawhLO0Sd3hkwp99gS993hlrKckO0B
	GMqES0IPARMf7oF7DYg/lYunBJE4PabM02KDEkh3DrME963LNHrZPq+84cyzdMc0ZbRL0p52p+CCg
	H52eEJzgdj1pd/s6+EusROwgBHAQjyLzdojyzKXQcEZLxlumo2pumuWP4JvIOtTT/MfqoQbIfFIpt
	Uhrx71DQ==;
Received: from localhost ([::1]:50452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFiw9-004h3p-HA; Tue, 08 Sep 2020 19:05:49 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:34448) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFiw3-004h3i-Oo
 for samba-technical@lists.samba.org; Tue, 08 Sep 2020 19:05:46 +0000
Received: by mail-qv1-xf41.google.com with SMTP id q10so274488qvs.1
 for <samba-technical@lists.samba.org>; Tue, 08 Sep 2020 12:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kcUwE+w9idyvkIG+5j3Vmhpch2i4jynE4JbFRAXeY+A=;
 b=HXgOrJpbuM6KL/NKoMq0J1bACWIA9EHicTgVNUP7BawTpJQp3/S5Q8N79VAnjJ9Zjk
 Q04TdW2x8w3th6PbeTCg34kLfg9zE/7vUoyQKP06nApZ7VQx9moMynS6ilmY7FUPIR+W
 OocqMImZaX8OYOKltVR11fV8XrvwtFeJbo89IDx+0i+Pymvt/WNJRVbmXGw6jYSIkyB9
 ATaApQfG3qJqwI2HNvTSiIhrRPjATkYFz2Ioa/yz6cSCX5TpcRhjgQvxFALsGmywTpQq
 zcRZc5/9FKX+pgN1xh5HKShKmgA/LlpRStOlfDFwMv3R2Y4oWSlX2OYB2Ch8Y2nHwqxu
 M24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kcUwE+w9idyvkIG+5j3Vmhpch2i4jynE4JbFRAXeY+A=;
 b=tfX6Oc+FSp85lerEvZMpkTYLkv9EBWpFzapTX6Mh+cB7mXtzjZyno85+gLwPKFWYLS
 BHvDJvecQO+7YMg17UUvSEKNhWRgQL2C8wd0aBLn/6anA3WYc/rJR0cacOD79kBECRl8
 54PbP3U0rR07Wh+GfF3NW+Qdx+2L2HU9d22rZ8yHSnq+bL4uTFwPl6FDUirlXXDSC8/g
 WPtQSFLaroQNAihQmn60DD8KsxvF0BFdxyvV5Nb8AbPOTEHnE70tsFulYb0NP0wVhLd7
 Tx4S6m3yjArkhvRp1a1fUT0fpifhtKaBwTvX8RdYZBUxuZSv6No+4xkg7Vttv4nDEWdq
 zAmw==
X-Gm-Message-State: AOAM530hZKEKQWK2mJXCytcPjrmbrO8KHry7FRNkNqX25tPI1TzIk6WH
 yfKJGutWCBkMcs3TmFMGFABgQWetUOQMVCUbMsTsat4x
X-Google-Smtp-Source: ABdhPJw6vZQjiTQrrALxu9WFjFyVGci24Vduip7zJgBR4NffoBDFz/hKBcP7pSYk/ZQ92qqJMfkhc99rF/xjniEWaPU=
X-Received: by 2002:a0c:aed5:: with SMTP id n21mr662802qvd.20.1599591941848;
 Tue, 08 Sep 2020 12:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
 <20200908185901.GC599978@jeremy-acer>
In-Reply-To: <20200908185901.GC599978@jeremy-acer>
Date: Tue, 8 Sep 2020 21:05:30 +0200
Message-ID: <CAC-fF8THpKjJ610t2QaT=uUEkZ1cU1WqKhs0FXNiKscMursMiA@mail.gmail.com>
Subject: Re: winbindd main process hangs on samba-dc
To: Jeremy Allison <jra@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 8, 2020 at 8:59 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Tue, Sep 08, 2020 at 08:56:35PM +0200, Isaac Boukris via samba-technical wrote:
> > Hi,
> >
> > This issue was initially reported on ipa-dc, but I'm able to somewhat
> > reproduce in lab with samba-dc, by dropping returned tcp packet from a
> > DC from a trusted domain (iptables -A INPUT -p tcp -s 192.168.0.120 -j
> > DROP).
> >
> > As you can see in the attached log, the main winbind process goes into
> > blocking DC calls such as get_sorted_dc_list(), and depending on the
> > amount of DCs to try, it may cause clients (such as wbinfo -p, or more
> > importantly, smbd!) to hang for minutes and to timeout.
> >
> > Here for instance, we block for 5 second per DC:
> > [2020/09/08 20:27:49.595952,  3, pid=66128, effective(0, 0), real(0,
> > 0)] ../../source3/lib/util_sock.c:447(open_socket_out_send)
> >   Connecting to 192.168.0.120 at port 445
> > [2020/09/08 20:27:49.601764,  3, pid=66128, effective(0, 0), real(0,
> > 0)] ../../source3/lib/util_sock.c:447(open_socket_out_send)
> >   Connecting to 192.168.0.120 at port 139
> > [2020/09/08 20:27:54.603044, 10, pid=66128, effective(0, 0), real(0,
> > 0), class=winbind]
> > ../../source3/winbindd/winbindd_cm.c:1712(find_new_dc)
> >   find_new_dc: smbsock_any_connect failed for domain ACOM address
> > 192.168.0.120. Error was NT_STATUS_IO_TIMEOUT
> >
> > On a member machine i couldn't trigger it as it seems the
> > get_sorted_dc_list is done in the per-domain process (as well as the
> > call to fork_child_dc_connect()), while here it happens in the main
> > process.
> >
> > Any ideas?
>
> What version of Samba is this ?
>
> I may have already fixed this in master with
> the async DNS SRV record -> A/AAAA lookup
> changes.

git master, in this test i only block tcp packets btw.

