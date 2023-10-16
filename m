Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D447CB159
	for <lists+samba-technical@lfdr.de>; Mon, 16 Oct 2023 19:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=yLqLiO937F4b67IKVnxwlg7DScyO6XZyFuWgKPb++No=; b=fbGvtdIzR1PAEzqiVAmqrkhYV0
	NVU0sw3z2WXGhkAPuQaXrSwiM3AWo0TVqhoS1o5lFfSqqY5X+uq1USfUR93Guk7jh4UJg2Jzmu7Bf
	qk2VDIgBVKMVmlGmUSWYCvZzdXyIUD6+B1sAA8342+CV5b7NJec9ShizNlSuCdU6V7R2SxFvQGUl6
	Y+XC0MvmVhe/+3iQxdFRnevfA1nrKQMKhXp0BzjIDWtv56yajU4vVNY6I0GzewZvH7SsdhLUSh9Hk
	NkVagc2m8iKOmpfdBlCfcoQmDwrA3UiD2WJNPOJ+QAeLOHeVkaEPP3DVo/H+b4s9F8SuwZlv4MP5b
	EFo9PpBg==;
Received: from ip6-localhost ([::1]:54764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qsRQi-000hlg-Tx; Mon, 16 Oct 2023 17:31:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1]:42738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qsRQe-000hlX-O7
 for samba-technical@lists.samba.org; Mon, 16 Oct 2023 17:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yLqLiO937F4b67IKVnxwlg7DScyO6XZyFuWgKPb++No=; b=L1zCkWf6sNpT4565aixenhdGzR
 DJ47v2X4sBmxJbecCe3NUKOhIUzK0Si5HChZCsFnKqdAnVlwGMP7X1pSG+gvuG2rG7GGrPYpeOqf8
 l0J7ExE2vIDMc2A+p3JTK6Qwcu2sZN+lNB/MyNqg7RjBaik+S7XUT9gPVA46uclofeXWPU109y2Xs
 eTABCOwFjsEe4+MOdk4YiF2j7UQYtih2hRWh/4hS5BFFje0KFHYSN9+4ilxnP/6zdl8LD/G+PeiM3
 QeW+uUzICWEHeWXUyPP47eaZdg6CeP2/2cZbpCc662thbzWxh3J7dI8MRlYtrhB5ATDzanIkAwXB6
 gJ+UWNEQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qsRQY-007NmB-Gn; Mon, 16 Oct 2023 17:30:50 +0000
Date: Mon, 16 Oct 2023 18:30:50 +0100
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH][SMB3 client] fix touch -h of symlink
Message-ID: <ZS1zSoRwv+yr5BHS@casper.infradead.org>
References: <CAH2r5mui-uk5XVnJMM2UQ40VJM5dyA=+YChGpDcLAapBTCk4kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5mui-uk5XVnJMM2UQ40VJM5dyA=+YChGpDcLAapBTCk4kw@mail.gmail.com>
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
From: Matthew Wilcox via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matthew Wilcox <willy@infradead.org>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 16, 2023 at 12:26:23PM -0500, Steve French wrote:
> For example:
>           touch -h -t 02011200 testfile
>     where testfile is a symlink would not change the timestamp, but
>           touch -t 02011200 testfile
>     does work to change the timestamp of the target
> 
> Looks like some symlink inode operations are missing for other fs as well

Do we have an xfstests for this?


