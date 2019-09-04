Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1EA96B4
	for <lists+samba-technical@lfdr.de>; Thu,  5 Sep 2019 00:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=12a97yUcQcDYbkCwMjh0JlQHwlc8e+RXkz3Eidczepo=; b=4Hh2H43IfXNZFg3z0xkgCsMJJC
	FH085MG8hbQ1TS59sFBR15OnCiIqkXzyHnyBtCZfCN5o2WLJ6zCpWmspnJOAZ1lW3ItaXg+KclvIz
	Xi0foUp0iol9DG82nkDE+t08RQePOnY7PGILYzpI3GzwQ9jh48WWGpX3kQ/RaivPDEh02uh/0hkj6
	Ydt5kAZz88lZCpitivYDEMGwYmfZt9QIFU5yvcBhaVcLUSSqJeTI1cD5fCWMMbwOiqNHK0jikmxOv
	+hh3vnAtRzhjx7qt4QVund/rMaseWo7B7ngX0D4fv/y6e6C97oQPBs2jVcqMpaykCPCmLn8m7a4dU
	mP3Ch4Ng==;
Received: from localhost ([::1]:51078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5e3W-003Uly-Vg; Wed, 04 Sep 2019 22:47:15 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:44615) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5e3N-003Ulr-2r
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 22:47:12 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id w195so172945vsw.11
 for <samba-technical@lists.samba.org>; Wed, 04 Sep 2019 15:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=12a97yUcQcDYbkCwMjh0JlQHwlc8e+RXkz3Eidczepo=;
 b=kkffzPA+TI/rzzqsjAy4bbOS6uGpL/qOLQSGZdQtPQ+EMfnPSsds1etHoikqVlUc/D
 ko7d6rQZmkJ37qJoPmy1KVn9NoS5wdG2uA43MgRaqQ7F01s6rsIyEb6cpqqBnqr/BqXS
 eYr8hNrEXaSXFRZBYRhJ7i1LXGsxoGkBob2z2pmLM6cmJ08ovFxu9QFsOvkRdk8USiCB
 9m71xMLShvPdQwNhGnV8V9dmyXog9M6oczl4B2DfKSGjK8BwrAcuSmIHMs812GMiSGQv
 zDHIbl8YUax2tKolUX7PEcKeMHNPgPXiHtR94hPDs3O+7A0aozphnIqKmYLSziJaxp2S
 fwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=12a97yUcQcDYbkCwMjh0JlQHwlc8e+RXkz3Eidczepo=;
 b=AChH3ds1NWa1un1nBRfSfhnj3z+ezGjHbJ0Vv9mxk9aeeHNoLzk0ZO4vsUwp8vr3b5
 GHOMOKzebAQJifxSSZTOAl5+fCCJoPtVm/TYwWTXrUfdguZ1AL8QPULlht8jp7kvZDjO
 copmjZ9CVk2PtG0Au3T2xXZXwJNGSRpB7MtNXmauExNoUsKr62feiC9SY3o6Hs7x2CMx
 6ZEJQym8vt9tensgENR0H9TOOzZko4Gf5tEtQW1NmONdGPAOwAl7WtwysWvVG+sop2Hk
 wbBBT95nT75lva14+sekQelWnWtx5LVWFdepMjc7YEMX6iMShAiNr1bYW1eK92LZ+LgR
 ddsA==
X-Gm-Message-State: APjAAAW80EtLpLRJl44VNeLnBFAWToNcE7/p8RTEtQUcz8+JSw4komU+
 RWAnU75CXQocO6sKSeZzbiflnBXOUfF73AwtgQfhAw==
X-Google-Smtp-Source: APXvYqwta6cPdzV5f1Rp4G3fCTCUJLd2DDuLbMDe8oEVxOlIqDQdySNWl8spfffKY9hmay7MKMYl5Xbvn2k2gUaIGWs=
X-Received: by 2002:a67:e447:: with SMTP id n7mr175124vsm.66.1567637219309;
 Wed, 04 Sep 2019 15:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
 <CAOCN9rw95H1SAZr+CSGQyuOVBgJAUysGuHazxwWQUN4=kDFfnA@mail.gmail.com>
 <19181593-9e9d-2819-62c9-e87b5ab8d6b1@samba.org>
In-Reply-To: <19181593-9e9d-2819-62c9-e87b5ab8d6b1@samba.org>
Date: Wed, 4 Sep 2019 18:46:46 -0400
Message-ID: <CAOCN9rypK7x3Rj0dHQWRY=zVpi4EDSxjVfBRJekz65ksURvKog@mail.gmail.com>
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for 4.11?
To: Rowland penny <rpenny@samba.org>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 4, 2019 at 8:07 AM Rowland penny <rpenny@samba.org> wrote:

> Given that the default in smb.conf for  'encrypt passwords' is 'yes' and
> has been so since (at least) Samba 3.6.x, deprecating it will not change
> anything and removing it, not much more.
>
> In case you haven't guessed by now, I am all for the removal, who thinks
> it is a good idea to send unencrypted passwords over the lan ?
>
> Rowland

People who wanted to be able to sniff them, or comply with requests to
sniff them. They still do, and send passwords in plain text, and send
clients passwords rather than send them a way to set a password.

