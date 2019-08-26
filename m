Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C869D5CE
	for <lists+samba-technical@lfdr.de>; Mon, 26 Aug 2019 20:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SnefcUqUaAiIr5QsWc4YhhG+2/NAzDH62nXxOI30sfY=; b=uBdAs5lffReYC7x2ipWti4oCp5
	M5k6F0WH8JdHQkDCKToBFmO5TI6ijvljjGNU7HA+QGyDJj3w+xjJCK7iSiTjtzMHGKPGyHxDLjsUC
	7skXe/IFj5I10++lbmpGdu77rvET9w1b4fSczPVIZ6VAtlwhkqp27K1rpzEjkXhZsl6ZrPnVARNqE
	MjHxbe/8oGcvtHaEbcZ3e+i/GQXtaA7gyTHXfcnuePjxY+jf8Y1kxyeFHbf2qtK7ne0iE5bDwkmqg
	El1XQ5UBiy0+SY6i2xq68Jgf69C8GD75WHPda9wXWvBuJUOsWePpkdX7dCazLRdtmkeJevEifjBzg
	1p3oWOrw==;
Received: from localhost ([::1]:27998 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2Jhx-008Vp4-Fd; Mon, 26 Aug 2019 18:27:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44818) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2Jht-008Vow-1O
 for samba-technical@lists.samba.org; Mon, 26 Aug 2019 18:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=SnefcUqUaAiIr5QsWc4YhhG+2/NAzDH62nXxOI30sfY=; b=Emk7LbQkTBvz7rgW2bgo4bNKkO
 BS3ZTm/2B59BhE+R7az4aKTSsFNIhVooaG3JfW0gBLxnmpzItmws9ENpnrvHiJmz137cfF1ghftl2
 EOh95aV79YID3zdRb8867JkL2W/+orhhnResKpXFd7ltK86pAftgd2T+CSz/k0lB8chg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2Jhq-0000za-Oc; Mon, 26 Aug 2019 18:27:07 +0000
Message-ID: <eaf9a97bd517e0b12b871fd5175759e86aa24c53.camel@samba.org>
Subject: Re: ldb test test_guid_indexed_v1_db fails on ppc64le
To: Lukas Slebodnik <lslebodn@fedoraproject.org>, 
 samba-technical@lists.samba.org, Aaron Haslett
 <aaronhaslett@catalyst.net.nz>
Date: Tue, 27 Aug 2019 06:27:01 +1200
In-Reply-To: <20190826112911.GA2711905@10.4.128.1>
References: <20190826112911.GA2711905@10.4.128.1>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-08-26 at 13:29 +0200, Lukas Slebodnik via samba-technical
wrote:
> ehlo,
> 
> The repack unit test failed just only on ppc64le with ldb-2.0.5
> Other architectures are ok
> https://koji.fedoraproject.org/koji/taskinfo?taskID=37286196
> 
https://kojipkgs.fedoraproject.org//work/tasks/6219/37286219/build.log
> 
> BTW it would be good to suppress error messages
> "MDB_INVALID: File is not an LMDB file".
> I could see them also on x86_64
> 

Sadly LMDB is not portable across endian or word length boundaries. 

The only way to fix this is to store a LE version of the LDB file and
detect which to use.  We don't hit the word length issue because we
lock this to 64 bit only so far.

Do you think you could have a go at that?

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




