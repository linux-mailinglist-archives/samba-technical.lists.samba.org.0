Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4432F9C4E
	for <lists+samba-technical@lfdr.de>; Mon, 18 Jan 2021 11:27:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GXuH7xY624JQKeXXsXSMA5iOuDFi+Z2xx4SdJGVofIk=; b=CG65kPj516vrw7X7GHs/X27JIw
	1Kaz4eWA4LrsoUescitv5T+E8hOB1RxmJuKlZhMFAJ8XT849DfZotz1ZH6pKRui0RAsd5hYlK+tF6
	k8kmp+GlY/fqSJcjfZiVLnmbbprinP9ydwPDq53jg68XWvYLeMQu2nHDM1tvJ88uWfKos3eAwrOXT
	WGylBUbioGAFvpTxyNxVlx2lBu3rsYSRZLq9CjklrWlyhmtkKlqf8q/J30A6n6KCwJ5K0CIPhehdV
	QeF3ejOuoXrrBhV784isGoXY0l/Y9Jtq6p3fw4eRApIF81shGL4Q6j7+VNx8eljX5jc+pCuAuFkBN
	CjY6NHMw==;
Received: from ip6-localhost ([::1]:34304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l1RjU-0061eQ-PE; Mon, 18 Jan 2021 10:26:00 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c]:35391) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1RjL-0061eC-MJ
 for samba-technical@lists.samba.org; Mon, 18 Jan 2021 10:25:58 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id e27so3849486vkn.2
 for <samba-technical@lists.samba.org>; Mon, 18 Jan 2021 02:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U9I102dy1atoo+zrXfEE5X01wqboXWFqPsVJtnAMgoU=;
 b=M9Kyi29wr52qD9lP0YWybJW79W/0KSaU1lRiTfhHcoqHscntEG3l4MLo1edLI2kNdM
 ltXCMPSwRer+9KZybLWBH7FkV/jsowLJiAYS0x55w3tJXj6GtJ/2csPiz2AX+NDmDGT1
 C251gc/T0f2D9z8TkKsg+QF9JMUHMC6FBA5Ggy4uZuJVSAmWL2f3i+Jx8HGeus8mo7Jf
 tPzv3fyVNm3bCj9ZuYEWk78YL2EcMSvTNRpCbV/Kg01eUP8Ta5QA+UpGFz+QmfBTaEs+
 hYWu3OXvNY7m8mgaMxhmABKKkxz0TefnihGv8LtvMFlkeJtUxcG7gKZshP09gj3Qve3O
 E3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U9I102dy1atoo+zrXfEE5X01wqboXWFqPsVJtnAMgoU=;
 b=izfVYzh2RrP5fSBCd2oM8htY6Vm8Oaj3/E0/skBcnv8A/uLv95oEqc8s4xQiVCE1CS
 kYHJ3wtfunSKYMe7nrKLur/8xInQ+k7dq29S9mDG/z6JnHKrEDCjOKL2qa1sPCszmfPI
 Qo+6qhpJ4ShnC9jn+JkcOOQF2vviXFHhMl8v3fqV5XQNT+Le5PI37hgOS58M1dz0PrSB
 5hGOQqHape+eBWJIDl7GoAdpPk73usEisU6CWc785/LIin07tXfUeQOGprcfdfz61A+2
 l668TyB+QolmfbgOpLLJMccGhY8a4aAohjUVipBD4za7eg8072wA8+DrVmM/9AV6/aQe
 diBA==
X-Gm-Message-State: AOAM531zUp00/sv/TXuhbUJuAWuEJA9YiZv83adOCBrIcMSQqOcVAQ0S
 URF5T4ta2gO08OI5rBm5etLw3UPyReg3M+ZwH04kKIuA
X-Google-Smtp-Source: ABdhPJwBywnkZl5QZgEch87y+R3Xa3fY9GOK5Cav0BgUYkL7h/BOR3EQ8AoCvIIr4fVjSypqVqnh85aAohA7kFgSURI=
X-Received: by 2002:a1f:1ccf:: with SMTP id c198mr17827289vkc.24.1610965528619; 
 Mon, 18 Jan 2021 02:25:28 -0800 (PST)
MIME-Version: 1.0
References: <CAHbM3qgJv3he3LSokE-V1yPUttueT1esXF0vNQqHSnRPDtqz9A@mail.gmail.com>
 <20210112191328.GC1316956@jeremy-acer> <20210112194843.GE1316956@jeremy-acer>
In-Reply-To: <20210112194843.GE1316956@jeremy-acer>
Date: Mon, 18 Jan 2021 15:55:15 +0530
Message-ID: <CAHbM3qhTd=t+w58ZaVSf+zWwqNgAmQqXbOvk-zGZjeB9XALhMw@mail.gmail.com>
Subject: Re: Initializing case based parameters during share switch in
 create_conn_struct_tos_cwd()
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy,

Thanks for the patch. I have verified that it fixes the problem.

Regards,
Shilpa

On Wed, Jan 13, 2021 at 1:18 AM Jeremy Allison <jra@samba.org> wrote:

> On Tue, Jan 12, 2021 at 11:13:28AM -0800, Jeremy Allison via
> samba-technical wrote:
> >>
> >>The case_sensitive and short_case_preserve were null because we were not
> >>initializing these values in conn struct to the share configuration that
> we
> >>were switching to. We are using below settings for the share:
> >>
> >>case sensitive = no
> >>preserve case = yes
> >>short preserve case = yes
> >>default case = lower
> >>
> >>I used the code changes that are in the below patch and now we return the
> >>folder name in the referral as is. Could you please review this patch and
> >>let me know if it is fine?
> >>
> >>Thanks,
> >>Shilpa
> >
> >Thanks Shilpa, this does look correct. It sets up the
> >dfs share in the same way as the case options are created
> >in source3/smbd/service.c:make_connection_snum().
> >
> >I think the best fix here would be to factor this code
> >out into a function called by both make_connection_snum()
> >and create_conn_struct_as_root() so we know they are
> >setting things up identically.
>
> Here's what I ended up with if you want to test.
>
> Thanks !
>
