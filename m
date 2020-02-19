Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75B164355
	for <lists+samba-technical@lfdr.de>; Wed, 19 Feb 2020 12:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=b3ZuJIHsBIEttBuV28MNG9EzVs8aluiF8mFxqt0QOKY=; b=vslG0pvMD/pKRBabXWIfD2l3ID
	qnYSjjYVEMMDlw6o6tuCTNamLwTREILJfKZjfzoAR7/YOPaDzQcdKIVmq4v1VlcggdLhV9GWdL9fA
	EABlmT1+FkKiv0THELPTZ4vyP90QquZ9z6MMM/xaIDzw/hWMXVVCfMgkf7lu3riTvwqNBu6rN49Ii
	BNbL06AkuUBVwuAlNUUfAgPNzpNrzhyaWqSNG3ZLXh/bHoDtV1oIrd8MoaeXGoL5LXO0cefx0Wohp
	QC4KcvYlUJRmYZlW75dCr5IrKzbnQZWgO+yUdK1IuxdDF8WrW6DgvTQ3gyBcipWWHqrzZaypmycT2
	qjdBHbfQ==;
Received: from localhost ([::1]:33106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j4NWC-00AZPf-Dq; Wed, 19 Feb 2020 11:27:52 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:38581) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j4NW7-00AZPY-Ej
 for samba-technical@lists.samba.org; Wed, 19 Feb 2020 11:27:49 +0000
Received: by mail-lf1-x144.google.com with SMTP id r14so17148101lfm.5
 for <samba-technical@lists.samba.org>; Wed, 19 Feb 2020 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b3ZuJIHsBIEttBuV28MNG9EzVs8aluiF8mFxqt0QOKY=;
 b=jhhFWKQI23ztUamvb9PslXrFPixr1QfTauQ3/Km5QmzbseDtIrMnocK2yI1XC8I67v
 3HCRwB5w/yHsKL/VIaF0bOQshrmu5G7FyVwonwhwS3ymCKibo4Vfa5WCd8n+jM25ox4T
 SX2CPaICzISDhyBaF+tr1ieoQ8KXWdQ6WNU8QQq50eTOJCAgl37Urnq4K8vGTnBnGZZy
 VqmlZ1/3osM4kaElmhctk5oitfMzB7NHEmsF/5ghZdD7sgrO52MTKtFqqGMIPS/dIWoB
 X/P7g5LoJcqwfO3LtyCNQz67/hu3KzFLLi2GVkEULiiwcLzZCN0MMuOrT3Hraja33tKV
 D2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b3ZuJIHsBIEttBuV28MNG9EzVs8aluiF8mFxqt0QOKY=;
 b=GGuBPvc0oQzNF0FxcUbr0YNuRq1mZyuXx4aJhh051OkWaUkGBYMHqoIEY61QzjplgE
 ksIdDzbQHr3V12CvHF/OePmkOSZSQzyBH6pqE/Wkv7RagZdlnvPrVulJ5qC6V1LZfkBS
 mO4X2lOwXy5YIZRUC7I6UTClrZ90MWgqTxCyOZpIoS6W+/4j7SWpDEiSDLSdOolDCOxa
 63BkKPbgUNvbBZSCnsfDvv+aDdhP5Iidx4IApq9zLzTBxS0PQdQZLMukSGuxqNWdzJF3
 vULzuyFJEobivUZ2d/t9qaeZRNzQits7tGg92rrWiABgnv5iCMl3Bqy4JAlV/mmedgTM
 0xAw==
X-Gm-Message-State: APjAAAVvAvQbW7gTTFho1IM9TbBX6jGEm0IwP+kYDd72PqJr4yQSw07k
 10q3eoa99w1cuwi3iYW+BXMADXgiv+FHsEkOMLs=
X-Google-Smtp-Source: APXvYqyMPO0qb+vyLxMVE0jiM+fxQhUEUS8E355lNwIXlrLFL7ySoWOhNXpdCUFadaCYiJt+DU+oGTIpNa27QV2MNE4=
X-Received: by 2002:ac2:5f65:: with SMTP id c5mr11699477lfc.207.1582111663128; 
 Wed, 19 Feb 2020 03:27:43 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
In-Reply-To: <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
Date: Wed, 19 Feb 2020 12:27:31 +0100
Message-ID: <CAC-fF8RB99k4YXuXpCRqZoN-L7G2q603cnPa5vE43boNXaj23w@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samba.org> wrote:
>
> Am 18.02.20 um 17:06 schrieb Isaac Boukris:
> > Hi,
> >
> > I tested net-ads-search from a joined machine configured with "ldap
> > ssl ads = yes", and it works once I also set "client ldap sasl
> > wrapping = plain".
> >
> > However it doesn't work when I configure the DC to require
> > channel-binding with LdapEnforceChannelBinding=2 as per ADV190023.
>
> I think that's expected, can you paste the error message?
>
> Is it possible to reproduce with ldbsearch as well?
>
> But do the default settings still work?

To be clear samba default will work since it does not use TLS (also,
simple authentication over TLS is not impacted either).

> > Has anyone looked into channel-binding or has any idea what is needed
> > to implement in samba (or upstream) for this to work?
> > Is there other ldap client code in samba that would also be impacted?
>
> I looked at it a bit, see
> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=ac8fd11f1d4b9deb48d6c7942af0c83b52d69d7f
>
> I think we need input from dochelp to answer 2 questions:
> 1. which kind of channel bindings are expected/used by windows?
>    I assume tls-server-end-point. I guess MS-ADTS would be the place
>    to define these details for ldaps.

This blog also suggests it's tls-server-end-point (about HTTP) :
https://docs.microsoft.com/en-us/archive/blogs/openspecification/ntlm-and-channel-binding-hash-aka-extended-protection-for-authentication

