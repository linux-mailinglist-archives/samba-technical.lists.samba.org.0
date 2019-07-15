Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3896849C
	for <lists+samba-technical@lfdr.de>; Mon, 15 Jul 2019 09:51:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2PPKKiy4TOkySs84erSTaGPrR7iQ7CdeTu3bd/bWAIQ=; b=tbRvCgQ8n/h+FfLkRB7YkBDfEA
	okPckliYZO0NoIWToloVTHGCjY45H5hBIEV7SMdJWPfIyzVFjMLQtO3GgfY7P1b9D9BSCttsUcwPO
	KoTGewGjAhg01JWdTHVf/d8VMzhXhqMtW2r/hsQYJ5kicVC4nPKh44OCKfkAa9cv3CsvWX+UM07PU
	xjoYG10jIExUvqgwM5ymiTiVHbWA0jR4taPoZysUUb/q6Y0fjYUm6wKmpqKNbxlGPdzq2oLYdRvxi
	nUg/XZxBHxk7A5KRPRX5egE6ZkGV6G74Zi5dPyXJM08HTiRwn6k27wVX9ZvYYe1wK3/Nr4Rf2DZWh
	x5if8zag==;
Received: from localhost ([::1]:21222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hmvl7-006piC-0S; Mon, 15 Jul 2019 07:50:53 +0000
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:45594) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hmvkz-006pi5-MC
 for samba-technical@lists.samba.org; Mon, 15 Jul 2019 07:50:48 +0000
Received: by mail-yw1-xc43.google.com with SMTP id m16so7055691ywh.12
 for <samba-technical@lists.samba.org>; Mon, 15 Jul 2019 00:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2PPKKiy4TOkySs84erSTaGPrR7iQ7CdeTu3bd/bWAIQ=;
 b=jtFWvSggLjAdlRoLceRlD3L8mhrjoJM+b0hNi6SVyoUIjpIXh+1F1+YFQT/gTco5dG
 YOxQod8ltqERqXGxaHtsPX6i9FbySs8UfKp7XsGbfrYXJWBGYgnA1baouQncNkf4apuu
 QiZzFEcrjgqh2/rbw4fMJ2mE1x8tbTBoWLxa5m7hWHCUP97jGjeL0Yoc5PEplVb4Ocsi
 0IMYSmkyG/2z7OFEi/xdE4IA+v56nG3HEecfIDojLpKKF9Loav6H1bw4KCprkvAq2fNl
 JbbqfG9sP3mybUuHsb8iDiJBjasVnMssEQALlAHSOBpclwfIaZwZ9SOx6HWFrJnrgCHP
 3z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2PPKKiy4TOkySs84erSTaGPrR7iQ7CdeTu3bd/bWAIQ=;
 b=Zb+WlhEtfO91/4lzvFFWdL7OMHFoaphrLpEWhH46iHs5nBu610kUz/NQHuaZuEjnSu
 TlyhYIVT+Pzw04Ec9bk1TBj0zunzEMAxwFESiXZL9NHaPb3eR+iWDwsmRCslRbhDt2XR
 dzCCnP5uLTcvn32VCkyKRUhEGsY7lkJDBC1bK8FW7Eilxyuj2xrC26WbLaq/ed6bDqPr
 Nubkv9f/vr2c9GJOGAAUQECRAcDxOK9YlUrAAB6MwLzB05FiWP6JnlksSuJaIgivZg4a
 0q3F7QwGsUXdprrCyTnHauvhVhsObLQRn/mMP43Vw0gftleE/hlU90v5mYluTkhnf27a
 JWmQ==
X-Gm-Message-State: APjAAAU6o5dcF9YFpbFhGgbhl4cZUeNkjHI79/qJBVm8H615WRq2NDt9
 fGE4aZrwYHyaH5kwtn0kl7PTrj0+QXnWqP0Vs5nHMZAo
X-Google-Smtp-Source: APXvYqxlHNixHRSxJaTHsrNyfNsQ/iEjX941UVv5ReMsihu6kuOIKxsk1kVQyd+N4jh7C6Kvt7BZ7YjXMrjrZ/jqRf8=
X-Received: by 2002:a81:3c12:: with SMTP id j18mr15450493ywa.294.1563177042978; 
 Mon, 15 Jul 2019 00:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
 <CAH2r5muC=cEH1u2L+UvSJ8vsrrQ2LV68yojgVYUAP7MDx3Y1Mw@mail.gmail.com>
 <CAH2r5mu0yMPX+JFrWvnciYdWVRxGYgPsSX2UKOj2O70-bxzrsw@mail.gmail.com>
In-Reply-To: <CAH2r5mu0yMPX+JFrWvnciYdWVRxGYgPsSX2UKOj2O70-bxzrsw@mail.gmail.com>
Date: Mon, 15 Jul 2019 10:50:31 +0300
Message-ID: <CAOQ4uxiQC9_OnrdzV+XniFeTDorAe-YHxWEC5c9pT_mxa62JxQ@mail.gmail.com>
Subject: Re: [SMB3][PATCH] fix copy_file_range when copying beyond end of
 source file
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jul 11, 2019 at 6:19 PM Steve French <smfrench@gmail.com> wrote:
>
> I noticed that the copy_file_range patches were merged (which is good)
> - see below.
>
> Anything else to merge for the changes to cifs.ko that we discussed
> earlier.

There was the cifs patch that I sent you:

cifs: copy_file_range needs to strip setuid bits and update timestamps

That was not included in Darrick's branch.

> I wasn't sure about the "SMB3: fix copy file when beyond
> size of source" patch - it may be redundant.  I will need to check

It is redundant, but if you plan to forward a patch to stable, it
will be easier for you to forward just the CIFS patch, so up to you.
I am not sure if and when I will get to testing and forwarding
copy_file_range patches to stable. Not sure it makes sense.

> with current mainline.  Anything else needed for the enabling of
> copy_file_range cross mount etc.

The mtime update patch is not *needed* for enabling of
copy_file_range cross mount. It is a correctness patch.
So copy_file_range cross mount should work in mainline
with cifs as long as other cifs related bugs have been fixed.

Thanks,
Amir.

