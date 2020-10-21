Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 98140294735
	for <lists+samba-technical@lfdr.de>; Wed, 21 Oct 2020 06:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fGwWBrTXCBU14TfF21sseLCDuwxYh2cnRrr5ltOxie0=; b=NYr9CLQHxopNnyOIpTO0or0KaG
	mcNnf30a3ZFfT69if7Cjc9ZVRrvTCwLqPE5Jm9vHK1A9U8xft5X1YrNp57alvZ4KdiZR31jw11CgO
	PleHpOGc05mhzGpIfaj5Q52uqTM2Z2HBq4815U5bxTeQHuUIdFFFV+n0J+hp96OCIWizg4nsAQWS8
	SvaNrcme/pMtnOYIvOHutEiRqyvsW4RUkeT0LcfaR1Fk1ERQ98JGdDYA1NHUsTPFUF95mRNevhmUT
	6BvhIphUMiDTzHTYbphDyGCzyWJ0rIA/Uh1Okbd59stYm1scQ3mLsKkyfsj63wJ8VdzjI8hx7Zvhq
	X4x3qlwQ==;
Received: from ip6-localhost ([::1]:50878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kV5bB-00D0hi-QC; Wed, 21 Oct 2020 04:19:41 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:41636) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kV5b6-00D0hb-N3
 for samba-technical@lists.samba.org; Wed, 21 Oct 2020 04:19:39 +0000
Received: by mail-io1-xd2b.google.com with SMTP id u62so1304095iod.8
 for <samba-technical@lists.samba.org>; Tue, 20 Oct 2020 21:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fGwWBrTXCBU14TfF21sseLCDuwxYh2cnRrr5ltOxie0=;
 b=KNbkJ5vEFGUh3sdQdvHb/fwvzPU+ARfLhaZ+nkAAbekhwOW4uQa7FjiqdTlxMpzG+u
 RDGbLRdkpAsSH9MB1Jjq6l5D/EYERM4H/q4yjCQZGmknWeT3Vm5Ym8bqf3Bvr/Zm9XFN
 2l6py7hEYIOXw+XZWlFcExiSsV7qRGgysK3EtW2F2DsTFIZQVnaa7Caz6N0jugFh+zey
 ALxWbSlSD0+HSpGI6KwjAdmOvnL0C9tPXyjidcdHWYfdH8MSEeaHDL8ynnp5fD54VRJn
 o6HBTXOexK3oTpbko5wZvOldG+SFbaqQaqikSV5HcuBMsP29Zsvuxy7oI2l8Sn3F7SY7
 kvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fGwWBrTXCBU14TfF21sseLCDuwxYh2cnRrr5ltOxie0=;
 b=tQvvnV92g0apDWp2PKAFQerHxYO1+oZZDNZSyRRN07q47ibh/djafEn9Z/mYjeoDsw
 n8z5QI4OScmjFH4lutdnGYzgONFQO1eWpQ5EsX65eBm8RtqMf5+UTg8ko8NaGX35r3Sy
 5JxI42dvjzABafeE5p6Z2Kk6SNoBfO9o3HD+FuEMcPh+vW2yUip4gPjaYMc1Baq+sB6L
 zPFvnNlxYzVGUlkvIX5j4UvU+hJMFcZ5uCaPjP0mr0kJKNvOzrfWjdXHI4cit6uzoa89
 gKod9w4Ff7FCa89QsPRq4/BhRfQZZhRS7eBp8f42dG5CuOU1z5f5ygvGHYqWcl4CwGfk
 /T5Q==
X-Gm-Message-State: AOAM533yC/l+qVTEkQGGobe+DK52NrNkE+/y5oTidjbQMl2QpRPMFV9d
 PdHBA/xhKpUsJl/1o2gwwsVRc6ECiXISmnt34M0=
X-Google-Smtp-Source: ABdhPJzNevxHeDYq4DZuE88rYNR0RKBQmcrWJLy14OhzUCpVU+VfuodXibXGW4EJLFjLmNeEMcL+PW9R0CgRNTBDUlg=
X-Received: by 2002:a5d:904d:: with SMTP id v13mr1205318ioq.116.1603253974166; 
 Tue, 20 Oct 2020 21:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mu2s3Fu+_mWTiXFp+JYTAWZZrPCDyDNtWAhit2DjB890g@mail.gmail.com>
In-Reply-To: <CAH2r5mu2s3Fu+_mWTiXFp+JYTAWZZrPCDyDNtWAhit2DjB890g@mail.gmail.com>
Date: Wed, 21 Oct 2020 14:19:22 +1000
Message-ID: <CAN05THT4zcQaB8HHEsYi_nA9=VQMuqd53h0=BTSi+FtxYMuiMA@mail.gmail.com>
Subject: Re: [PATCH][SMB3] fix stat when special device file and mounted with
 modefromsid
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
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Receiver-by me.

Should we set up a test for this in the buildbot?

On Wed, Oct 21, 2020 at 2:05 PM Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> When mounting with modefromsid mount option, it was possible to
> get the error on stat of a fifo or char or block device:
>         "cannot stat <filename>: Operation not supported"
>
> Special devices can be stored as reparse points by some servers
> (e.g. Windows NFS server and when using the SMB3.1.1 POSIX
> Extensions) but when the modefromsid mount option is used
> the client attempts to get the ACL for the file which requires
> opening with OPEN_REPARSE_POINT create option.
>
>
>
> --
> Thanks,
>
> Steve

