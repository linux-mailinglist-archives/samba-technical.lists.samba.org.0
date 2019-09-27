Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E4ABFF68
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 08:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BDOP+d3pjeA2syqYP3No56/PA2kieKwao6mGpSFq65E=; b=kcaezlZkN0klZujRyZvQA0ncHv
	LL3fAtetv7zO739bB5zCCgtHCR6AxgJfcrAbaUjE4/vfEXQS6bPmx0RXmKFd/uw3/d9pI8sUGVGsG
	g3n7DWQhM+rH+zKmvkjZtIsqsr6dDoVQHvegY4HUR7tTuQ0FaLg1j9uFvQe6HjKs3XbqOWEhBYKig
	8wSJxDINaMj7x8VmWCFbyUe+e/wGFWcxthatB3g5NEdlskCW8QbbTK+ZsyE4ojGMqGIx4Ftnn/QVP
	OxwocfI4Mj6Zk6i4B+MbgQT400lahNE31Sw0/hKjttKQOvaUU4Txt3to7fkpU3bCJL7Ef5z506nAE
	m+7FHy+g==;
Received: from localhost ([::1]:36540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDk5U-0094ZH-99; Fri, 27 Sep 2019 06:50:44 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:33597) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDk5L-0094ZA-Ki
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 06:50:38 +0000
Received: by mail-io1-xd44.google.com with SMTP id z19so13636229ior.0
 for <samba-technical@lists.samba.org>; Thu, 26 Sep 2019 23:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BDOP+d3pjeA2syqYP3No56/PA2kieKwao6mGpSFq65E=;
 b=MH8ll6vGgxWsoCPL/cgE7XYotw4WWKXOp7s1GoH5gfd0d1RWd95FRgOUcweUgVIihg
 PcUU/VHt4aC3nE5NRoOtettoX16rcltq57x+cdT+n7J2enKjg9bcdu7TzfpCWe3mmwg8
 IL1BKKQpgJ0N6zp5aRIyxid9ihH8UEU9ya7Z6/m3hS6bauQgJ0g3t5wz01kHouelIvgW
 nWbmLXWfMNVsSF6MpZnKhG+sNLr4mO8VqYZiwcA2xShp2sW/Mq8nWgXzDuxgNqSF2ImW
 R4qy1vaZ2wG4/yfIGRyz+4WFSGgVH0IYIvioVSzArBBh9iAvBTSms+OEJx8KPds4fkJf
 U+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BDOP+d3pjeA2syqYP3No56/PA2kieKwao6mGpSFq65E=;
 b=PQ6E39JqcajWVNI5MIsndk814liW+9x/Sg6KxJgHHPQzf+U8RGUlvL3dU6KigRGgsL
 CmGnrb1xFlMD9J3ECc/TC69nSgIBEMSLo2yYL9UWiVKCkMNtox6Co5Z15on//m6Fxl1i
 uVrdCs4+MzNTFuCYOCCiga5xNaUsbSPAd6yzTq508hBkAnDKXIW2Du8GIMzyNW7UhCgD
 En4gAIAh3HC4fa7Mi2CPpO/aooZc1P6+DXzRZidkco+mF571/zW0b2Lt3GmZWnZ3NCIu
 IHnMW7DJdBMDyq+VSlxL4On1GYO6QTW/ST5ulsLScIwFutrSBQAPPmKproB9tdarcRVm
 E3sQ==
X-Gm-Message-State: APjAAAWeaQuJfG0NGspQAIw6ui4aKeGh6uG3Tqxi62jRLAO2+xXQ7DC1
 jKJOYU6aIFbfBmnWky6aTUpT96DOTYB0p6PFWF4=
X-Google-Smtp-Source: APXvYqw/JXOElsnUZoCxeJ0e5TgLymQaqRDBdK9B/oazCQrJCA28euezh+c7AtW3lYqn9HnN8eC4EzGxlg/w082WyXY=
X-Received: by 2002:a6b:5f11:: with SMTP id t17mr7153281iob.169.1569567033838; 
 Thu, 26 Sep 2019 23:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>
 <461a8f64-1f29-5b30-6b2d-4f4f88812323@samba.org>
In-Reply-To: <461a8f64-1f29-5b30-6b2d-4f4f88812323@samba.org>
Date: Fri, 27 Sep 2019 01:50:23 -0500
Message-ID: <CAH2r5mvC6qMyxmhB_fdXxnXCztefowpWcgqxUgK1m_GSFZOS-g@mail.gmail.com>
Subject: Re: Getting the SID of the user out of the PAC ...
To: Stefan Metzmacher <metze@samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 27, 2019 at 1:44 AM Stefan Metzmacher <metze@samba.org> wrote:
>
> Am 27.09.19 um 08:39 schrieb Steve French via samba-technical:
> > Is there a way to get the SID of the user out of the MS-PAC through
> > Samba utils (or winbind)?
> >
> > This would help cifs if when we upcall as we do today to get the
> > kerberos ticket, we were also given the user's SID not just the ticket
> > to use to send to the server during session setup.
>
> Only if you get a service ticket for the joined client machine.
>
> But I don't understand what a possible use case would be.

When not mounting with "idsfromsid" this would allow us to use the
correct owner SID when creating ACLs (to include the owner and mode)
on mkdir and filecreate (the acl can be sent in the sd_context during
create)

-- 
Thanks,

Steve

