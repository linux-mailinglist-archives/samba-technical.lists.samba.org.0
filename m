Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B12D6DF6
	for <lists+samba-technical@lfdr.de>; Fri, 11 Dec 2020 03:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QuRY546BfmSzy+N9Tky/DlLLWusLNFsCoUKXWslDJsw=; b=6GsqlLshMwYOfZ3uJ0vYAt7fyl
	qLr2cAYQKC9LvvWDIygIDc6aKmO4lJ6WT4s9bTKUMcm0c1HTYlC0YaKdvKD4G6eYWFp+NK0dVPOxG
	e8+4tVJ4AmvZUT9e6T4Vti/hCC2MNqD2lRcEbnIJVK0WI/pwjusrYjOVHawr0xTwSXF4iLLCJHo3X
	iFFjZKlDrEufnkzYEocgFK7Ec8LJ+eGv8KtCOir9UEzycrgavzFsfrFRsf0zICQx8R5CorUx3XNc3
	DnM4kCfBEjHu8yfo8o0qPMHrTGWiGkAIIkI0+wsZE0U/PBE0+UIFkvbVfgQOL98lQY5wHt51TRcZN
	9hD25Pdg==;
Received: from ip6-localhost ([::1]:55280 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1knXoZ-000T0k-GY; Fri, 11 Dec 2020 02:05:47 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:40237) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knXoR-000T0d-JQ
 for samba-technical@lists.samba.org; Fri, 11 Dec 2020 02:05:44 +0000
Received: by mail-ed1-x542.google.com with SMTP id h16so7698746edt.7
 for <samba-technical@lists.samba.org>; Thu, 10 Dec 2020 18:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QuRY546BfmSzy+N9Tky/DlLLWusLNFsCoUKXWslDJsw=;
 b=CcRs16+ffJAhhtDylp0EVdsO4BlE5fMzHa1kpq9pPJVEAN2WBg15skTkuXE0NXJQQk
 h8vBtTSkRwJ77XmqMgL8l+t0G55Y1f0hgNfF+XJIKsIeTtrSwM4Zg6N6PEz+VGRP3vGB
 53uKxRvdfq8ZAyHfcm9OygsCEfocU0Ffr87NJK3NJXnlYPKI5mBUIgKppqGOnH4eThhk
 8H/sOHoM6jMGnINOoPBKmtjo0qTppfW1Kc39DvdqzB14UQAtuGhgvOWuNiPYtPm1hkyp
 4PMM7jJwxIs5i+f2o9y5HniMcU9n550oJ8M/PdN30KOUDNG7Whfk2iWakGhCrp+XWW1H
 AGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QuRY546BfmSzy+N9Tky/DlLLWusLNFsCoUKXWslDJsw=;
 b=jcbpmn+Kaa+3SaR30HgrqjbeHqY0AiNac44vhNmPHeUgFD8XU5Ly4ftoW03DF7Elz3
 QB7nmLoI55rfWdZthA7kEdMcntUjngXyc08MVNQzgeQHRYMntUWARhak3b9OXfhpBmYd
 tm4ZBYiRvIsXxc/CsLO+eFzGdYGTtjAP26FI1b6UC8VMDMuovErAhJgh/Nah/86EUVPG
 wDUw0vR9AccluSxGUo/Mq+syQZ5zI43FLGfzswDz0LAPB1jRE5T8s7XC8C3N5+7q6Aa0
 cdzvvRDmJsrq+h1A+O0bQlIpHg/UWl8CX/WzidBCCtRA6ZCKh/rtEEFKqI47rjoZijNp
 tiOQ==
X-Gm-Message-State: AOAM531M2+oa94DEbSYc2oyYswfSLxYb3S0WEQLRw1hWE5MFKqAUe49D
 qlbFSDSgIiDHj/0qe8bGmvvpJs+gbYi/cHdZWg==
X-Google-Smtp-Source: ABdhPJweUXfKb0U+jVZV7+SPSqq4sGSzGWe1LZvn70MPdp0htEUsRP14e9SRfpqSdfkLiLjwVdy95+czXMiCcHHYAc8=
X-Received: by 2002:a05:6402:1803:: with SMTP id
 g3mr9847826edy.10.1607652323121; 
 Thu, 10 Dec 2020 18:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20201119214042.6113-1-pboris@amazon.com>
 <20201120214918.12517-1-pboris@amazon.com>
 <CAKywueTTWktt3pB5Auz0UxUOp47OowD6egb+WCuT-dQYxfvZUg@mail.gmail.com>
 <11CBBF4A-D4EF-4B4C-BF8A-CC37F661BCEE@amazon.com>
In-Reply-To: <11CBBF4A-D4EF-4B4C-BF8A-CC37F661BCEE@amazon.com>
Date: Thu, 10 Dec 2020 18:05:11 -0800
Message-ID: <CAKywueSJz=Jh1EzfT3-yrGcSypphL_SB4Nndma2LScdMf=5ePg@mail.gmail.com>
Subject: Re: [PATCH] Extend cifs acl utilities to handle SACLs
To: "Protopopov, Boris" <pboris@amazon.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Steve French <sfrench@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

No problem. Thanks for the patch!
--
Best regards,
Pavel Shilovsky

=D1=81=D1=80, 9 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 13:37, Protopopov, =
Boris <pboris@amazon.com>:
>
> Awesome, thanks, one patch is what I wanted!
>
> =EF=BB=BFOn 12/9/20, 2:13 PM, "Pavel Shilovsky" <piastryyy@gmail.com> wro=
te:
>
>     CAUTION: This email originated from outside of the organization. Do n=
ot click links or open attachments unless you can confirm the sender and kn=
ow the content is safe.
>
>
>
>     Squashed the 2nd patch into the 1st and merged into "next". Please le=
t
>     me know if you'd like those patches to go separately.
>     --
>     Best regards,
>     Pavel Shilovsky
>
>

